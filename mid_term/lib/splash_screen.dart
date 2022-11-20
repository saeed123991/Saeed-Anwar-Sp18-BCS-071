import 'package:flutter/material.dart';
import 'package:mid_term/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                height: 300,
                width: 300,
                child: Image.asset("assets/tasbeeh.jpg"),
              ),
              const SizedBox(height: 20),
              CircularProgressIndicator(),
            ],
            ), 
            ),
            Positioned(
              bottom: 20,
              child: Column(
                children: const[
                  Text("Saeed Anwar", 
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  Text("Sp18-BCS-071", 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ],
              ), 
              ),
        ],
      ),
    );
  }
}