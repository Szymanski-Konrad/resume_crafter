/// Class with configuration secrets for appwrite
abstract class AppwriteConstants {
  const AppwriteConstants._();

  /// Endpoint for appwrite api calls
  static const String endpoint = String.fromEnvironment('ENDPOINT');

  /// Appwrite project ID
  static const String projectId = String.fromEnvironment('PROJECTID');
}
