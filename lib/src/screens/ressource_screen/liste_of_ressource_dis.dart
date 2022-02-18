import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/resourceDao.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/daos/user_dao.dart';
import 'package:projects3/src/models/resource.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/UserScreen/AddUser.dart';
import 'package:projects3/src/screens/ressource_screen/ressource_item_builder.dart';
import 'package:projects3/src/screens/signIn.dart';
import 'package:projects3/src/screens/tache_screen/list_tache.dart';

import '../../models/project.dart';

class ListRessource extends StatelessWidget {
  static const String screenName = 'listRessource';
  Tache tache;
  Function changeScreen;
  Project project;
  ListRessource(
      {Key? key,
      required this.changeScreen,
      required this.tache,
      required this.project})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('les Ressources disponibles'),
        leading: IconButton(
            onPressed: () => changeScreen(selectedScreen: ListTache.screenName),
            icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () => Auth.loguOut(), icon: Icon(Icons.logout))
        ],
      ),
      body: FutureBuilder<List<Resource>>(
          future: ResourceDao.getAllResourcesDipo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty)
                return Center(
                  child: Text('pas de Ressource '),
                );
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Dismissible(
                        key: ObjectKey(snapshot.data![index].id),
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
                        child: ListTile(
                          title: Text(snapshot.data![index].nom),
                          onTap: () async {
                            TacheDao.changeEtat(Auth.uid, tache.id, project.id);
                            TacheDao.addResID(Auth.uid, tache.id, project.id,
                                snapshot.data![index].id);
                            ResourceDao.ResourceAuccupe(
                                snapshot.data![index].id);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Result'),
                                content: Text('Affectation avec succes'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Ok'))
                                ],
                              ),
                            );
                            print("Saved");

                            //  ontap(project: project,selectedScreen:ListTache.screenName);
                          },
                        ),
                        onDismissed: (direction) {
                           if (direction == DismissDirection.startToEnd) {
                          // //  print(project.id);
                           } else if (direction == DismissDirection.endToStart) {
                          //   //Scaffold.of(context).showSnackBar(SnackBar(content: Text("Swipe to right")));
                          //   // print(project.id);
                          //   // print("supprimer");
                          //   // ProjectDao.deleteP(project.id, Auth.uid);
                                UserDao.deleteUser(snapshot.data![index].id);
                           }
                        },
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Confirm"),
                                    content: const Text(
                                        "Are you sure you wish to delete this item?"),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: const Text("DELETE")),
                                      FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text("CANCEL"),
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            onTap:
                            {
                             // ontap(project: project, selectedScreen: UpdateResorce.screenName);
                            }
                          }
                        },
                      ));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
          elevation: 8.0,
          child: Icon(Icons.add),
          onPressed: () {
            {
              changeScreen(selectedScreen: AddUser.screenName);
            }
          }),
    );
  }
}
