import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi/view_model/view_model.dart';

import 'presentation/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Taxi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
