import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:resume_crafter/app/resources/spacings.dart';
import 'package:resume_crafter/l10n/l10n.dart';
import 'package:resume_crafter/router/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appName),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            children: [
              MenuButton(
                iconData: Icons.create,
                title: context.l10n.createResume,
                onTap: () {
                  context.router.push(const CreateResumeRoute());
                },
              ),
              MenuButton(
                iconData: Icons.format_list_bulleted,
                title: context.l10n.myResumes,
                onTap: () {},
              ),
              MenuButton(
                iconData: Icons.lightbulb,
                title: context.l10n.tips,
                onTap: () {},
              ),
              MenuButton(
                iconData: Icons.account_circle_rounded,
                title: context.l10n.profile,
                onTap: () {},
              ),
              MenuButton(
                iconData: Icons.settings,
                title: context.l10n.settings,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    required this.iconData,
    required this.title,
    required this.onTap,
    super.key,
  });

  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            Spacings.s16,
            Text(title),
          ],
        ),
      ),
    );
  }
}
