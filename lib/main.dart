import 'package:drift_eval/employees_page.dart';
import 'package:flutter/material.dart';

import 'package:drift_eval/models.dart';
import 'package:provider/provider.dart';

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
  @override
  void initState() {
    super.initState();
    final db = Provider.of<MyDatabase>(context, listen: false);
    db.allJobs.first.then((allJobs) {
      if (allJobs.isEmpty) {
        db.addJob('SWE');
        db.addJob('Manager');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<MyDatabase>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs'),
      ),
      body: StreamBuilder<List<Job>>(
        stream: db.allJobs,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(data[index].title),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => EmployeesPage(
                    job: data[index],
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.length,
          );
        },
      ),
    );
  }
}
