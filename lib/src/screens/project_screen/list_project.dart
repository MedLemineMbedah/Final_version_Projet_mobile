import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/project_dao.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/project_screen/create_project_screen.dart';
import 'package:projects3/src/screens/project_screen/project_item_builder.dart';
import 'package:projects3/src/screens/tache_screen/tache_item_builder.dart';

class ListProject extends StatelessWidget {
  static const String screenName= 'listProject';
  Function changeScreen;
   ListProject({ Key? key,required this.changeScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('les Projet'),
        actions: [
          IconButton(onPressed: ()=>showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Tache terminer'),
                                    content: FutureBuilder<List<Tache>>(
                                       future: TacheDao.getUserTacheTerminer(),
                                       builder: (context, snapshot) {
                                        if(snapshot.hasData){
                                          if(snapshot.data!.isEmpty) return Center( child: Text('vide '),);
                                          return ListView.builder(
                                          itemCount: snapshot.data!.length,
                                        // notifyListeners();
                                          itemBuilder: (context,index)=> 
                                            ListTile(
                                             tileColor : Colors.deepOrange,
                                                        title: Text(snapshot.data![index].titre)  ,
                                                        subtitle: Text(
                                                          "duree: ${snapshot.data![index].duree.toString()}"
                                                          ),
                                                  
                                                      )
                                            );
                                            
                                            
                                          

                                            }

                                        else{
                                          return Center(child: CircularProgressIndicator());
                                        }                            
                                        }   
                                      
      ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Ok'))
                                    ],
                                  ),
                                ), icon: Icon(Icons.notifications)),
          IconButton(onPressed: ()=>  Auth.loguOut(),  icon: Icon(Icons.logout))
        ],
      ),
      
      body: FutureBuilder<List<Project>>(
        future: ProjectDao.getUserProject(Auth.uid),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!.isEmpty) return Center( child: Text('pas de project '),);
             return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context,index)=> ProjectItemBuilder(ontap: changeScreen,project: snapshot.data![index],));
          }

          else{
            return Center(child: CircularProgressIndicator());
          }
         
            
        }
      ),

      
       floatingActionButton: FloatingActionButton(   
        elevation: 8.0,   
        child: Icon(Icons.add),   
        onPressed: (){   
           { changeScreen(selectedScreen:CreateProjectScreen.screenName);}
        }   
    ),
       
    );
  }
}