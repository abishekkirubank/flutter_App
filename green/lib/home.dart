import 'package:flutter/material.dart';
import 'package:green/main.dart';
import "package:flutter_rating_bar/flutter_rating_bar.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = TextEditingController();

  List<Map<String, String>> data = [
    {'name': 'Institute', 'image': 'images/institute.png'},
    {'name': 'Teacher Managers', 'image': 'images/teacher.png'},
    {'name': 'Batches', 'image': 'images/batches.png'},
    {'name': 'Add Course', 'image': 'images/add_course.png'},
    {'name': 'Tuition Class', 'image': 'images/class.png'},
    {'name': 'Attendance', 'image': 'images/attendance.png'},
    {'name': 'Leave Management', 'image': 'images/leave.png'},
    {'name': 'MSP Regularisation', 'image': 'images/regularisation.png'},
    {'name': 'Holiday Management', 'image': 'images/holiday.png'},
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    bool hasOddItems = data.length % 2 != 0;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Start()));
          },
          icon: const Icon(
            Icons.close,
            weight: 300,
            size: 40,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.dehaze,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 70),
                          const Text(
                            'Hello, Anto',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 70),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Find tutor who will help you best",
                        style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: search,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Search All',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset('images/user.png', width: 100, height: 90),
                      const SizedBox(width: 2),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('James'),
                          const SizedBox(height: 2),
                          const Text(
                            'Wow ID: TS9100081212120071',
                            style: TextStyle(letterSpacing: -1),
                          ),
                          RatingBarIndicator(
                            rating: 3.5,
                            itemBuilder: (context, _) =>const  Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Image.asset('images/education.png', width: 50, height: 50),
                          const SizedBox(height: 5),
                          const Text('Teacher'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Text('Attendance'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: data.length + (hasOddItems ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == data.length) {
                        // This is the placeholder for centering the last item
                        return Center(
                          child: Image.asset(
                            'images/emt_image.png',
                            color:const  Color.fromRGBO(255, 255, 255, 0.1),
                            colorBlendMode: BlendMode.modulate,
                          ),

                        );
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              data[index]['image']!,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Text(data[index]['name']!),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor:Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon:const  Icon(Icons.home)), label: 'Home',tooltip: 'Home'),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon:const  Icon(Icons.card_travel_outlined)), label: 'Courses',tooltip: 'Courses'),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon:const  Icon(Icons.edit_note_rounded)), label: 'Enrollments',tooltip:'Enrollments' ),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon:const  Icon(Icons.star)), label: 'Ratings',tooltip: 'Ratings'),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon:const  Icon(Icons.person)), label: 'Profile',tooltip: 'Profile')

        ],
      ),
    );
  }
}
