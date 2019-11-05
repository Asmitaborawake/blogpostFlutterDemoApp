import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';
import 'dart:async';
import 'DetailPage.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  StreamSubscription<QuerySnapshot>subscription;

  List<DocumentSnapshot>snapshot;

  CollectionReference collectionReference = Firestore.instance.collection(
      "Post");


  @override
  void initState() {
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.documents;
      });
    });
  }

  passData(DocumentSnapshot snap){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostDetail(snapshot: snap,)));
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Blog App'),
          backgroundColor: Colors.redAccent,

          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () => debugPrint("search")
            ),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => debugPrint("ADd")
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(accountName:
              Text('Code With Flutter'), accountEmail: Text('abc@flutter.com'),
                decoration: BoxDecoration(color: Colors.purple),),
              ListTile(
                title: Text('First Page'),
                leading: Icon(Icons.face, color: Colors.purple),
              ),
              ListTile(
                title: Text('Second Page'),
                leading: Icon(Icons.search, color: Colors.purple),
              ),
              ListTile(
                title: Text('Third Page'),
                leading: Icon(Icons.cached, color: Colors.purple),
              ),
              ListTile(
                title: Text('Fourth Page'),
                leading: Icon(Icons.work, color: Colors.purple),
              ),
              Divider(
                height: 10.0,
                color: Colors.black,
              ),
              ListTile(
                title: Text('Close'),
                trailing: Icon(Icons.close, color: Colors.red),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],

          ),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return Card(
            elevation: 0.0,
            margin: EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Text(snapshot[index].data["title"][0]),
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                  SizedBox(width: 10.0,),
                  Container(
                    width: 210.0,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                         child: Text(snapshot[index].data["title"],style: TextStyle(fontSize: 20.0,color: Colors.green),
                            maxLines: 2,),
                          onTap: (){
                            passData(snapshot[index]);
                          },
                        ),

                        SizedBox(height: 5.0,),
                        Text(snapshot[index].data["content"],maxLines: 2,style: TextStyle(fontSize: 16.0),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
          itemCount: snapshot.length,),
      );
    }
  }

