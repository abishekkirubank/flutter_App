import 'package:flutter/material.dart';
import 'package:flutter_appbar/main.dart';
import 'package:flutter_appbar/more.dart';

void main(){
  runApp(const next());
}
class next extends StatelessWidget {
  const next({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: const more(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class more extends StatefulWidget {
  const more({super.key});

  @override
  State<more> createState() => _moreState();
}
class _moreState extends State<more> {

  var as='Hi,Any help...';
  TextEditingController controller1= TextEditingController();
  TextEditingController controller2=TextEditingController();
  int result=0;

void sum(){
  int value1 =int.parse(controller1.text)?? 0;
  int value2 =int.parse(controller2.text)?? 0;
  setState(() {
    result=value1 + value2;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More page'),
        backgroundColor: Colors.brown[100],
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));
          }, icon:Icon(Icons.home))
        ],
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(as),
            ElevatedButton(onPressed:(){
              setState(() {
                if(as=='Hi,Any help...'){
                  as='Welcome';
                }
                else{
                  as='Hi,Any help...';
                }
              });
            }, child:Text('Yes')),
            TextField(
              controller: controller1,
              keyboardType: TextInputType.number,
              decoration:InputDecoration(labelText: 'Enter 1st number '),

            ),

            SizedBox(height: 10),

            TextField(controller: controller2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enetr 2nd number '),

            ),

            SizedBox(height: 10),

            ElevatedButton(onPressed:(){
              sum();
            }, child:Text('Add')),
            SizedBox(height: 50),
            Text('Result: $result'),
          ],
        ),
      ),

    );
  }
}

