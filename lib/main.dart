import 'package:exercise_app/core/di/injection_container.dart' as di;
import 'package:exercise_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:screentasia/screentasia.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();

  runApp(
     ScreentasiaInit(
      builder: (context, child){
        return MyApp();
      }));      
}




