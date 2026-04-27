import 'package:flutter/material.dart';
import 'package:loan_app/home.dart';
import 'package:loan_app/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey= GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body:

      Column(

        children: [
          SizedBox(
            height: 250,
            child:
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(

                    color:Colors.white60,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.all(20),

                      child: Icon(Icons.calendar_month_outlined, color: Colors.yellowAccent, size: 40,),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("HisaabBook", style: TextStyle(fontSize: 22, color: Colors.white),),
                  Text("Record your Hisaab!", style: TextStyle(fontSize: 18, color: Colors.white),)
                ],
              ),
            ),
          ),


          Expanded(

            child: Container(
              padding: EdgeInsets.all( 10),

              decoration: BoxDecoration(

                color: Colors.white,
              ),
              child: Form(

                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,

                    children: [


                     TextFormField(

                        controller: name,
                        decoration: InputDecoration(  label: Text("Email"),
                          hint: Text("Enter email"),
                          border:  OutlineInputBorder(),


                        ),

                        maxLength: 14,
                        validator: (value){

                          if (value?.split("@").length != 2) {
                            return "Email must contain one @";
                          }
                        if(value == null || value.isEmpty ){

                          return "Cant be empty";

                        }



                          return null;
                        },
                      ),

                      TextFormField(
                        controller: password,
                        decoration:
                        InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Password"),
                        ),
                        maxLength: 30,
                        validator: (value){
                          if(value!.isEmpty || value == null ){
                            return "Password Can't be empty";
                          }
                        },

                      ),
                      ElevatedButton(onPressed: (){

                        if(formKey.currentState!.validate()){
                          String username = name.text.trim();
                          String mypassword = password.text.trim();

                          if (username == "muhammad@taha" && mypassword == "12345") {
                            // Home page par jao
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          }
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please fix errors"))
                          );
                        }

                      },

                          child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 16)),
                          style:ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent, fixedSize: Size(300, 55))

                      ),
                      Text("Or"),

                      OutlinedButton(onPressed: (){}, child:
                      Text("Sign in with google", style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent), ),
                          style:OutlinedButton.styleFrom( fixedSize: Size(300, 55),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[

                        Text("Don't have account? "),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_Up()));

                            },
                            child: Text("Register Now ", style: TextStyle(color: Colors.blueAccent),)),
],

                      ),],

                  ),
                ),
              
              ),
            ),

        ],
      )
      ,

    );
  }
}