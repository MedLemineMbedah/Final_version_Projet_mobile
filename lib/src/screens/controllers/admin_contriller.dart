import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';

import 'package:projects3/src/models/resource.dart';
import 'package:projects3/src/screens/UserScreen/AddUser.dart';
import 'package:projects3/src/screens/project_screen/create_project_screen.dart';
import 'package:projects3/src/screens/project_screen/list_project.dart';
import 'package:projects3/src/screens/project_screen/new_update.dart';

import 'package:projects3/src/screens/ressource_screen/ressource_item_builder.dart';
import 'package:projects3/src/screens/tache_screen/new_tache.dart';
import 'package:projects3/src/screens/tache_screen/list_tache.dart';

import 'package:projects3/src/screens/ressource_screen/liste_of_ressource_dis.dart';

class AdminController extends StatefulWidget {
  const AdminController({ Key? key }) : super(key: key);

  @override
  State<AdminController> createState() => _AdminControllerState();
}

class _AdminControllerState extends State<AdminController> {
  Project ?selectedProject = null;
  Tache ?selectedTache = null;
  Resource ?selectedR=null;


  String screen = ListProject.screenName;
  @override
  Widget build(BuildContext context) {
   void onTapProject({project,selectedScreen}){
     setState(() {
       if(project != null) selectedProject = project;
       screen = selectedScreen;
     });
   }
     void onTapTache({tache,selectedScreen}){
     setState(() {
       if(tache != null) selectedTache = tache;
       screen = selectedScreen;
     });
   }
    void onTapProjectonTapRessource({resource,selectedScreen}){
     setState(() {
       if(resource != null) selectedR = resource;
       screen = selectedScreen;
     });
   }

   void changeScreen(String s){
     setState(() {
       
       screen = s;
     });
   }
    void selectProject(Project p){
      setState(() {
        selectedProject = p;
      });
    }

     switch (screen) {
       
         case ListProject.screenName : return ListProject(changeScreen:onTapProject );
    
    case ListTache.screenName : return ListTache(changeScreen: onTapTache ,project: selectedProject!,);
    case CreateProjectScreen.screenName : return CreateProjectScreen(changeScreen: changeScreen ,);
    
    case updateProjet.screenName : return updateProjet(changeScreen: changeScreen ,project: selectedProject!,);
    //case updateTache.screenName : return updateTache(changeScreen: changeScreen ,project: selectedProject!,);
    
    case AddUser.screenName : return AddUser(changeScreen: changeScreen ,);
   case AddTache.screenName : return AddTache(changeScreen: changeScreen ,project: selectedProject!,);
   
   case ListRessource.screenName : return ListRessource(changeScreen: onTapProjectonTapRessource ,tache: selectedTache! ,project: selectedProject!,);
   
      default: return ListProject(changeScreen:onTapProject);
    }
  }
}