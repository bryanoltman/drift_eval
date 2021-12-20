import 'package:drift_eval/add_entity_dialog.dart';
import 'package:drift_eval/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DogsPage extends StatefulWidget {
  const DogsPage({Key? key}) : super(key: key);

  @override
  _DogsPageState createState() => _DogsPageState();
}

class _DogsPageState extends State<DogsPage> {
  Future<void> showAddDogDialog() async {
    return showAddEntityDialog(
      context: context,
      title: 'Add Dog',
      onSubmit: (db, name) => db.addDog(name: name, goesToHeaven: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<MyDatabase>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogs'),
      ),
      body: StreamBuilder<List<Dog>>(
        stream: db.allDogs,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(
                  '${data[index].name} (Goes to heaven? ${data[index].goesToHeaven})'),
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDogDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
