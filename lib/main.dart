import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_in_laos/router.dart';

String initialRoute = '/authenticate';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
     FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        initialRoute = '/my_service';
      }
      runApp(MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NotoSerifLao'),
      routes: routes,
      initialRoute: initialRoute,
    );
  }
}
