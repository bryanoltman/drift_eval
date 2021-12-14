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
  Future<void> showAddEmployeeDialog() async {
    final textController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          final db = Provider.of<MyDatabase>(context, listen: false);
          return AlertDialog(
            title: const Text('New Employee'),
            content: TextField(
              controller: textController,
            ),
            actions: [
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: Navigator.of(context).pop,
              ),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () async {
                  await db.addEmployee(
                    name: textController.text,
                    jobId: widget.job.id,
                  );
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

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
