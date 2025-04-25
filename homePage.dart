import 'package:flutter/material.dart';
import 'package:my_app/utils/dialogBox.dart';
import 'package:my_app/utils/todo_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  //String text = "";
  List TodoList = [
    ["TASK - 1", false],
    ["TASK - 2", false],
    ["TASK - 3", false],
    ["TASK - 4", false],
    ["TASK - 5", false],
    //["TASK - 6" , false],
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      TodoList[index][1] = !TodoList[index][1];
    });
  }

  void onChanged(bool? value) {
    setState(() {});
  }

  void _updateToDoItem(int index) {
    setState(() {
      // showDialog(context: context, builder: (context) => SimpleDialog(
      //   children: [
      //     TextField(
      //       onChanged: (value){
      //         setState(() {
      //           text = value;
      //         });
      //       },
      //     ),
      //     ElevatedButton(onPressed: () {}, child: Text("Update Task here !"))
      //   ],
      // ) );
      
    });
  }

  void saveNewTask() {
    setState(() {
      TodoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialogbox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveNewTask,
          );
        });
  }
 

 // delete task 
 void deleteTask(int index){
  setState(() {
    TodoList.removeAt(index);
    
  });

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 200, 235, 208),
        appBar: AppBar(
          title: Text("TODO-APP"),
          backgroundColor: const Color.fromARGB(255, 85, 236, 133),
        ),
        // body: Column(
        //   children: [
        //      TodoItem(
        //       onChanged: (e){},
        //       todoText: "TODO",
        //       isChecked: false,
        //      )

        //   ],
        // )

        floatingActionButton: FloatingActionButton(
            onPressed: createNewTask, child: Icon(Icons.add)),
        body: ListView.builder(
            itemCount: TodoList.length,
            itemBuilder: (context, index) {
              return TodoItem(
                isChecked: TodoList[index][1],
                onChanged: (value) => checkboxChanged(value, index),
                todoText: TodoList[index][0],
                index: index,
                
              //  update: _updateToDoItem,
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }
}


