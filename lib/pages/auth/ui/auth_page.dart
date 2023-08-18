import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume_crafter/app/resources/assets.dart';
import 'package:resume_crafter/app/resources/paddings.dart';
import 'package:resume_crafter/app/resources/spacings.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(128, 149, 144, 1.0),
      body: SafeArea(
        child: Padding(
          padding: Paddings.all16,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.auth1),
              _AuthButton(
                iconData: FontAwesomeIcons.google,
                text: 'Connect with Google',
              ),
              Spacings.s8,
              _AuthButton(
                iconData: FontAwesomeIcons.facebook,
                text: 'Connect with Google',
              ),
              Spacings.s32,
              _AuthButton(
                iconData: FontAwesomeIcons.envelope,
                text: 'Connect with Email',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton({required this.iconData, required this.text});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 50),
        backgroundColor: Colors.white,
      ),
      onPressed: () {},
      icon: Icon(
        iconData,
        color: Colors.blue,
      ),
      label: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
