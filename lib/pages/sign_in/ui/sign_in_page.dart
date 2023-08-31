import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key, this.onLoginResult});

  // ignore: avoid_positional_boolean_parameters
  final void Function(bool isLoggedIn)? onLoginResult;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
