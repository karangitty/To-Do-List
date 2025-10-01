import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String displayText = "NO DATA FOUND";
  TextEditingController cont = TextEditingController();
  List<String> fieldof = [];
  bool isTextEmpty=true;
  @override
void initState() {
  super.initState();
  cont.addListener(() {
    setState(() {
      isTextEmpty = cont.text.isEmpty;
    });
  });
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.tealAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
        
          title: Text(
            "To Do List",
            style: TextStyle(color: Colors.greenAccent,fontStyle:FontStyle.normal,fontSize:35,fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),

                    child: TextField(
                      controller: cont,
                      decoration: InputDecoration(
                        label: Text('enter the task'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(70.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                    IconButton(
                  iconSize: 36.0,
                  onPressed: isTextEmpty
                      ? null 
                      : () {
                          setState(() {
                            fieldof.add(cont.text);
                            cont.clear();
                          });
                        },
                  icon: Icon(Icons.add),
                  color:isTextEmpty?Colors.grey:Colors.red,
                  tooltip: 'Add Your Routine',
                 
                ),
              ],
            ),

            Flexible(
              child: AnimatedContainer(
                duration: Duration(seconds: 3),  
                curve: Curves.easeInOut,
                child: ListView.builder(
                  itemCount: fieldof.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              fieldof[index],
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        IconButton(
                        
                          padding: EdgeInsets.all(17),
                          onPressed: () {
                            setState(() {
                              fieldof.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete,color: Colors.red,),color: Colors.redAccent,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
