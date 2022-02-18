// ignore_for_file: prefer_const_constructors

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/models/tache.dart';

import 'package:projects3/src/screens/project_screen/list_project.dart';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/screens/controllers/admin_contriller.dart';
import 'package:projects3/src/screens/controllers/user_controller.dart';
import 'package:projects3/src/screens/project_screen/list_project.dart';
import 'package:projects3/src/daos/project_dao.dart';
import 'package:projects3/src/screens/tache_screen/AddTache.dart';
import 'package:projects3/src/screens/tache_screen/list_tache.dart';
//import 'package:projects3/src/models/project.dart';

class AddTache extends StatelessWidget {
  static const String screenName = 'AddTache';
  Project project;
  Function changeScreen;

  var context;

  AddTache({Key? key, required this.changeScreen, required this.project})
      : super(key: key);

  TextEditingController _title = TextEditingController(text: "");
   int duree= 1 ;
  late String titre;
   String btnText = 'Ajouter tache';

  final _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
  
   return Scaffold(
        appBar: AppBar(
            title: Text('Ajouter une Tache'),
            // to return to  ListProject screen
            // leading: IconButton(onPressed: ()=> changeScreen(selectedScreen:ListTache.screenName),icon: Icon(Icons.arrow_back)),
            leading: IconButton(
                onPressed: () => Auth.loguOut(), icon: Icon(Icons.arrow_back))
            // backgroundColor: Colors.blue,
            ),
        body: GestureDetector(
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
       // crossAxisAlignment: CrossAxisAlignment.start,
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
                labelText: 'nom',
                hintText: 'Entrer nom',
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
              Padding(
                           padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),    child:
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

              decoration:  InputDecoration(
                labelText: 'duree',
                hintText: 'Entrer la duree',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
                 border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
              )),),
           Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          height: 60.0,
                   //       width: double.infinity,
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
                  borderRadius: BorderRadius.circular(50)
                  )
                  
                  ),
                
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  Tache t = Tache(duree: duree, titre: titre,occupation:false,teminer: false);

                TacheDao.SaveTache(Auth.uid,project.id , t);

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
                 child: Text(
                                btnText.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
              
            ),
          ),
        ],
      ),
    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
