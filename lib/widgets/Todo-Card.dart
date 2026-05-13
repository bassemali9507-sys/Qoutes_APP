import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  final String vartitle;
  final bool doneORnot;
  final Function changeStatus;
  final Function delete;
  const Todocard({
    super.key,
    required this.vartitle,
    required this.doneORnot,
    required this.changeStatus,
    required this.delete,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus();
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 22),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromRGBO(209, 224, 224, 0.2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              doneORnot
                  ? Icon(Icons.check, size: 27, color: Colors.green)
                  : Icon(Icons.close, size: 27, color: Colors.red),

              IconButton(
                onPressed: () {
                  delete();
                },
                icon: Icon(Icons.delete, color: Colors.red, size: 27),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
            // Icon((Icons.check), size: 27, color: Colors.red),