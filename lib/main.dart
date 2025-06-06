// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/customer_provider.dart';
import 'providers/activity_provider.dart';
import 'providers/visit_provider.dart';
import 'views/visit_list_screen.dart';
import 'views/add_visit_screen.dart';
import 'views/visit_details_screen.dart';
import 'views/statistics_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CustomerProvider()),
        ChangeNotifierProvider(create: (_) => ActivityProvider()),
        ChangeNotifierProvider(create: (_) => VisitProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visitss Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const VisitListScreen(),
        '/add_visit': (context) => const AddVisitScreen(),
        '/visit_details': (context) => const VisitDetailsScreen(),
        '/statistics': (context) => const StatisticsScreen(),
      },
    );
  }
}