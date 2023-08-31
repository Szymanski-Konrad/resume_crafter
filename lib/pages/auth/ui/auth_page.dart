import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:resume_crafter/app/resources/assets.dart';
import 'package:resume_crafter/app/resources/paddings.dart';
import 'package:resume_crafter/app/resources/spacings.dart';
import 'package:resume_crafter/pages/auth/cubit/auth_cubit.dart';
import 'package:resume_crafter/pages/auth/cubit/auth_state.dart';
import 'package:resume_crafter/router/app_router.gr.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(128, 149, 144, 1),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return const _Content();
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  void onSignIn(BuildContext context) => context.router.pushAndPopUntil(
        const HomeRoute(),
        predicate: (_) => false,
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Paddings.all16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset(Assets.auth1)),
            _AuthButton(
              onPressed: () => context.read<AuthCubit>().signInWithGoogle(
                    () => onSignIn(context),
                  ),
              iconData: LineIcons.googleLogo,
              text: 'Connect with Google',
            ),
            Spacings.s8,
            const _AuthButton(
              iconData: LineIcons.linkedin,
              text: 'Connect with LinkedIn',
            ),
            Spacings.s32,
            const _AuthButton(
              iconData: LineIcons.envelope,
              text: 'Connect with Email',
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton({
    required this.iconData,
    required this.text,
    this.onPressed,
  });

  final IconData iconData;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 50),
        backgroundColor: Colors.white,
      ),
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: Colors.blue,
      ),
      label: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
