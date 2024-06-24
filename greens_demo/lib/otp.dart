import 'package:flutter/material.dart';
import 'package:green/home.dart';
import 'package:green/register_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});


  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()));
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
              Image.asset('images/otp.png'),
              const SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    border: const Border(
                      top: BorderSide(color: Colors.black12, width: 4),
                    )),
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    const Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: Text('OTP Verification', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: Text('Enter the OTP sent to +91 xxxxxxxxxx', style: TextStyle(fontWeight: FontWeight.w100, color: Colors.grey),),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: otpNumber,
                        decoration: InputDecoration(
                          hintText: 'Enter the OTP',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.purple, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.purple, width: 2.0)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          minimumSize: const Size(300, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text(
                        'Verify code',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
