import 'package:drift_eval/add_entity_dialog.dart';
import 'package:drift_eval/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatsPage extends StatefulWidget {
  const CatsPage({Key? key}) : super(key: key);

  @override
  _CatsPageState createState() => _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {
  Future<void> showAddCatDialog() async {
    return showAddEntityDialog(
      context: context,
      title: 'Add Cat',
      onSubmit: (db, name) => db.addCat(name: name, numLives: 9),
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<MyDatabase>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats'),
      ),
      body: StreamBuilder<List<Cat>>(
        stream: db.allCats,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title:
                  Text('${data[index].name} (${data[index].numLives} lives)'),
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddCatDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
