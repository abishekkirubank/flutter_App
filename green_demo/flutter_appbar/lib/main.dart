import 'package:flutter/material.dart';
import 'package:flutter_appbar/more.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home:const demo());
  }
}
class demo extends StatefulWidget {
  const demo({super.key});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  var ak="HI all ...!";
  void change(){
    setState(() {
     ak="Camera , Take a photo";
    });
  }
  var img='image/dhoni.jpg';
  void my_img(){
    setState(() {
      if(img=='image/dhoni.jpg'){
        img='image/virat.jpg';
      }
      else{
        img='image/dhoni.jpg';
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Flutter App Bar"),

        // leading: IconButton(onPressed:(){}, icon:Icon(Icons.menu)) ,//it is used for logo,menu and ect.
        actions: [
          Icon(Icons.person),
          IconButton(onPressed:(){
            change();
          }, icon:Icon(Icons.camera_alt)),
          IconButton(onPressed:(){
            setState(() {
              ak="Share,Share with friends";
            });
          }, icon:Icon(Icons.share)),
          IconButton(onPressed:(){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>next()));
           setState(() {
             ak="More,how can i help you";
           });
          }, icon:Icon(Icons.more_horiz))
        ],
        backgroundColor:Colors.brown[100],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName:Text('akash'), accountEmail:Text('akashkv@gmail.com')),
            ListTile(title: Text('Account'),
            leading: Icon(Icons.person)),
            Divider(height: 20),
            ListTile(title: Text('Information'),
            leading: Icon(Icons.info)),
            Divider(height: 20),
            ListTile(title: Text('About'),
                leading: Icon(Icons.share)),
          ],
        ),
      ),
      body:
      Center(
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(ak ,style: TextStyle(color: Colors.red,fontSize: 60.0),
          ),
            Image.asset(img),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        my_img();
      },
          child:Icon(Icons.add)),
    );
  }
}
