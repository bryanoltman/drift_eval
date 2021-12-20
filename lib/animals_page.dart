import 'package:drift_eval/cats_page.dart';
import 'package:drift_eval/dogs_page.dart';
import 'package:flutter/material.dart';

class AnimalsPage extends StatefulWidget {
  const AnimalsPage({Key? key}) : super(key: key);

  @override
  _AnimalsPageState createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animals'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            if (index == 0) {
              return ListTile(
                title: Text('Cats'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CatsPage()));
                },
              );
            } else {
              return ListTile(
                title: Text('Dogs'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DogsPage()));
                },
              );
            }
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: 2),
    );
  }
}
