import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_crafter/app/resources/paddings.dart';
import 'package:resume_crafter/app/resources/spacings.dart';
import 'package:resume_crafter/pages/create_resume/cubit/create_resume_cubit.dart';
import 'package:resume_crafter/pages/create_resume/cubit/create_resume_state.dart';
import 'package:resume_crafter/utils/extensions/widget_extensions.dart';

class CreateResumeNavigation extends StatelessWidget {
  const CreateResumeNavigation({
    required this.formKey,
    required this.onSaveData,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback onSaveData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateResumeCubit, CreateResumeState>(
      builder: (context, state) {
        return Padding(
          padding: Paddings.all8,
          child: Row(
            children: [
              if (state.canBack)
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        onSaveData.call();
                        context.read<CreateResumeCubit>().backToPreviousStep();
                      }
                    },
                    child: const Text('Go back'),
                  ),
                ),
              if (state.canNext) ...[
                Spacings.s36,
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        onSaveData.call();
                        context.read<CreateResumeCubit>().moveToNextStep();
                      }
                    },
                    child: const Text('Next step'),
                  ),
                )
              ],
            ].withSpacing(Spacings.s36),
          ),
        );
      },
    );
  }
}
