import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var input;
  List<dynamic> lst = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                margin: EdgeInsets.only(top: 20),
                child: ListTile(
                  title: Text(
                    "${lst[index]}",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit Item"),
                                    content: TextField(
                                      onChanged: (value) {
                                        input = value;
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {input});
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Edit"))
                                    ],
                                  );
                                });
                          },
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              lst.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ));
          }),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(child: Text("Add Item")),
                          content: TextField(
                            onChanged: (value) {
                              input = value;
                            },
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  lst.add(input);
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text('ADD'),
                            )
                          ],
                        );
                      });
                },
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
