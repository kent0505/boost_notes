import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../bloc/auth_bloc.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.onLogout});

  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Container(
            height: 52,
            width: 52,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffE5D9FD),
            ),
            child: Center(
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final initials = state.fullName
                      .trim()
                      .split(RegExp(r'\s+'))
                      .where((e) => e.isNotEmpty)
                      .map((e) => e[0].toUpperCase())
                      .take(2)
                      .join();

                  return Text(
                    initials,
                    style: const TextStyle(
                      color: Color(0xff1A2969),
                      fontSize: 20,
                      fontFamily: AppFonts.w500,
                      height: 1.2,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Text(
                      state.fullName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xff1A2969),
                        fontSize: 20,
                        fontFamily: AppFonts.w600,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 2),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Text(
                      state.email,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xff1A2969),
                        fontSize: 12,
                        fontFamily: AppFonts.w500,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Button(
            onPressed: onLogout,
            child: const SvgWidget(Assets.logout),
          ),
        ],
      ),
    );
  }
}
