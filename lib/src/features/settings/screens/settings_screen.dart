import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../../../core/widgets/icon_btn.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../auth/widgets/profile_card.dart';
import '../../chat/screens/chat_screen.dart';
import '../../note/screens/call_recording_screen.dart';
import '../../vip/widgets/upgrade_button.dart';
import '../../vip/widgets/vip_status.dart';
import 'translate_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const routePath = '/SettingsScreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void onLogout() async {
    final signIn = GoogleSignIn.instance;
    await signIn.initialize(
      serverClientId: dotenv.env['SERVER_CLIENT_ID'] ?? '',
    );

    try {
      final auth = await signIn.authenticate();

      logger(auth.id);
      logger(auth.email);
    } catch (e) {
      logger(e);
    }
    // DialogWidget.show(
    //   context,
    //   title: 'Are sure you want to sign out?',
    //   subtitle:
    //       'This action will permanently delete your account and all associated data. This cannot be undone.',
    //   buttonTexts: ['Cancel', 'Sign out'],
    //   buttonColors: [const Color(0xff2581CE), const Color(0xffCA373F)],
    //   onPresseds: [
    //     () {
    //       context.pop();
    //     },
    //     () {
    //       context.read<AuthBloc>().add(LogoutEvent());
    //       context.pop();
    //     },
    //   ],
    // );
  }

  void onDeleteAccount() {
    DialogWidget.show(
      context,
      title: 'Are sure you want to delete your account?',
      subtitle:
          'This action will permanently delete your account and all associated data. This cannot be undone.',
      buttonTexts: ['Cancel', 'Delete'],
      buttonColors: [const Color(0xff2581CE), const Color(0xffCA373F)],
      onPresseds: [
        () {
          context.pop();
        },
        () {},
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 24 + MediaQuery.of(context).viewPadding.top,
          ),
          Row(
            children: [
              const SizedBox(width: 24),
              const Text(
                'Settings',
                style: TextStyle(
                  color: Color(0xff1A2969),
                  fontSize: 22,
                  fontFamily: AppFonts.w600,
                ),
              ),
              const Spacer(),
              IconBtn(
                asset: Assets.close,
                onPressed: () {
                  context.pop();
                },
              ),
              const SizedBox(width: 24),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                ProfileCard(onLogout: onLogout),
                const SizedBox(height: 12),
                const UpgradeButton(),
                const SizedBox(height: 20),
                const _Title(title: 'Account'),
                _Section(
                  children: [
                    const _SettingsTile(
                      title: 'Subscription status',
                      asset: Assets.vip3,
                      right: VipStatus(),
                    ),
                    const _Divider(),
                    _SettingsTile(
                      title: 'Change Language',
                      asset: Assets.language,
                      onPressed: () {
                        context.push(TranslateScreen.routePath);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const _Title(title: 'Help & Support'),
                _Section(
                  children: [
                    _SettingsTile(
                      title: 'How to Record Phone Calls',
                      asset: Assets.phone,
                      onPressed: () {
                        context.push(CallRecordingScreen.routePath);
                      },
                    ),
                    const _Divider(),
                    _SettingsTile(
                      title: 'Contact Support',
                      asset: Assets.support,
                      onPressed: () async {
                        await launchURL(Urls.support);
                      },
                    ),
                    const _Divider(),
                    _SettingsTile(
                      title: 'Chat with AI Assistent',
                      asset: Assets.chat,
                      onPressed: () {
                        context.push(ChatScreen.routePath);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const _Title(title: 'Legal'),
                _Section(
                  children: [
                    _SettingsTile(
                      title: 'Privacy Policy',
                      asset: Assets.privacy,
                      onPressed: () async {
                        await launchURL(Urls.privacy);
                      },
                    ),
                    const _Divider(),
                    _SettingsTile(
                      title: 'Terms of Use',
                      asset: Assets.terms,
                      onPressed: () async {
                        await launchURL(Urls.terms);
                      },
                    ),
                    const _Divider(),
                    _SettingsTile(
                      title: 'Rate us',
                      asset: Assets.rate,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state.fullName.isEmpty) return const SizedBox();

                    return MainButton(
                      title: 'Log Out',
                      onPressed: onLogout,
                    );
                  },
                ),
                const SizedBox(height: 16),
                Button(
                  onPressed: onDeleteAccount,
                  child: const Text(
                    'Delete account',
                    style: TextStyle(
                      color: Color(0xffCA373F),
                      fontSize: 16,
                      fontFamily: AppFonts.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          color: const Color(0xff1A2969).withValues(alpha: 0.77),
          fontSize: 14,
          fontFamily: AppFonts.w500,
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12).copyWith(right: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: children),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      child: Center(
        child: Container(
          height: 1,
          margin: const EdgeInsets.only(left: 48),
          color: const Color(0xffCCCCCC),
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.title,
    required this.asset,
    this.right,
    this.onPressed,
  });

  final String title;
  final String asset;
  final Widget? right;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      minSize: 40,
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SvgWidget(asset),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff1A2969),
                fontSize: 14,
                fontFamily: AppFonts.w500,
              ),
            ),
          ),
          right ?? const SvgWidget(Assets.chevron),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
