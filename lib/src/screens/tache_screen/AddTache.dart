import 'package:flutter/material.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/daos/user_dao.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/models/user.dart';
import 'package:projects3/src/screens/controllers/admin_contriller.dart';
class AddTache extends StatelessWidget {
  static const String screenName = 'AddTache';
  
  Function changeScreen;
   AddTache({ Key? key , required this.changeScreen}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
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
late String titre;
late int duree;
late bool disponible;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              
              titre=value;
              
            },
            decoration: const InputDecoration(
    border: OutlineInputBorder(),
    labelText:'Title',
    hintText: 'Entrer Title',
              )
            
          ),
          TextFormField(
            keyboardType: TextInputType.number,
                
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              
              duree=int.parse(value);
            },
            decoration: const InputDecoration(
              
    border: OutlineInputBorder(),
    
    labelText:'duree',
    hintText: 'Entrer la duree',
    
              )
          ),
  
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  Tache t = Tache(duree: duree, titre: titre);
                  // UserDao.saveUser1(t);
                  
                     print(t.duree);
                     print(t.titre);
                     print(t.occupation);
                  //  TacheDao.SaveTache( t);
                  
                  
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('Processing Data')),
                  // );
                  //AdminController();

                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}