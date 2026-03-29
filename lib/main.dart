import 'package:exercise_app/core/di/injection_container.dart' as di;
import 'package:exercise_app/my_app.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await di.init();
  runApp(const MyApp());
}




