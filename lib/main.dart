import 'package:flutter/material.dart';
import 'package:start_up_project/pages/cards.dart';

void main() {
  runApp(const Qoutes());
}

class Qoutes extends StatefulWidget {
  const Qoutes({Key? key}) : super(key: key);

  @override
  State<Qoutes> createState() => _QoutesState();
}

class Quote {
  String title;
  String author;
  Quote({required this.title, required this.author});
}

class _QoutesState extends State<Qoutes> {
  List<Quote> allQoutes = [
    Quote(
      title: "Be yourself; everyone else is already taken.",
      author: "Oscar Wilde",
    ),
    Quote(
      title:
          "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.",
      author: "Albert Einstein",
    ),
  ];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  addingText() {
    setState(() {
      allQoutes.add(
        Quote(title: titleController.text, author: authorController.text),
      );
    });
    titleController.clear();
    authorController.clear();
  }

  delete(Quote item) {
    setState(() {
      allQoutes.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Qoutes",
            style: TextStyle(color: Colors.blue, fontFamily: "Bassem"),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ...allQoutes.map(
              (item) => CardWidget(
                item: item,
                title: item.title,
                author: item.author,
                delete: (qouteToWithdrawn) {
                  setState(() {
                    allQoutes.remove(item);
                  });
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Builder(
          builder: (BuildContext contextOfButton) {
            return FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: contextOfButton,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Add Quote"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: const InputDecoration(
                              hintText: "Quote",
                            ),
                          ),
                          TextField(
                            controller: authorController,
                            decoration: const InputDecoration(
                              hintText: "Author",
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                addingText();
                                Navigator.pop(context);
                              },
                              child: const Text("Add"),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              backgroundColor: Colors.black,
              child: const Icon(Icons.add, color: Colors.blue),
            );
          },
        ),
      ),
    );
  }
}
