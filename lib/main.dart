import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
      
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   int firstnum=0, secondnum=0;
  late String result, operator;
  String texttodisplay="";

  void buttonClicked(String btnval)
  {
     if(btnval=='C')
     {
       texttodisplay="";
       firstnum=0;
       secondnum=0;
       result="";
     }
     else if(btnval=="/"||btnval=="*"||btnval=="+"||btnval=="-")
     {
        firstnum=int.parse(texttodisplay);
        result="";
        operator=btnval;
     }
     else if(btnval=="=")
     {
       secondnum=int.parse(texttodisplay);
       if(operator=="+")
       {
         result=(firstnum+secondnum).toString();
       }
       else if(operator=="/")
       {
         result=(firstnum/secondnum).toString();
       }
       else if(operator=="-")
       {
         result=(firstnum-secondnum).toString();
       }
       else if(operator=="*")
       {
         result=(firstnum*secondnum).toString();
       }
     }
     else
     {
       result=int.parse(texttodisplay+btnval).toString();
     }
     setState(() {
       texttodisplay=result;
     });
  }

  Widget customButton(String btnval){
    return Expanded(
      child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.black)
            ),
            padding: EdgeInsets.all(25.0),
            onPressed: ()=>buttonClicked(btnval), 
            child: Text("$btnval",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            ),
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Calculator"),),

      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text("$texttodisplay",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        Row(children: [
          customButton("9"),
          customButton("8"),
          customButton("7"),
          customButton("/"),
        ],
        ),
        Row(children: [
          customButton("6"),
          customButton("5"),
          customButton("4"),
          customButton("*"),
        ],
        ),
        Row(children: [
          customButton("3"),
          customButton("2"),
          customButton("1"),
          customButton("+"),
        ],
        ),
        Row(children: [
          customButton("C"),
          customButton("0"),
          customButton("-"),
          customButton("="),
        ],
        ),
      ],
      ),
    );
  }
}

