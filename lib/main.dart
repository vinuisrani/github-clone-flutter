import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:github_app/Authentication/auth.dart';
import 'package:github_app/Home.dart';
import 'features/home/view/home_view.dart';
import 'core/extensions/app_extensions.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'firebase_options.dart';

// void main() => runApp(
//       DevicePreview(
//         builder: (_) => const MyApp(),
//         enabled: false,
//       ),
//     );

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: NavigationRoute.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Github App',
      theme: _theme(context),
      home: MyHomePage(),
    );
  }

  ThemeData _theme(BuildContext context) => ThemeData(
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: context.textColor),
      );
}
