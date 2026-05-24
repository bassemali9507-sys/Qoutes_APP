import 'package:flutter/material.dart';
import 'package:start_up_project/main.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String author;
  final Function delete;
  final Quote item;
  const CardWidget({
    super.key,
    required this.title,
    required this.author,
    required this.delete,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.black,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.blue, fontSize: 20),
                textDirection: TextDirection.rtl,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      delete(item);
                    },
                    icon: Icon(Icons.delete, color: Colors.blue),
                  ),
                  Text(
                    author,
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
