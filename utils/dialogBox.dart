import 'package:flutter/material.dart';

class Dialogbox extends StatelessWidget {
  
  final controller;
  final onSave;
  final onCancel;


  const Dialogbox({super.key , required this.controller, required this.onSave, required this.onCancel });

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      content: SizedBox(
        height: 105,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: TextField(
                controller: controller ,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:"Add new Task"
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: onCancel, child: Text("Cancel", style: TextStyle(color: Colors.blueAccent))),
              const SizedBox(width: 10,),
              TextButton(onPressed: onSave, child: Text("Add", style: TextStyle(color: Colors.blueAccent)))
            ],)
            

          ],

        )


      ),
    );
  }
}