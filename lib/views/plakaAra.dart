import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plakayorum_mobile/models/plaka.dart';
import 'package:plakayorum_mobile/models/yorum.dart';
import 'package:plakayorum_mobile/services/plakaService.dart';
import 'package:plakayorum_mobile/services/yorumService.dart';
import 'package:plakayorum_mobile/views/yorumListesi.dart';

class PlakaAra extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PlakaAraState();
  }
}

class PlakaAraState extends State<PlakaAra> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(0, 150, 0, 50),
            child: Text(
              "Plaka No",
              style: TextStyle(
                fontSize: 50,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  controller: _textFieldController1,
                  //Allow TextFiled take in Numbers as default
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.end,
                  maxLength: 2,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  controller: _textFieldController2,
                  //Allow TextFiled take in Numbers as default
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  maxLength: 3,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  controller: _textFieldController3,
                  //Allow TextFiled take in Numbers as default
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  maxLength: 4,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: AlignmentDirectional.topCenter,
              padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: RaisedButton(
                onPressed: () {
                  _ara();
                },
                child: const Text('Ara', style: TextStyle(fontSize: 30)),
              )),
        ),
      ],
    );
  }

  void _ara() {
    var plakaService = PlakaService(_textFieldController1.text +
        _textFieldController2.text +
        _textFieldController3.text);

    Future<Plaka> futurePlaka = plakaService.fetchPlaka();
    futurePlaka.then((value) => {_yorumAra(value.id, value.no)});

    print(futurePlaka);
  }

  void _yorumAra(int id, String plakaNo) {
    var yorumService = YorumService(id);

    Future<List<Yorum>> futureYorumList = yorumService.fetchYorumList();
    futureYorumList.then((value) => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => YorumListesi(plakaNo),
              settings: RouteSettings(
                arguments: value,
              ),
            ),
          )
        });
  }
}
