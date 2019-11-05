import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostDetail extends StatefulWidget {

  DocumentSnapshot snapshot;
  PostDetail({this.snapshot}); //constructor of PostDetail page

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
        backgroundColor: Colors.green,
      ),
      body: Card(
        elevation: 10.0,
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Text(widget.snapshot.data["title"][0]),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  SizedBox(width: 10.0,),
                  Text(widget.snapshot.data["title"],
                    style: TextStyle(fontSize: 22.0,color: Colors.green),maxLines: 2,),

                ],
              ),
            ),
            SizedBox(height: 7.0,),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Text(widget.snapshot.data["content"],style: TextStyle(fontSize: 18.0),),
            )
          ],
        ),
      ),
    );
  }
}
