import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_crafter/pages/create_resume/cubit/create_resume_state.dart';

class CreateResumeCubit extends Cubit<CreateResumeState> {
  CreateResumeCubit()
      : super(
          CreateResumeState(
            selectedSteps: CreateResumeStep.values,
            stage: CreateResumeStage.fillSections,
          ),
        );

  void onSelectStepPressed(CreateResumeStep step) {
    final selectedSteps = List.of(state.selectedSteps);
    if (selectedSteps.contains(step)) {
      emit(state.copyWith(selectedSteps: selectedSteps..remove(step)));
    } else {
      emit(state.copyWith(selectedSteps: selectedSteps..add(step)));
    }
  }

  void onMoveToFillSections() {
    final selectedSteps = List.of(state.selectedSteps);
    emit(
      state.copyWith(
        selectedSteps: selectedSteps..sort(),
        currentStep: selectedSteps.first,
        stage: CreateResumeStage.fillSections,
      ),
    );
  }

  void moveToNextStep() {
    emit(
      state.copyWith(
        currentStep: state.selectedSteps[state.currentIndex + 1],
      ),
    );
  }

  void backToPreviousStep() {
    emit(
      state.copyWith(
        currentStep: state.selectedSteps[state.currentIndex - 1],
      ),
    );
  }

  void onValidate(dynamic isValid) {}
}
