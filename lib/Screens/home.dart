import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/Screens/Widgets/add_todo.dart';
import 'package:todo_firebase/Screens/Widgets/completed_list.dart';
import 'package:todo_firebase/Screens/Widgets/todolist.dart';
import 'package:todo_firebase/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [TodoList(), CompletedList()];

    return Scaffold(
      appBar: AppBar(
        title: Text('TODO APP'),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
                selectedIndex = index;
              }),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.fact_check_outlined,
                  size: 28,
                ),
                label: 'Todos'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.done,
                  size: 28,
                ),
                label: 'Completed')
          ]),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialog(),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
