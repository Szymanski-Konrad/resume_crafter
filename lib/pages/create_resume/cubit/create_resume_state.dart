import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume/models/resume.dart';
import 'package:resume_crafter/l10n/l10n.dart';

part 'create_resume_state.freezed.dart';

enum CreateResumeStep implements Comparable<CreateResumeStep> {
  personalInfo(position: 0),
  introduceMe(position: 1),
  workExperience(position: 2),
  skills(position: 3),
  education(position: 4),
  links(position: 5),
  languages(position: 6),
  projects(position: 7),
  references(position: 8),
  contact(position: 9),
  hobbies(position: 10),
  publications(position: 11),
  certificates(position: 12),
  additionalSections(position: 13),
  rodo(position: 14);

  const CreateResumeStep({
    required this.position,
  });

  final int position;

  String name(BuildContext context) {
    return switch (this) {
      CreateResumeStep.personalInfo => context.l10n.personalInfo,
      CreateResumeStep.introduceMe => context.l10n.introduceMe,
      CreateResumeStep.workExperience => context.l10n.workExperience,
      CreateResumeStep.skills => context.l10n.skills,
      CreateResumeStep.education => context.l10n.education,
      CreateResumeStep.links => context.l10n.links,
      CreateResumeStep.languages => context.l10n.langugages,
      CreateResumeStep.projects => context.l10n.projects,
      CreateResumeStep.references => context.l10n.references,
      CreateResumeStep.contact => context.l10n.contact,
      CreateResumeStep.hobbies => context.l10n.hobbies,
      CreateResumeStep.publications => context.l10n.publications,
      CreateResumeStep.certificates => context.l10n.certificates,
      CreateResumeStep.additionalSections => context.l10n.additionalSections,
      CreateResumeStep.rodo => context.l10n.rodo,
    };
  }

  @override
  int compareTo(CreateResumeStep other) => position - other.position;
}

extension CreateResumeStepExt on CreateResumeStep {
  static CreateResumeStep get first => CreateResumeStep.values.first;

  static CreateResumeStep get last => CreateResumeStep.values.last;

  bool get canGoBack => this != first;

  bool get canGoNext => this != last;
}

enum CreateResumeStage {
  selectSections,
  fillSections,
  sumUp,
}

@freezed
class CreateResumeState with _$CreateResumeState {
  factory CreateResumeState({
    @Default(CreateResumeStage.selectSections) CreateResumeStage stage,
    @Default(CreateResumeStep.personalInfo) CreateResumeStep currentStep,
    @Default([]) List<CreateResumeStep> selectedSteps,
    Resume? resume,
  }) = _CreateResumeState;
}

extension CreateResumeStateExtension on CreateResumeState {
  bool get canNext => currentStep.position < selectedSteps.last.position;

  bool get canBack => currentStep.position > selectedSteps.first.position;

  int get currentIndex => selectedSteps.indexOf(currentStep);

  int get currentStepNumber => currentIndex + 1;

  int get totalSteps => selectedSteps.length;
}
