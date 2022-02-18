import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/user_dao.dart';
import 'package:projects3/src/models/user.dart';
class AddUser extends StatelessWidget {
  static const String screenName = 'AddUser';
  Function changeScreen;
   AddUser({ Key? key , required this.changeScreen}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const appTitle = 'Ajouter une Ressource';

    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          leading: IconButton(onPressed: ()=> Auth.loguOut(),icon: Icon(Icons.arrow_back)),
     
        ),
        body: const MyCustomForm(),
      );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
late String nom,email,prenom;
 TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return 
    
    GestureDetector(
          onTap: () {},
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
    Form(
      key: _formKey,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
                           padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),    child:
          TextFormField(
            
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              
              nom=value;
              
            },
            decoration:  InputDecoration(
              labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
                 border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
    //border: OutlineInputBorder(),
    labelText:'Nom',
    hintText: 'Entrer votre nom',
              )
            
          ),),

           Padding(
                           padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),    child:
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              prenom=value;
            },
            decoration:  InputDecoration(
               labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
                 border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
   // border: OutlineInputBorder(),
    labelText:'prenom',
    hintText: 'Entrer votre prenom',
              )
          ),),
           Padding(
                           padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),    child:
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              email=value;
            },
             decoration:  InputDecoration(
               labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
                 border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
    //border: OutlineInputBorder(),
    labelText:'email',

    hintText: 'Entrer votre email',
              )
          ),
           ),
        Padding(
               padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ), 
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
                 border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                  labelText: 'password',
                  hintText: 'Password'),
                controller: _password,
              ),
              
            ),
           Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          height: 60.0,
                   //       width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(40.0),
                          ),child: ElevatedButton(
                             style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              fixedSize: const Size(300, 100),
              textStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                    ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                  )
                  
                  ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  UserMadel u =UserMadel(nom:nom,prenom: prenom,email: email);
                  //UserDao.saveUser1(u);
                  Auth.loguIn(u,_password.text);
                  
                   showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Result'),
                      content: Text('Ajout avec succes'),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Ok'))
                      ],
                    ),
                  );
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('Processing Data')),
                  // );
                }
              },
              child: const Text('ajouter'),
            ),
          ),
        ],
      ),
    )
                  ]
                )
                )
                )
                )
                );
                
  }
}