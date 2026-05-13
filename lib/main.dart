import 'package:flutter/material.dart';
import 'package:start_up_project/widgets/Todo-Card.dart';
import 'package:start_up_project/widgets/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

List alltasks = [];

class _TodoAppState extends State<TodoApp> {
  addnewtask() {
    setState(() {
      alltasks.add(Task(title: mycontroler.text, status: false));
    });
  }

  changeStatus(int taskIndex) {
    setState(() {
      alltasks[taskIndex].status = !alltasks[taskIndex].status;
    });
  }

  delete(int taskIndex) {
    setState(() {
      alltasks.remove(alltasks[taskIndex]);
    });
  }

  final mycontroler = TextEditingController();

  int calucatingcounts() {
    int completedtasks = 0;

    alltasks.forEach((item) {
      if (item.status) {
        completedtasks++;
      }
    });

    return completedtasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(22),
                height: 200,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: mycontroler,
                      maxLength: 40,
                      decoration: InputDecoration(labelText: "Add New Task"),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        addnewtask();
                        Navigator.pop(context);
                      },
                      child: Text("Add Task"),
                    ),
                  ],
                ),
              );
            },
            isScrollControlled: true,
          );
        },

        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.delete_forever, color: Colors.red, size: 35),
          onPressed: () {
            setState(() {
              alltasks.clear();
            });
          },
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: Text(
          "To Do App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Bassem",
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Counters(alltodos: alltasks.length, alldone: calucatingcounts()),
            Container(
              margin: EdgeInsets.only(top: 22),
              height: 500,
              width: double.infinity,
              color: const Color.fromARGB(255, 73, 70, 97),
              child: ListView.builder(
                itemCount: alltasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Todocard(
                    vartitle: alltasks[index].title,
                    doneORnot: alltasks[index].status,
                    changeStatus: () => changeStatus(index),
                    delete: () => delete(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
