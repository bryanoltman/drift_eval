import 'package:drift_eval/add_entity_dialog.dart';
import 'package:drift_eval/employees_page.dart';
import 'package:drift_eval/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  Future<void> showAddJobDialog() async {
    return showAddEntityDialog(
      context: context,
      title: 'Add Job',
      onSubmit: (db, name) async {
        await db.addJob(name);
      },
    );
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
      floatingActionButton: FloatingActionButton(
        onPressed: showAddJobDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
