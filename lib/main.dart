import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

import 'src/core/router.dart';
import 'src/core/themes.dart';
import 'src/core/utils.dart';
import 'src/core/widgets/gradient_bg.dart';
import 'src/features/auth/bloc/auth_bloc.dart';
import 'src/features/auth/data/auth_repository.dart';
import 'src/features/chat/bloc/chat_bloc.dart';
import 'src/features/chat/data/chat_repository.dart';
import 'src/features/note/bloc/note_bloc.dart';
import 'src/features/note/data/note_repository.dart';
import 'src/features/note/models/note.dart';
import 'src/features/onboard/data/onboard_repository.dart';
import 'src/features/settings/data/settings_repository.dart';
import 'src/features/tag/bloc/tag_bloc.dart';
import 'src/features/tag/data/tag_repository.dart';
import 'src/features/tag/models/tag.dart';
import 'src/features/vip/bloc/vip_bloc.dart';
import 'src/features/vip/data/vip_repository.dart';

// final colors = Theme.of(context).extension<MyColors>()!;

// adb tcpip 5555 && adb connect 192.168.0.190

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();

  final path = join(await getDatabasesPath(), 'data.db');
  // await deleteDatabase(path);

  final db = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      logger('CREATE');

      await db.execute(Note.create);
      await db.execute(Tag.create);
    },
  );

  await dotenv.load();

  final dio = Dio(
    BaseOptions(
      // baseUrl: dotenv.env['BASE_URL'] ?? '',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 10),
      validateStatus: (status) => true,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(dio: dio),
        ),
        RepositoryProvider<OnboardRepository>(
          create: (context) => OnboardRepositoryImpl(prefs: prefs),
        ),
        RepositoryProvider<SettingsRepository>(
          create: (context) => SettingsRepositoryImpl(prefs: prefs),
        ),
        RepositoryProvider<VipRepository>(
          create: (context) => VipRepositoryImpl(prefs: prefs),
        ),
        RepositoryProvider<NoteRepository>(
          create: (context) => NoteRepositoryImpl(db: db),
        ),
        RepositoryProvider<TagRepository>(
          create: (context) => TagRepositoryImpl(db: db),
        ),
        RepositoryProvider<ChatRepository>(
          create: (context) => ChatRepositoryImpl(dio: dio),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              repository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => VipBloc(
              repository: context.read<VipRepository>(),
            )..add(CheckVip()),
          ),
          BlocProvider(
            create: (context) => NoteBloc(
              repository: context.read<NoteRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => TagBloc(
              repository: context.read<TagRepository>(),
            )..add(LoadTags()),
          ),
          BlocProvider(
            create: (context) => ChatBloc(
              repository: context.read<ChatRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: theme,
          routerConfig: routerConfig,
          builder: (context, child) {
            return GradientBg(child);
          },
        ),
      ),
    ),
  );
}
