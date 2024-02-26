import 'package:flutter/material.dart';
import 'package:geting_started/pages/addtodo.dart';
import 'package:geting_started/widgets/to_do_list_item.dart';
import '../todo.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Text("To Do App"),
            ),
            const Spacer(),
            CircleAvatar(
              backgroundImage:const AssetImage('assets/p2.png'),
              backgroundColor:const Color.fromRGBO(240, 240, 240, 1),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                iconColor: const Color(0xFF000000),
                title: const Center(
                
              ),
             )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddToDo(
                        addToDo: addItem,
                      )));
        },
        child: const Icon(Icons.add),
      ),
      drawer: SideTabe(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(240, 240, 240, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    onChanged: searchItem,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: const Text(
                    "To Do List",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: ToDo.resList
                      .map((todo) => ToDoListItem(
                            todoItem: todo,
                            onDelete: deleteItem,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void addItem(String title) {
    setState(() {
      ToDo.toDoList.add(ToDo(
        id: ToDo.toDoList.length + 1,
        title: title,
      ));
    });
  }

  void searchItem(String query) {
    if (query.isEmpty) {
      setState(() {
        ToDo.resList = ToDo.toDoList;
      });
    } else {
      setState(() {
        ToDo.resList = ToDo.toDoList
            .where((element) =>
                element.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  void deleteItem(int id) {
    setState(() {
      ToDo.toDoList.removeWhere((element) => element.id == id);
    });
  }

  void sidetab() {}
}

class SideTabe extends StatelessWidget {
  @override
  const SideTabe({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 100, left: 20),
        children: <Widget>[
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: const Text("Profile"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            title: const Text("Tic Tac Toe"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/tictactoe');
            },
          ),
        ],
      ),
    );
  }
}
