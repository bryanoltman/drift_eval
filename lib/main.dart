import 'package:drift_eval/jobs_page.dart';
import 'package:flutter/material.dart';

import 'package:drift_eval/models.dart';
import 'package:provider/provider.dart';

import 'animals_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: MyDatabase(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentTabIndex = 0;

  Widget pageAtTabIndex(int index) {
    if (index == 0) {
      return const Navigator(
        pages: [MaterialPage(child: JobsPage())],
      );
    } else {
      return const Navigator(
        pages: [MaterialPage(child: AnimalsPage())],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageAtTabIndex(_currentTabIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (index) => setState(() {
          _currentTabIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Animals',
          ),
        ],
      ),
    );
  }
}
