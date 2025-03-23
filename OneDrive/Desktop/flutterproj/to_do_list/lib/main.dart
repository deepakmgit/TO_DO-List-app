import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {

  String displayedText="No";
  List<String> taskList = [];

  TextEditingController textController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.amberAccent,
          title:Text("To do List")),
        body: Column(
          children:[
            Row(
            
              children: [
               Expanded(
                child:Container(
              padding:EdgeInsets.all(10),
              child:TextField(
              controller: textController, 
              decoration:InputDecoration(
              border:OutlineInputBorder(),label:Text("Enter a Task"),
              )
              )
              )
              ),
              MaterialButton(
              color:Colors.blue,
              height:40,
              shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
              onPressed:(){
                setState(() {
                    taskList.add(textController.text);
                    textController.clear();
                });
                
              },
              child:Text("Add"),),
           
            ],),
             
            Flexible(
              child: ListView.builder(
                itemCount:taskList.length,
                itemBuilder:(context,index)  {
                    return Row(children: [
                Expanded(
                child:Container(
                  padding:EdgeInsets.all(10),
                  child:Text(taskList[index]),
                ),
                ),
                MaterialButton(
                  child:Icon(Icons.delete,color:Colors.red),
                  onPressed: (){
                    setState(() {
                      taskList.removeAt(index);
                    });
                  })
              ]);
                    
              }
              ),
            ),

        
          
          ],
         

        

        ),
      ),
    );
  }
}
