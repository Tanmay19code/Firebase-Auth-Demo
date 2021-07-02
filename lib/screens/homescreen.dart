import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
// import 'signup.dart';
class HomeScreen extends StatelessWidget {

static const routeName = '/home';
Future<FirebaseApp> _firebaseApp =Firebase.initializeApp();

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
              padding: EdgeInsets.fromLTRB(50,50,50,10,),
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize:40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(0,0,0,50,),
              child: Text(
                FirebaseAuth.instance.currentUser!.email.toString(),
                style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20,10,10,10),
              child: Text(
                'Congrats, You have succesfully logged in 😁',
                style: TextStyle(
                  fontSize:35,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              child: ElevatedButton(
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
              )
                  ),
                onPressed: () async {
                  try{
                    await FirebaseAuth.instance
                    .signOut()
                    .then((value) {Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);});
                  }catch(e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.toString()),
                    ));
                    }
                  
                }
                )
            ),
          ],
          ),
      );
        }),
      
      
    );
  }
}