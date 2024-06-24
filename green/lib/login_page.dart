import 'package:flutter/material.dart';
import 'package:green/main.dart';
import 'package:green/register_page.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Start()));
            },
            icon: const Icon(
              Icons.close,
              weight: 300,
              size: 40,
            )),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Login Now',
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Text('Email/Wow ID'),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'Email/Wow ID',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.purple, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.purple, width: 2.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: const Size(300, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Or login with',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      minimumSize: const Size(300, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.blue[900],
                    size: 40,
                  ),
                  label: Text(
                    'Login with Facebook',
                    style: TextStyle(
                        color: Colors.blue[900], fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      minimumSize: const Size(300, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  icon: Image.asset(
                    'images/google.png',
                    width: 35,
                  ),
                  label: Text(
                    '  Login with Google',
                    style: TextStyle(
                        color: Colors.blue[900], fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '''Don't have an account?''',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>const  RegisterPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: const Size(300, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
