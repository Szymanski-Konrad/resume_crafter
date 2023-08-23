import 'package:appwrite/appwrite.dart';
import 'package:injectable/injectable.dart';
import 'package:resume_crafter/app/appwrite_constants.dart';

@Injectable()
class AppwriteApiService {
  AppwriteApiService() {
    client
        .setEndpoint(AppwriteConstants.endpoint)
        .setProject(AppwriteConstants.projectId);
    account = Account(client);
    db = Databases(client);
    storage = Storage(client);
  }

  final Client client = Client();
  late Account account;
  late Databases db;
  late Storage storage;
}
