import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/daos/user_dao.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/models/user.dart';
import 'package:projects3/src/screens/controllers/admin_contriller.dart';
import 'package:projects3/src/screens/tache_screen/list_tache.dart';

class AddTache extends StatelessWidget {
  static const String screenName = 'AddTache';
  Project project;
  Function changeScreen;
  AddTache({Key? key, required this.changeScreen,required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Ajout tache';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          leading: IconButton(onPressed: ()=> changeScreen(selectedScreen:ListTache.screenName),icon: Icon(Icons.arrow_back)),
     
          // leading: IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () {
          //       changeScreen(selectedScreen: ListTache.screenName);
          //     }),
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
    SizedBox(
      height: 90.0,
    );
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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

                titre = value;
              },
              // decoration: const InputDecoration(
              //   border: OutlineInputBorder(),
              //   labelText: 'Title',
              //   hintText: 'Entrer Title',
              // )),

              decoration:  InputDecoration(
                labelText: 'duree',
                hintText: 'Entrer Title',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
              )
              ),
            ),
          TextFormField(
              keyboardType: TextInputType.number,

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                duree = int.parse(value);
              },
              // decoration: const InputDecoration(
              //   border: OutlineInputBorder(),
              //   labelText: 'duree',
              //   hintText: 'Entrer la duree',
              // )
              // ),

              decoration: const InputDecoration(
                labelText: 'duree',
                hintText: 'Entrer la duree',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  Tache t = Tache(duree: duree, titre: titre);

                // TacheDao.SaveTache(Auth.uid, , t);

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
