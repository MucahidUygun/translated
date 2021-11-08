import 'package:case1/api/translateApi.dart';
import 'package:flutter/material.dart';

class TranslatePage extends StatefulWidget {
  TranslatePage({Key key}) : super(key: key);

  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  final items = ['en','fr','tr','ta','de','ar','ru'];
  String toLanguage ="en";
  TextEditingController _controller1 =TextEditingController();
  String translated="";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: 
          Text("Translate",
           style: TextStyle(
             fontWeight: FontWeight.bold,
             color: Colors.black
             ),
           )
          ),
          backgroundColor: Colors.white70,
          ),
        backgroundColor: Colors.grey[500],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: Colors.grey[300],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 100,),
                        Container(
                          height: 150,
                          width: 150,
                          child: TextFormField(
                            controller: _controller1,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: DropdownButton <String>(
                            value: toLanguage,
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value){
                              setState(() {
                               this.toLanguage= value;                             
                               }
                              );
                            }, 
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          color: Colors.black12,
                          height: 50,
                          width: 100,
                          child: Text(
                            translated
                          ),
                        )
                      ],
                    )
                  ],
                ),
                FlatButton(
                  color: Colors.black38,
                  textColor: Colors.white,
                  child: Text("Translate"),
                  onPressed: (){
                    changeText();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeText() {
    TranslationApi.translate(_controller1.text,toLanguage).then((String result){
    setState(() {
          translated = result;
        });
    });
  }
  DropdownMenuItem<String> buildMenuItem (String item)=> DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),
    ),
  );
}