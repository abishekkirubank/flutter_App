import 'package:flutter/material.dart';
import 'Sqflight.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<Map<String, dynamic>> todayDish = [];

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  void _loadOrders() async {
    final orders = await DatabaseHelper().getOrders();
    setState(() {
      todayDish = orders;
    });
  }

  void addDish() {
    DateTime now = DateTime.now();
    String currentDate = "${now.day}-${now.month}-${now.year}";
    String currentTime = "${now.hour}:${now.minute}";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller1 = TextEditingController();
        TextEditingController controller2 = TextEditingController();
        TextEditingController controller3 = TextEditingController();
        TextEditingController controller4 = TextEditingController();
        TextEditingController controller5 = TextEditingController(text: currentDate);
        TextEditingController controller6 = TextEditingController(text: currentTime);
        return AlertDialog(
          title: Text('Write for Remainder',style:GoogleFonts.acme(),),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller1,
                  decoration: InputDecoration(labelText: "Title",labelStyle: GoogleFonts.acme()),
                ),
                TextField(
                  controller: controller2,
                  decoration: InputDecoration(labelText: 'Subtitle',labelStyle: GoogleFonts.acme()),
                ),
                TextField(
                  controller: controller3,
                  decoration: InputDecoration(labelText: 'Content',labelStyle: GoogleFonts.acme()),
                ),
                TextField(
                  controller: controller4,
                  decoration: InputDecoration(labelText: 'Phone No',labelStyle: GoogleFonts.acme()),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: controller5,
                  decoration: InputDecoration(labelText: 'Date',labelStyle: GoogleFonts.acme()),
                ),
                TextField(
                  controller: controller6,
                  decoration: InputDecoration(labelText: 'Time',labelStyle: GoogleFonts.acme()),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () async {
                Map<String, String> order = {
                  'home': controller1.text,
                  'customerName': controller2.text,
                  'deliveryAddress': controller3.text,
                  'phoneNo': controller4.text,
                  'date' : controller5.text,
                  'time' : controller6.text,
                };
                await DatabaseHelper().insertOrder(order);
                _loadOrders();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void editDish(Map<String, dynamic> order) {
    DateTime now = DateTime.now();
    String currentDate = "${now.day}-${now.month}-${now.year}";
    String currentTime = "${now.hour}:${now.minute}";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller1 = TextEditingController(text: order['home']);
        TextEditingController controller2 = TextEditingController(text: order['customerName']);
        TextEditingController controller3 = TextEditingController(text: order['deliveryAddress']);
        TextEditingController controller4 = TextEditingController(text: order['phoneNo']);
        TextEditingController controller5 = TextEditingController(text: currentDate);
        TextEditingController controller6 = TextEditingController(text: currentTime);
        return AlertDialog(
          title: Text('Edit Your Remainder',style: GoogleFonts.acme(),),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,//for correct size of alert box.
              children: [
                TextField(
                  controller: controller1,
                  decoration: InputDecoration(labelText: 'Title',labelStyle: GoogleFonts.acme()),
                ),
                TextField(
                  controller: controller2,
                  decoration: InputDecoration(labelText: 'Subtitle',labelStyle: GoogleFonts.acme()),
                ),
                TextField(
                  controller: controller3,
                  decoration: InputDecoration(labelText: 'Content',labelStyle: GoogleFonts.acme()),
                ),
                TextField(
                  controller: controller4,
                  decoration: InputDecoration(labelText: 'Phone No',labelStyle: GoogleFonts.acme()),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: controller5,
                  decoration: InputDecoration(labelText: 'Date',labelStyle: GoogleFonts.acme()),
                ),
                TextField(
                  controller: controller6,
                  decoration: InputDecoration(labelText: 'Time',labelStyle: GoogleFonts.acme()),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                Map<String, String> updatedOrder = {
                  'home': controller1.text,
                  'customerName': controller2.text,
                  'deliveryAddress': controller3.text,
                  'phoneNo': controller4.text,
                  'date' : controller5.text,
                  'time' : controller6.text,
                };
                await DatabaseHelper().updateOrder(order['id'], updatedOrder);
                _loadOrders();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void deleteOrder(int id) async {
    await DatabaseHelper().deleteOrder(id);
    _loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Notes", style: GoogleFonts.acme()),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todayDish.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shadowColor: Colors.blueGrey,
            elevation: 9,
            child: ListTile(
              title:Text("Title: ${todayDish[index]['home']}", style: GoogleFonts.acme()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("SubTitle: ${todayDish[index]['customerName']}",style: GoogleFonts.acme(),),
                  Text('Content: ${todayDish[index]['deliveryAddress']}',style: GoogleFonts.acme(),),
                  Text('Phone No: ${todayDish[index]['phoneNo']}',style: GoogleFonts.acme(),),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Date: ${todayDish[index]["date"]}",style: GoogleFonts.acme(),),SizedBox(width: 20,),
                      Text("Time: ${todayDish[index]["time"]}",style: GoogleFonts.acme(),),
                    ],
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      editDish(todayDish[index]);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteOrder(todayDish[index]['id']);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: () {
            addDish();
          },
          child: Icon(Icons.add, color: Colors.yellow),
          backgroundColor: Colors.blueGrey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}
