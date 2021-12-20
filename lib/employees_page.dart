import 'package:drift_eval/add_entity_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models.dart';

class EmployeesPage extends StatefulWidget {
  final Job job;

  const EmployeesPage({Key? key, required this.job}) : super(key: key);

  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  Future<void> showAddEmployeeDialog() async => showAddEntityDialog(
        context: context,
        title: 'Add Employee',
        onSubmit: (db, name) =>
            db.addEmployee(name: name, jobId: widget.job.id),
      );

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<MyDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.job.title),
      ),
      body: StreamBuilder<List<Employee>>(
          stream: db.employeesWithJobId(widget.job.id),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: Text(data[index].name),
              ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: data.length,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddEmployeeDialog,
      ),
    );
  }
}
