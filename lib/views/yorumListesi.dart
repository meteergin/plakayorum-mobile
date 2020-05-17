import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plakayorum_mobile/models/yorum.dart';

class YorumListesi extends StatefulWidget {
  String _plakaNo;

  YorumListesi(this._plakaNo);

  @override
  State<StatefulWidget> createState() {
    return YorumListesiState(_plakaNo);
  }
}

class YorumListesiState extends State<YorumListesi> {
  final _formKey = GlobalKey<FormState>();
  String _plakaNo;

  YorumListesiState(this._plakaNo);

  @override
  Widget build(BuildContext context) {
    final List<Yorum> yorumListesi = ModalRoute.of(context).settings.arguments;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Plaka Yorum"),
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueGrey, Colors.deepPurple]),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    //padding: EdgeInsets.fromLTRB(0, 150, 0, 50),
                    child: Text(
                      _plakaNo,
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    )),
                Expanded(
                  child: ListView.builder(
                    itemCount: yorumListesi.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      child: Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(yorumListesi[index].icerik),
                                    ],
                                  )
                                ],
                              )))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(),
                            ),
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FlatButton(
                                  child: Text("Yorumu Kaydet"),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                    }

                                    Navigator.of(context).pop();
                                  },
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
