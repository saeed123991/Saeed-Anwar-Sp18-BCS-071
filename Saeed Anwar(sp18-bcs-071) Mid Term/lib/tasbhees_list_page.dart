import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mid_term/counting.dart';
import 'package:mid_term/home_page.dart';
import 'package:mid_term/start_counting.dart';

class TasbheePage extends StatefulWidget {
  final String? count ;
  DocumentSnapshot? docid;

   TasbheePage({this.count, this.docid, Key? key}) : super(key: key);

  @override
  State<TasbheePage> createState() => _TasbheePageState();
}

class _TasbheePageState extends State<TasbheePage> {
  final tasbeehController = TextEditingController();

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('data').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('data');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Tasbeeh"),
        centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/tasbeeh.jpg"), 
            opacity: 0.4, 
           
            ),
        ),
        child: StreamBuilder(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("something is wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
      
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return InkWell(
                  
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            CountTasbeeh(
                              docid: snapshot.data!.docs[index],
                              title: snapshot.data!.docs[index]['title'],
                              
                              ),
                      ),
                    );
                    // Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    // TasbeehCountingPage(
                    //   title: snapshot.data!.docChanges[index].doc['title'],
                    //   count: snapshot.data!.docChanges[index].doc['count'],
                    //   )
                    // ));
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 3,
                            right: 3,
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            leading:  CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage("https://sc04.alicdn.com/kf/Hf8539f0669dd43189e2a2f227e259141d.jpg"),
                            ),
                            trailing: Text(
                              snapshot.data!.docs[index]['count'],
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                              ),
                            ),
                            title: Text(
                              snapshot.data!.docs[index]['title'],
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
         );
  }
}
