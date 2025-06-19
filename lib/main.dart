import 'package:balancedmeal/core/utils/router_screen.dart';
import 'package:balancedmeal/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BlancedMeal());
}

class BlancedMeal extends StatelessWidget {
  const BlancedMeal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Balanced Meal',
      debugShowCheckedModeBanner: false,
      routerConfig: RouterScreen.router,
    );
  }
}
