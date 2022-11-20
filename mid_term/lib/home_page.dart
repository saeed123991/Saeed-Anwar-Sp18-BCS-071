import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mid_term/start_counting.dart';
import 'package:mid_term/tasbhees_list_page.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tasbeehController = TextEditingController();
  final limitController = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saeed Anwar"),
        centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/tasbeeh.jpg"), 
            opacity: 0.5, 
           
            ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  TasbheePage()));
                    },
                    child: const Text("Saved Tasbhees"),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  TasbeehCountingPage()));
                    },
                    child: const Text("Start Counting"),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "Add New Tasbhee",
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.w600),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  const Text("Tesbeeh Name", style: TextStyle(fontWeight: FontWeight.w500),),
                                const SizedBox(height: 5),
                                  TextField(
                                   controller: tasbeehController,
                                   decoration: const InputDecoration(
                                     hintText: "Enter Tasbeeh Name",
                                     border: OutlineInputBorder()
                                   ),
                                 ),
                                 const SizedBox(height: 10),
                                  TextField(
                                   controller: limitController,
                                   decoration: const InputDecoration(
                                     hintText: "Enter Your Counting Limit",
                                     border: OutlineInputBorder()
                                   ),
                                 ),
      
                                  const SizedBox(height: 30),
                                  Center(
                                    child: SizedBox(
                                      height: 45,
                                      width: 100,
                                      child: ElevatedButton(
                                      onPressed:(){
                                        ref.add({
                                          'title': tasbeehController.text,
                                          'counting_limit' : limitController.text,
                                          "count" : "0",
                                        }).whenComplete(() {
                                          Navigator.pop(context);
                                        });
                                        tasbeehController.clear();
                                        limitController.clear();
                                      
                                        
                                      },
                                        child:  const Text("Add"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
      
                            );
                          });
                    },
                    child: const Text("Custom Tasbhees"),
                  ),
                ),
                const SizedBox(height: 50),
                
              ],
            ),
          ),
        ),
      ),
    );
  }


}



