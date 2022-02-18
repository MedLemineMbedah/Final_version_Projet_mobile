

import 'package:flutter/material.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/tache_screen/tache_item_builder.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/daos/auth.dart';
//import 'package:projects3/src/models/project.dart';

class ListTache_of_project extends StatelessWidget {
  static const String screenName = 'listTache';
  
//  Project project;
 // Function changeScreen;
  ListTache_of_project({ Key? key }) : super(key: key);
 // Project project;

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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('votre taches'), actions: [
          IconButton(onPressed: ()=> Auth.loguOut(), icon: Icon(Icons.logout))
        ],),
      body: FutureBuilder<List<Tache>>(
        future: TacheDao.getResourceTache(Auth.uid),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!.isEmpty) return Center( child: Text('pas de tache !!! '),);

             return
             
              ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context,index)=> builItem(tache:snapshot.data![index]),
      
      
      
      
      
      
      
      
      
      
      
      
      
      
        //     ListTile(
        //       leading: Checkbox(
        //   activeColor: Colors.blueAccent,
        //   value: snapshot.data![index].teminer,
        //   onChanged: (checkbox) async{
        //     TacheDao.changeTermin(Auth.uid,snapshot.data![index].titre);

            
           
            
        //   },
        // ),
        //                 title: Text(snapshot.data![index].titre,style: TextStyle (
        //     decoration:
        //         snapshot.data![index].teminer ? TextDecoration.lineThrough : TextDecoration.none,
        //   ),)  ,
        //                 subtitle: Text(
        //                   "duree: ${snapshot.data![index].duree.toString()}"
        //                   ),
        //                 onTap: (){
        //                 //  ontap(project: tache,selectedScreen:ListTache.screenName);
        //                 },
        //               )
            
            
          
    

                      );



          
            //tachetemBuilder(ontap: changeScreen,tache: snapshot.data![index],));
          }

          else{
            return Center(child: CircularProgressIndicator());
          }
         
            
        }
      
    //    floatingActionButton: FloatingActionButton(   
    //     elevation: 8.0,   
    //     child: Icon(Icons.logout),   
    //     onPressed: (){   
    //      Auth.loguOut();  
    //     }   
    // ),  
      )
    );
  }

   
  }
 class builItem extends StatefulWidget {

   Tache tache;
  builItem({ Key? key ,required this.tache}) : super(key: key);
   @override
   _builItemState createState() => _builItemState();
 }
 
 class _builItemState extends State<builItem> {
   late bool val;
   @override
  void initState() {
    // TODO: implement initState
    val=widget.tache.teminer;
    super.initState();
  }
  
   @override
   Widget build(BuildContext context) {
     return Container(
        child:ListTile(
              leading: Checkbox(
          activeColor: Colors.blueAccent,
          value: val,
          onChanged: (v) async{
            TacheDao.changeTermin(Auth.uid,widget.tache.titre);
            setState(() {
              val=v!;
            });
          },
        ),
                        title: Text(widget.tache.titre,style: TextStyle (
            decoration:
                widget.tache.teminer ? TextDecoration.lineThrough : TextDecoration.none,
          ),)  ,
                        subtitle: Text(
                          "duree: ${widget.tache.duree.toString()}"
                          ),
                        onTap: (){
                        //  ontap(project: tache,selectedScreen:ListTache.screenName);
                        },
                      )
     );
   }
 }