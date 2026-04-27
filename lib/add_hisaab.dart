import 'package:flutter/material.dart';
import 'package:loan_app/hisaab_entry.dart';
import 'package:loan_app/main.dart';

class Add_Hisaab extends StatefulWidget {
  const Add_Hisaab({super.key});

  @override
  State<Add_Hisaab> createState() => _Add_HisaabState();
}

class _Add_HisaabState extends State<Add_Hisaab> {
  String title='';
  String subtitle='';
  String number='';
  // Icon icon;
  var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Hisaab"),),
      body: Padding(padding: EdgeInsets.all(10)
      ,child: Form(
          key: key,
          child: Column(
            spacing: 20,
            children: [
              TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(),
                label: Text("Name Item"), hintText: "Enter the item to be addeed",
               ), validator: (value){
                  if(value!.isEmpty){
                    return "Can't be empty";
                  }
                  return null;
              },
              onSaved: (newValue)=> title = newValue!,
              ), TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(),
                label: Text("Date"), hintText: "Enter the date to be stored!",
               ), validator: (value){
                  if(value!.isEmpty){
                    return "Can't be empty";
                  }
                  return null;
              },
              onSaved: (newValue)=> subtitle = newValue!,
              ), TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(),
                label: Text("Amount"), hintText: "Enter the amount",
               ), validator: (value){
                  if(value!.isEmpty){
                    return "Can't be empty";
                  }
                  return null;
              },
              onSaved: (newValue)=> number = newValue!,
              ),
              ElevatedButton(onPressed: (){
                if(key.currentState!.validate()){
                  key.currentState!.save();//Creating and saving entry in the database
                  dbHelper.insert(HisaabEntry(title, subtitle, number));

                  Navigator.pop(context);
                }
              }, child: Text("Save")),





            ],
          ),

        ),
      ),
    );
  }
}
