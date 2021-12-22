//import 'dart:html';
import 'model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formkey = GlobalKey<FormState>();

  // ignore: unnecessary_new
  Model model = new Model();
  List<Model> _mod = [];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var size = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        key: _formkey,
        // size =MediaQuery.of(context).size.width,
        body: Stack(children: [
          SafeArea(child: Column(
            children: [
              Container(
                color: Colors.black12,
                // height: 300,
                child: Column(
                  children: [
                    Container(
                      //    margin: EdgeInsets.only(top: 5),
                      child: Text("Notes",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,
                              height: 10.0)),),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                      ),
                   //   validator: (val) => (val == 0 ? 'feild Required' : null),
                      onSaved: (val) {
                        setState(() {
                          val = model.title;
                        });
                      },

                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                      ),
                     // validator: (val) => (val == 0 ? 'feild Required' : null),
                      onSaved: (val) {
                        setState(() {
                          val = model.note;
                        });
                      },
                    ),
                    Container(child: RaisedButton(
                      onPressed: () => _submit(),
                      child: Text('Submit'),
                      color: Colors.black,
                      textColor: Colors.white,
                    ),)
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blueGrey,
                  child: Card(
                    margin: EdgeInsets.fromLTRB(20, 20, 30, 0),
                    child: ListView.builder(
                        itemCount: _mod.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.account_circle,
                                  color: Colors.white, size: 40.0,
                                ),
                                title: Text(_mod[index].title,
                                  style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(_mod[index].note,
                                  style: TextStyle(color: Colors.black),),
                              )
                            ],);
                        }),
                  ),
                ),
              ),
            ],
          )),
        ],)

    );
  }

  _submit() {
    var form = _formkey.currentState;
    // form?.save();
    // form?.reset();
    // _mod.add(model);
    print(model.title);
    print(model.note);
    print('hgds');
    // if (form.validate()) {
    //   form?.save();
    //   setState(() {
    //     _mod.add(model);
    //     print(model.title);
    //   });
    // }
  }

}