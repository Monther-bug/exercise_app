import 'package:device_preview/device_preview.dart';
import 'package:exercise_app/core/di/injection_container.dart' as di;
import 'package:exercise_app/my_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:screentasia/screentasia.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 

  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();

  runApp(
     ScreentasiaInit(
      builder: (context, child){
        return DevicePreview(enabled: !kReleaseMode,
          // This builder gives us the 'context' containing the selected language
          builder: (context) => MyApp(
            // We pass the locale from DevicePreview to MyApp
            locale: DevicePreview.locale(context), 
          ),);
      }));      
}




