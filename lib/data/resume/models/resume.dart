import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume.freezed.dart';
part 'resume.g.dart';

@freezed
class PersonalInfo with _$PersonalInfo {
  factory PersonalInfo({
    required String fullName,
    required int mobileNumber,
    required String email,
  }) = _PersonalInfo;

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);
}

enum PersonalLinkType {
  linkedIn,
  playStore,
  appleStore,
  github,
  facebook,
  instagram,
  website,
  other,
}

@freezed
class PersonalLink with _$PersonalLink {
  factory PersonalLink({
    required PersonalLinkType type,
    required String url,
  }) = _PersonalLink;

  factory PersonalLink.fromJson(Map<String, dynamic> json) =>
      _$PersonalLinkFromJson(json);
}

@freezed
class WorkExperience with _$WorkExperience {
  factory WorkExperience({
    required DateTime startDate,
    required String companyName,
    required String jobDescription,
    DateTime? endDate,
  }) = _WorkExperience;

  factory WorkExperience.fromJson(Map<String, dynamic> json) =>
      _$WorkExperienceFromJson(json);
}

enum EducationLevel {
  bachelor,
  master,
  doctorate,
}

@freezed
class Education with _$Education {
  factory Education({
    required DateTime startDate,
    required String school,
    required String topic,
    required EducationLevel educationLevel,
    DateTime? endDate,
    String? description,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}

@freezed
class Publication with _$Publication {
  factory Publication({
    required String title,
    String? url,
    String? description,
  }) = _Publication;

  factory Publication.fromJson(Map<String, dynamic> json) =>
      _$PublicationFromJson(json);
}

@freezed
class Certificate with _$Certificate {
  factory Certificate() = _Certificate;

  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);
}

@freezed
class PersonalProject with _$PersonalProject {
  factory PersonalProject({
    required DateTime startDate,
    required String name,
    DateTime? endDate,
    String? title,
    String? description,
    String? url,
  }) = _PersonalProject;

  factory PersonalProject.fromJson(Map<String, dynamic> json) =>
      _$PersonalProjectFromJson(json);
}

@freezed
class Reference with _$Reference {
  factory Reference() = _Reference;

  factory Reference.fromJson(Map<String, dynamic> json) =>
      _$ReferenceFromJson(json);
}

@freezed
class CustomSection with _$CustomSection {
  factory CustomSection({
    required String title,
    required String description,
  }) = _CustomSection;

  factory CustomSection.fromJson(Map<String, dynamic> json) =>
      _$CustomSectionFromJson(json);
}

enum Language {
  polish,
  english,
}

enum LanguageLevel {
  b2,
  b1,
  c1,
  c2,
  a1,
  a2,
  nativeLevel,
}

@freezed
class LearnedLanguage with _$LearnedLanguage {
  factory LearnedLanguage({
    required Language langugage,
    required String description,
  }) = _LearnedLanguage;

  factory LearnedLanguage.fromJson(Map<String, dynamic> json) =>
      _$LearnedLanguageFromJson(json);
}

@freezed
class Resume with _$Resume {
  factory Resume({
    PersonalInfo? personalInfo,
    @Default([]) List<PersonalLink> links,
    @Default([]) List<WorkExperience> works,
    @Default([]) List<Education> educations,
    @Default([]) List<Publication> publications,
    @Default([]) List<Certificate> certificates,
    @Default([]) List<String> skills,
    @Default([]) List<String> hobbies,
    @Default([]) List<PersonalProject> personalProjects,
    @Default([]) List<Reference> references,
    @Default([]) List<CustomSection> customSections,
    @Default([]) List<LearnedLanguage> learnedLanguages,
  }) = _Resume;

  factory Resume.fromJson(Map<String, dynamic> json) => _$ResumeFromJson(json);
}
