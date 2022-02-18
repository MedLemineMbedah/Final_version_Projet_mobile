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
  TextEditingController _email = TextEditingController(text: 'med.lemine.mbedah@gmail.com'),
      _password = TextEditingController(text: '12345678');

  // final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: key,
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Email',
                    hintText: 'Email'),
                controller: _email,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Password',
                    hintText: 'Password'),
                controller: _password,
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
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
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50.0,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      fixedSize: const Size(300, 100),
                      textStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text('Connection'),
                  onPressed: () {
                    
                    Auth.signIn(_email.text, _password.text);
                  },
                )),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      //  return AddUser();
                      runApp(new MaterialApp(
                          debugShowCheckedModeBanner: false,
                          theme: ThemeData(),
                          darkTheme: ThemeData.dark(),
                          home: new add()));
                    }),
                // ElevatedButton(
                // //  color: Theme.of(context).accentColor,
                //   child: Text('Connection'),
                //   onPressed: (){
                //       Auth.signIn(_email.text, _password.text);

                // }),
                // ElevatedButton(
                // //  color: Theme.of(context).accentColor,
                //   child: Text('pass'),
                //   onPressed: (){
                //      // Auth.signIn(_email.text, _password.text);

                // // }),
                //   ElevatedButton(
                // //  color: Theme.of(context).accentColor,
                //   child: Text('rest pass'),
                //   onPressed: (){
                //       //Auth.signIn(_email.text, _password.text);
                //       Auth.resPass(_email.text);
                //        showDialog(
                //       context: context,
                //       builder: (context) => AlertDialog(
                //         title: Text('Result'),
                //         content: Text('Verifier votre email'),
                //         actions: [
                //           ElevatedButton(
                //               onPressed: () {
                //                 Navigator.pop(context);
                //               },
                //               child: Text('Ok'))
                //         ],
                //       ),
                //     );
                // }),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ),
      ),
    );
  }
}
