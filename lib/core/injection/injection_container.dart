
import '../../features/authentication/di/dependency_injection.dart';

Future<void> initFeaturesDependencies() async {

  await initAuth();
}