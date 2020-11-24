import 'package:get_it/get_it.dart';

final services = GetIt.instance;

Future<void> initServices() async {
  // await Firebase.initializeApp();

  // services..registerSingleton(FirebaseFirestore.instance);
}

extension Services on GetIt {
  // Firebase:
  // FirebaseFirestore get firebaseFirestore => get<FirebaseFirestore>();
}
