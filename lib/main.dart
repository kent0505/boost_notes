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
import 'src/features/note/bloc/note_bloc.dart';
import 'src/features/note/data/note_repository.dart';
import 'src/features/note/models/note.dart';
import 'src/features/onboard/data/onboard_repository.dart';
import 'src/features/tag/bloc/tag_bloc.dart';
import 'src/features/tag/data/tag_repository.dart';
import 'src/features/tag/models/tag.dart';

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
      baseUrl: dotenv.env['BASE_URL'] ?? '',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 10),
      validateStatus: (status) => true,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  logger(dio.hashCode);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<OnboardRepository>(
          create: (context) => OnboardRepositoryImpl(prefs: prefs),
        ),
        RepositoryProvider<NoteRepository>(
          create: (context) => NoteRepositoryImpl(db: db),
        ),
        RepositoryProvider<TagRepository>(
          create: (context) => TagRepositoryImpl(db: db),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
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
