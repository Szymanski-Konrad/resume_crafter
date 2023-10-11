import 'package:flutter/material.dart';
import 'package:phonenumbers/phonenumbers.dart';
import 'package:resume_crafter/data/resume/models/resume.dart';
import 'package:resume_crafter/features/validators/validators.dart';
import 'package:resume_crafter/l10n/l10n.dart';
import 'package:resume_crafter/pages/create_resume/cubit/create_resume_state.dart';
import 'package:resume_crafter/widgets/create_resume_navigation.dart';

class StepView extends StatelessWidget {
  const StepView({
    required this.step,
    required this.onValidate,
    required this.resume,
    super.key,
  });

  final CreateResumeStep step;
  final Resume? resume;
  final void Function(dynamic) onValidate;

  @override
  Widget build(BuildContext context) {
    return switch (step) {
      CreateResumeStep.additionalSections => const Placeholder(),
      CreateResumeStep.certificates => const Placeholder(),
      CreateResumeStep.contact => const Placeholder(),
      CreateResumeStep.education => const Placeholder(),
      CreateResumeStep.hobbies => const Placeholder(),
      CreateResumeStep.introduceMe => const Placeholder(),
      CreateResumeStep.languages => const Placeholder(),
      CreateResumeStep.links => const Placeholder(),
      CreateResumeStep.personalInfo => PersonalInfoStepView(
          onValidate: onValidate,
          personalInfo: resume?.personalInfo,
        ),
      CreateResumeStep.projects => const Placeholder(),
      CreateResumeStep.publications => const Placeholder(),
      CreateResumeStep.references => const Placeholder(),
      CreateResumeStep.rodo => const Placeholder(),
      CreateResumeStep.skills => const Placeholder(),
      CreateResumeStep.workExperience => const Placeholder(),
    };
  }
}

class PersonalInfoStepView extends StatefulWidget {
  const PersonalInfoStepView({
    required this.onValidate,
    this.personalInfo,
    super.key,
  });

  final void Function(dynamic) onValidate;
  final PersonalInfo? personalInfo;

  @override
  State<PersonalInfoStepView> createState() => _PersonalInfoStepViewState();
}

class _PersonalInfoStepViewState extends State<PersonalInfoStepView> {
  final _formKey = GlobalKey<FormState>();
  late final PhoneNumberEditingController _controller;

  VoidCallback? test;

  @override
  void initState() {
    super.initState();
    _controller = PhoneNumberEditingController.fromCountryCode(
      'US',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Full name',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    final result = Validators.validateNonEmpty(value);
                    return result.validationResult(context);
                  },
                ),
                PhoneNumberFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _controller,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    final result = Validators.validateEmail(value);
                    return result.validationResult(context);
                  },
                )
              ],
            ),
          ),
          CreateResumeNavigation(
            formKey: _formKey,
            onSaveData: () {},
          ),
        ],
      ),
    );
  }
}
