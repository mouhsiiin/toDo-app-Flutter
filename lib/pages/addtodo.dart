import 'package:flutter/material.dart';


class AddToDo extends StatefulWidget {

  final Function addToDo;
  const AddToDo({Key? key, required this.addToDo}) : super(key: key);

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add To Do'),
      ),
      body: Column(
        children: <Widget>[
            Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: titleController,
              decoration:const InputDecoration(
                hintText: "Enter To Do",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
              foregroundColor: const Color.fromRGBO(0, 0, 0, 1),
            ),
            onPressed: (){
              
              
              widget.addToDo(titleController.text);
              Navigator.pop(context);
            
            },
  
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
