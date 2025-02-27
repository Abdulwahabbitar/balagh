import 'package:flutter/material.dart';

import 'core/injection/injection_container.dart';
import 'features/Main/my_app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFeaturesDependencies();
  return runApp(MyApp());
}
