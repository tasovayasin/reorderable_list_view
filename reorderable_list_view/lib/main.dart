import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<String> items = ["A", "B", "C", "D", "E", "F", "G", "H"];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: ReorderableListView(
        padding: const EdgeInsets.fromLTRB(50, 120, 50, 0),
        children: [
          for (int index = 0; index < items.length; index += 1)
            Card(
              color: Colors.green,
              key: Key('$index'),
              child: ListTile(
                title: Text(items[index]),
              ),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final String item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
