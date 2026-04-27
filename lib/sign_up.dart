import 'package:flutter/material.dart';
import 'package:loan_app/login.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  final formKey=GlobalKey<FormState>();


  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController nameController=TextEditingController();

  String groupValue="type";
  List<String> dropdown_Items=["Pakistani Rupee(PKR)", "America Dollar", "Saudi Riyal (SAR)"];
  bool switchValue=true;
  bool switchValue1=false;
  bool checkBoxVal=true;
  bool checkBoxVal1=true;
  bool checkBoxVal2=true;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo,

      body:
        SingleChildScrollView(
          child: Column(
            children: [
          
              SizedBox(

                height: 250,
                child: Container(
                  width: double.infinity,
                  height: 40,

                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,


                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Card(
                          color: Colors.white60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.calendar_month_outlined, color: Colors.amberAccent, size: 50,),
                          )),
                      Text("Create an Account", style: TextStyle(color: Colors.white, fontSize: 22),),
                      Text("Keep record with HisaabBook!", style: TextStyle(color: Colors.white, fontSize: 18),)
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Form(
                    key: formKey,
                    child:
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(

                          children: [
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                label: Text("Name"),
                                hint: Text("Enter your name"),
                                border: OutlineInputBorder(),

                              ),
                              maxLength: 50,
                              validator: (value){
                                if(value == null || value.isEmpty || value.length >50){
                                  return "Name can't be empty and can't exceed 50 characters";}
                                return null;
                              },
                            ),

                            TextFormField(
                              obscureText: true,
                              controller: emailController,
                              decoration: InputDecoration(
                                label: Text("Email"),
                                hint: Text("Enter your email"),
                                border: OutlineInputBorder(),

                              ),
                              maxLength: 50,
                              validator: (value){
                                if(value == null || value.isEmpty ){
                                  return "Email can't be empty";}
                                else if(value.split("a").length != 2 ){
                                  return "@ should occur once";
                                }
                                return null;
                              },
                            ),TextFormField(
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(

                                label: Text("Password"),
                                hint: Text("Enter your Passward"),
                                border: OutlineInputBorder(),

                              ),
                              maxLength: 10,
                              validator: (value){
                                if(value == null || value.isEmpty ){
                                  return "Password can't be empty";}

                                return null;
                              },
                            ),
                            Text("Account Type"),
                            Row(
                              children: [
                                RadioShape(Radio<String>(
                                  value: "Personal",
                                  groupValue:groupValue ,
                                  onChanged: (value){
                                    setState(() {
                                      groupValue=value!;
                                    });
                                  },
                                ), "Personal"),
                               RadioShape( Radio<String>(
                                 value: "Student",
                                 groupValue:groupValue ,
                                 onChanged: (value){
                                   setState(() {
                                     groupValue=value!;
                                   });
                                 },
                               ), "Student"),
                               RadioShape( Radio<String>(
                                 value: "Business",
                                 groupValue:groupValue ,
                                 onChanged: (value){
                                   setState(() {
                                     groupValue=value!;
                                   });
                                 },
                               ), "Business")
                              ],
                            ),


                            //Switch
                           SwitchStyle("Transaction Alerts", "Notification on every transaction",
                               Switch(value: switchValue, onChanged: (value){
                                 setState(() {
                                   switchValue=value;
                                 });
                               })
                           ),
                            SwitchStyle("Monthly Report", "Every month email summary",
                                Switch(value: switchValue1, onChanged: (value){
                                  setState(() {
                                    switchValue1=value;
                                  });
                                })
                            ),

                          // Checkboxes using custom reusable class
                            Column(
                              children: [
                                CheckBoxStyle(  Checkbox(value: checkBoxVal, onChanged: (value){
                                  setState((

                                      ) {
                                    checkBoxVal=value!;
                                  });
                                }), "I agree on the conditions"),
                                CheckBoxStyle(  Checkbox(value: checkBoxVal1, onChanged: (value){
                                  setState((

                                      ) {
                                    checkBoxVal1=value!;
                                  });
                                }), "I have read privacy policy"),
                                CheckBoxStyle(  Checkbox(value: checkBoxVal2, onChanged: (value){
                                  setState((

                                      ) {
                                    checkBoxVal2=value!;
                                  });
                                }), "I want to receive emails"),


                              ],),

                         OutlinedButton(

                             style: OutlinedButton.styleFrom(fixedSize: Size(285, 20), backgroundColor: Colors.deepPurpleAccent),
                             onPressed: (){}, child: Text("Create Account", style: TextStyle(color: Colors.white),)),  OutlinedButton(

                             style: OutlinedButton.styleFrom(fixedSize: Size(285, 20),),
                             onPressed: (){}, child: Text("Sign In with google",   style: TextStyle(color: Colors.deepPurpleAccent)), ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?"),

                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                                  },
                                  child: Text("Login", style: TextStyle(color: Colors.indigo),),),
                              ],
                            )

                          ],

                        ),
                      ),
                    ),
                  )
                ],
                
              )
          
            ]
          ),
        )

    );
  }
}
class RadioShape extends StatelessWidget{
  Radio<String> btn;
  String type;

  RadioShape(this.btn, this.type);

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          btn, Text(type)
        ],

      ),

    );
  }

}
//Reusable Widget for the Row Containing Switch
class SwitchStyle extends StatelessWidget{
  String title;
  String subtitle;
  Switch s1;

  SwitchStyle(this.title, this.subtitle, this.s1);

  @override
  Widget build(BuildContext context) {
   return Row(
     children: [
       Expanded(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(title),
             Text(subtitle)
           ],
         ),
       ),
       s1,
     ],
   );
  }


}

//Reusable CheckBoxesStyles
class CheckBoxStyle extends StatelessWidget {
  Checkbox checkbox;
  String explanation;


  CheckBoxStyle(this.checkbox, this.explanation);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(

        children: [
          checkbox, Text(explanation),
        ],
      ),
    );
  }
}
