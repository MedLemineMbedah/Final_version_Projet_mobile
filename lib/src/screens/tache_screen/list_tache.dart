import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/controllers/admin_contriller.dart';
import 'package:projects3/src/screens/controllers/user_controller.dart';
import 'package:projects3/src/screens/project_screen/list_project.dart';
import 'package:projects3/src/screens/tache_screen/new_tache.dart';
import 'package:projects3/src/screens/tache_screen/tache_item_builder.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/daos/auth.dart';
//import 'package:projects3/src/models/project.dart';

class ListTache extends StatelessWidget {
  static const String screenName = 'listTache';
  Project project;
  Function changeScreen;

  ListTache({ Key? key ,required this.changeScreen,required this.project}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title:Text('les taches') ,
  //       // to return to  ListProject screen 
  //       leading: IconButton(icon:Icon(Icons.arrow_back) , onPressed: (){changeScreen(selectedScreen: ListProject.screenName);},),
  //       ),
  //     body: Center(
  //       child: Text('ListTache'),
  //     ),
      
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('les Taches 11'), 
       leading: IconButton(onPressed: ()=> changeScreen(selectedScreen:ListProject.screenName),icon: Icon(Icons.arrow_back)),
       actions: [
          IconButton(onPressed: ()=> Auth.loguOut(), icon: Icon(Icons.logout)),
         // IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.arrow_back)),
        ],
     // leading: IconButton(onPressed: changeScreen(selectedScreen:ListProject.screenName), icon: Icon(Icons.arrow_back)),
      ),
      body: Provider <Project> ( 
        create: (context) => project,
        child:FutureBuilder<List<Tache>>(
        future: TacheDao.getUserTacheNonAffecter(Auth.uid,project.id),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!.isEmpty) return Center( child: Text('pas de tache '),);
             return ListView.builder(
            itemCount: snapshot.data!.length,
           // notifyListeners();
            itemBuilder: (context,index)=> tachetemBuilder(ontap: changeScreen,tache: snapshot.data![index]));
          
          }

          else{
            return Center(child: CircularProgressIndicator());
          }
         
            
        }
      )),
        floatingActionButton: FloatingActionButton(   
        elevation: 8.0,   
        child: Icon(Icons.add),   
        onPressed: (){   
           
         // print(project.titre);
         { changeScreen(selectedScreen:AddTache.screenName );}
        
        }   
    ),   
    );
  }
}