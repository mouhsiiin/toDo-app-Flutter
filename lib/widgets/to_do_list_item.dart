import 'package:flutter/material.dart';
import '../todo.dart';

class ToDoListItem extends StatefulWidget {
  final ToDo todoItem;
  final  onDelete;

  const ToDoListItem({Key? key,
   required this.todoItem,
   required this.onDelete,
   }) : super(key: key);

  @override
  _ToDoListItemState createState() => _ToDoListItemState();
}

class _ToDoListItemState extends State<ToDoListItem> {
  @override
  Widget build(BuildContext context) {
    var title = widget.todoItem.title;
    var isDone = widget.todoItem.isDone;

    return GestureDetector(
      onTap: () {
        setState(() {
          widget.todoItem.toggleDone();
        });
      },
      child: Container(
        height: 55,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: isDone ? Colors.green : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: isDone
                    ? null
                    : Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
              ),
              
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: isDone ? FontWeight.bold : FontWeight.normal,
                decoration: isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: (){
                widget.onDelete(widget.todoItem.id);
              },
              icon: const Icon(Icons.delete),
              )
          ],
        ),
      ),
    );
  }
}
