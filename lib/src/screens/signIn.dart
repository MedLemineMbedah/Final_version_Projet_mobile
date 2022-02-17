import 'package:flutter/material.dart';

import 'package:projects3/src/app.dart';
import 'package:projects3/src/daos/auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:projects3/src/screens/UserScreen/testAdd.dart';

class LoginScreen extends StatefulWidget {
  
  const LoginScreen({Key? key}) : super(key: key);
 
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var key = GlobalKey();
   TextEditingController _email =  TextEditingController(text: 'a@b.com'), _password = TextEditingController(text: '12345678');

 // final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(  

      appBar: AppBar(title: Text('Login'),),
      body: Form(
         key: key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(  
                  hintText: 'Email'
                ),
                controller: _email,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
                controller: _password,
              ),
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
              ElevatedButton(
              //  color: Theme.of(context).accentColor,
                child: Text('register'),
                onPressed: (){
                  //  return AddUser();
                    runApp(new MaterialApp(  debugShowCheckedModeBanner :false,  theme: ThemeData(),
              darkTheme: ThemeData.dark(),home: new add()));
                    
              }),
              ElevatedButton(
              //  color: Theme.of(context).accentColor,
                child: Text('Connection'),
                onPressed: (){
                    Auth.signIn(_email.text, _password.text);
                    
              }),
              // ElevatedButton(
              // //  color: Theme.of(context).accentColor,
              //   child: Text('pass'),
              //   onPressed: (){
              //      // Auth.signIn(_email.text, _password.text);
                    
              // }),
                ElevatedButton(
              //  color: Theme.of(context).accentColor,
                child: Text('rest pass'),
                onPressed: (){
                    //Auth.signIn(_email.text, _password.text);
                    Auth.resPass(_email.text);
                     showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Result'),
                      content: Text('Verifier votre email'),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Ok'))
                      ],
                    ),
                  );
              }),
            ])
          ],),
      ),
    );
  }
}