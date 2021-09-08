import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'DataModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<DataModel>;
              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: Text(
                                          items[index].fieldOne.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: Text(items[index].fieldTwo.toString()),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: Text(items[index].fieldThree.toString()),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: Text(items[index].fieldFour.toString()),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: Text(items[index].fieldFive.toString()),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: Text(items[index].fieldSix.toString()),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: Text(items[index].fieldSeven.toString()),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: Text(items[index].fieldEight.toString()),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: Text(items[index].fieldNine.toString()),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: Text(items[index].fieldTen.toString()),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    );
  }

  Future<List<DataModel>> ReadJsonData() async {

    List<DataModel> lstModelData=<DataModel>[];
    final jsondatas = await rootBundle.rootBundle.loadString("assets/data.json");
    final lists = json.decode(jsondatas);

    var jsonFieldsData=lists["fields"];
    List<String> listDataHeader = <String>[];
    for(int i=0;i<jsonFieldsData.length;i++){
      var strLable=jsonFieldsData[i];
      String strLabless=strLable["label"];
      listDataHeader.add(strLabless);
    }
    var jsonDatas=   lists["data"];
    List<List<String>> rowDataCollection = [];
    for(int i=0;i<jsonDatas.length;i++) {
      var strLable = jsonDatas[i];
      DataModel bedData=new DataModel();
      bedData.fieldOne=listDataHeader[0]+" : "+strLable[0];
      bedData.fieldTwo=listDataHeader[1]+" : "+strLable[1];
      bedData.fieldThree=listDataHeader[2]+" : "+strLable[2];
      bedData.fieldFour=listDataHeader[3]+" : "+strLable[3];
      bedData.fieldFive=listDataHeader[4]+" : "+strLable[4];
      bedData.fieldSix=listDataHeader[5]+" : "+strLable[5];
      bedData.fieldSeven=listDataHeader[6]+" : "+strLable[6];
      bedData.fieldEight=listDataHeader[7]+" : "+strLable[7];
      bedData.fieldNine=listDataHeader[8]+" : "+strLable[8];
      bedData.fieldTen=listDataHeader[9]+" : "+strLable[9];
      lstModelData.add(bedData);
      List<String> listDataRow = <String>[];
      for (int i = 0; i < strLable.length; i++) {
        listDataRow.add(strLable[i]);

      }
      rowDataCollection.add(listDataRow);
    }
       return lstModelData;
  }
}

