
import'package:flutter/material.dart';
import 'package:shivang1333/pages/home_page.dart';
import 'package:shivang1333/utils/routes.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changebutton=false;
  final _formkey=GlobalKey<FormState>();
  moveToHome(BuildContext context) async{
    if(_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.white,
      child:SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [Image.asset("assets/images/login_page.png",fit: BoxFit.cover,
            ),
               SizedBox(height: 20,
             ),
              Text("Welcome $name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
               SizedBox(height: 20,
              ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
               child: Column(
                 children: [
                   TextFormField(
                     decoration: const InputDecoration(
                       hintText: "Enter Username",
                       labelText: "Username",
                     ),
                 validator: (String? value) {
                   if (value != null && value.isEmpty) {
                     return "Username can't be empty";
                   }

                   return null;
                 },
                     onChanged: (value)
                     {
                       name=value;
                       setState(() {

                       });
                     }
                   ),
                   TextFormField(
                     obscureText: true,
                     decoration: const InputDecoration(
                       hintText: "Enter password",
                       labelText: "Password",
                     ),

                   validator: (String? value) {
                     if (value != null && value.isEmpty) {
                       return "Password can't be empty";
                     }

                     return null;
                   },
                   ),
                   const SizedBox(height: 20,
                   ),
                   InkWell(
                     onTap: ()=>moveToHome(context),
                     child: AnimatedContainer(
                       duration: Duration(seconds: 1),
                       height: 50,
                       width: changebutton ?50:150,

                       child:changebutton?Icon(Icons.done,color: Colors.white,) :Text("Login",style:TextStyle(
                         color: Colors.black,
                         fontWeight:FontWeight.bold,
                         fontSize: 20
                       ),),
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         color: Colors.amber,
                         borderRadius: BorderRadius.circular(changebutton ? 50:8),
                       ),
                     ),
                   ),
                   /*ElevatedButton(onPressed:(){
                     Navigator.pushNamed(context, MyRoutes.homeRoute);
                   },
                   style: TextButton.styleFrom(
                     minimumSize: const Size(150, 40)),
                     child:const Text("Login"),

                   )*/
                 ],
               ),
             )
            ],

          ),
        ),
      )
    );
  }
}
