import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class TodoItem extends StatefulWidget {
  final bool isChecked;
  String todoText;
  final Function (bool?)? onChanged;
  //final Function update;
 final int index; 
   Function(BuildContext)? deleteFunction;

  TodoItem({super.key, 
  required this.isChecked , 
  required this.onChanged , 
  required this.todoText,
  //required this.update, 
  required this.index, 
  required this.deleteFunction });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [SlidableAction(onPressed: widget.deleteFunction,
          icon: Icons.delete,          
          borderRadius: BorderRadius.circular(12),
          backgroundColor: const Color.fromARGB(255, 236, 115, 115),
          )],),
        child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 85, 236, 133),
          borderRadius: BorderRadius.circular(12), 
        ),
        child: Row(
          children: [
            Checkbox(value: widget.isChecked, onChanged: widget.onChanged),
            Expanded(child: Text(widget.todoText)),
            // Container(
            //   child: IconButton( onPressed: () => delete(index),
            //   icon: Icon(Icons.delete),
            //    color: const Color.fromARGB(255, 240, 6, 6),),
              
            // )
             Container(
               child: IconButton( onPressed: () {
                showDialog(context: context, builder: (context) => SimpleDialog(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                text = value;
              });
            },
          ),
         ElevatedButton(
  onPressed: () {
    setState(() {
      // Update the task with new text (currently, you're just changing `text` without affecting anything)
      widget.todoText = text; 
    });
    Navigator.pop(context);
  },
  child: Text("Update Task here!"),
),

        ],
      ) );},
               icon: Icon(Icons.edit),
                color: const Color.fromARGB(255, 42, 3, 214),),
              
            )
          ],
        ) ,
            ),
      ),
    );
  }
}

