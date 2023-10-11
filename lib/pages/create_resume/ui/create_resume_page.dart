import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_crafter/app/resources/paddings.dart';
import 'package:resume_crafter/app/resources/spacings.dart';
import 'package:resume_crafter/pages/create_resume/cubit/create_resume_cubit.dart';
import 'package:resume_crafter/pages/create_resume/cubit/create_resume_state.dart';
import 'package:resume_crafter/pages/create_resume/ui/step_view.dart';

@RoutePage()
class CreateResumePage extends StatelessWidget {
  const CreateResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateResumeCubit>(
      create: (context) => CreateResumeCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Resume'),
          centerTitle: true,
        ),
        body: const _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateResumeCubit, CreateResumeState>(
      builder: (context, state) {
        return switch (state.stage) {
          CreateResumeStage.selectSections => _SelectSectionsView(state: state),
          CreateResumeStage.fillSections => _FillSectionsView(state: state),
          CreateResumeStage.sumUp => _SumUpView(state: state),
        };
      },
    );
  }
}

class _SumUpView extends StatelessWidget {
  const _SumUpView({required this.state, super.key});

  final CreateResumeState state;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _FillSectionsView extends StatelessWidget {
  const _FillSectionsView({required this.state, super.key});

  final CreateResumeState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(state.currentStep.name(context)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Step ${state.currentStepNumber}'),
            Spacings.s16,
            Text('${state.currentStepNumber} of ${state.totalSteps}')
          ],
        ),
        Spacings.s8,
        LinearProgressIndicator(
          value: state.currentStepNumber / state.totalSteps,
          backgroundColor: Colors.green,
          color: Colors.amber,
          minHeight: 8,
        ),
        Spacings.s8,
        Expanded(
          child: StepView(
            step: state.currentStep,
            resume: state.resume,
            onValidate: context.read<CreateResumeCubit>().onValidate,
          ),
        ),
        Spacings.s8,
      ],
    );
  }
}

class _SelectSectionsView extends StatelessWidget {
  const _SelectSectionsView({required this.state, super.key});

  final CreateResumeState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.all16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: CreateResumeStep.values.length,
              itemBuilder: (context, index) {
                final item = CreateResumeStep.values[index];
                return CheckboxListTile.adaptive(
                  value: state.selectedSteps.contains(item),
                  onChanged: (value) {
                    context.read<CreateResumeCubit>().onSelectStepPressed(item);
                  },
                  title: Text(item.name(context)),
                );
              },
            ),
          ),
          Spacings.s16,
          FilledButton(
            onPressed: context.read<CreateResumeCubit>().onMoveToFillSections,
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
