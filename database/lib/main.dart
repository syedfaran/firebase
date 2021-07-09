import 'package:database/screens/landing_page.dart';
import 'package:database/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MultiProvider(providers: [
    FutureProvider<FirebaseApp>(create: (context) => Firebase.initializeApp()),
    StreamProvider<User>(create: (context) => FirebaseAuth.instance.authStateChanges()),
    ChangeNotifierProvider(create: (context)=>NavigationState()),
    ChangeNotifierProvider(create: (context)=>FormProvider(),),
    ChangeNotifierProvider(create: (context)=>TabProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoMonoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: LandingPage(),
    );
  }
}
