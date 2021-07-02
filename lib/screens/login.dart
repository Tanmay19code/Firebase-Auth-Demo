import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homescreen.dart';
import 'signup.dart';


class LoginScreen extends StatelessWidget {

  static const routeName = '/login';
  late Future<FirebaseApp> _firebaseApp =Firebase.initializeApp();
  TextEditingController email =  TextEditingController();
  TextEditingController password =  TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _firebaseApp,
        builder: (context,snapshot){
          return Center(
        child: Column(
          children: [
            
            Container(
              padding: EdgeInsets.fromLTRB(0,60,0,0),
            child: Text(
              'Login Page',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              )),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20,10,20,0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            
            Container(
              padding: EdgeInsets.fromLTRB(20,20,20,20),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Container(
              child: ElevatedButton(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
              )
                  ),
                onPressed: () async {
                  if (email.text.isEmpty || password.text.isEmpty)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please enter details'),
                    ));
                  }
                  else{
                    try{
                      await FirebaseAuth.instance
                      .signInWithEmailAndPassword(email: email.text, password: password.text);
                    }catch(e){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.toString()),
                    ));
                    }
                    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                  }
                }
                )
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20,20,20,20),
              child: ElevatedButton(
                child: Text(
                  'Signup',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,)
                    ),
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);
                }
                )
            ),
          ],
        ),
      );
        },
      ),
      
    );
  }
}