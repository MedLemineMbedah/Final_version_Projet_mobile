import 'package:flutter/material.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/ressource_screen/liste_of_ressource_dis.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/resourceDao.dart';
import 'package:projects3/src/models/resource.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:provider/provider.dart';
import 'package:projects3/src/screens/project_screen/new_update.dart';

class tachetemBuilder extends StatelessWidget {
 // static const String screenName = 'tachetemBuilder';
  
  Tache tache;
  Function ontap;
  
  tachetemBuilder({ Key? key , required this.tache,required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return 
    Dismissible(
  key: ObjectKey(tache.id),
    background: Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20.0),
      color: Colors.orangeAccent,
      child: Icon(Icons.edit, color: Colors.white),
    ),
    secondaryBackground: Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.redAccent,
      child: Icon(Icons.delete, color: Colors.white),
    ),
    child:
    
    
    
    
    
    
    
    ListTile(
      title: Text(tache.titre)  ,
      subtitle: Text(
        "duree: ${tache.duree.toString()}"
        ),
        
      onTap: (){  
         ontap(tache: tache,selectedScreen:ListRessource.screenName); 
         
          },//end onTap
    ),

    
onDismissed: (direction){
      if(direction == DismissDirection.startToEnd){
        print(tache.id);
      // {changeScreen(selectedScreen:update_tache.screenName);}
        
      } else if(direction == DismissDirection.endToStart){
        //Scaffold.of(context).showSnackBar(SnackBar(content: Text("Swipe to right")));
        print(tache.id);
        print("supprimer");
        
        TacheDao.supprimerTache(Auth.uid,tache.id,context.read<Project>());
        //ResourceDao.deleteRe(tache.id);
      }
    },

    confirmDismiss: (direction) async {
      if(direction==DismissDirection.endToStart){
 return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm"),
        content: const Text("Are you sure you wish to delete this item?"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            
            child: const Text("DELETE")
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("CANCEL"),
          ),
        ],
      );
      }     
 );


    }


    else {
          onTap:
          {
            print(context.read<Project>().titre);
            //ontap(project: context.read<Project>(),selectedScreen: updateProjet.screenName);
          }
        }
  
  
},
  );
  }
}
// Scaffold(
//          appBar: AppBar(title: Text('les Ressources disponibles'),),
//          body: FutureBuilder<List<Resource>>(
//         future: ResourceDao.getAllResources(),
//         builder: (context, snapshot) {
//           if(snapshot.hasData){
//             if(snapshot.data!.isEmpty) return Center( child: Text('pas de project '),);
//              return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context,index)=>  ListTile(
//                                title: Text(snapshot.data![index].nom)  ,
//                                   onTap: (){
//                                     ResourceDao.ResourceAuccupe(snapshot.data![index].id);
        
//             //  ontap(project: project,selectedScreen:ListTache.screenName);
//             },
//           ));
//           }

//           else{
//             return Center(child: CircularProgressIndicator());
//           }
         
            
//         }
//       ),
//        floatingActionButton: FloatingActionButton(   
//         elevation: 8.0,   
//         child: Icon(Icons.logout),   
//         onPressed: (){   
//          Auth.loguOut();  
//         }   
//     ),
//       //  ontap(project: tache,selectedScreen:ListTache.screenName);
//        );