import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CountTasbeeh extends StatefulWidget {
  final String? title;
  DocumentSnapshot docid;
  CountTasbeeh({required this.docid, this.title});

  @override
  _CountTasbeehState createState() => _CountTasbeehState();
}

class _CountTasbeehState extends State<CountTasbeeh> {
   int count = 0;
  void _increement() {
    setState(() {
      content.text = count.toString();
      count ++;
      content.text = count.toString();
    });
  }

  void reset() {
    setState(() {
      count = 0;
      content.text = count.toString();
    });
  }

  TextEditingController content = TextEditingController();

  @override
  void initState() {
  
    content = TextEditingController(text: widget.docid.get('count'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Start Reading"),
      centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/tasbeeh.jpg"), 
            opacity: 0.2, 
           
            ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                         widget.title.toString(),
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: content,
                  readOnly: true,
                  decoration:  const InputDecoration(
                    border: OutlineInputBorder()
                  ),
                 
                ),
              )
            ],
          ),
        ),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                   _increement();
                   widget.docid.reference.update({
                'count': content.text,
              });
                  },
                  child: const Text("Count"),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    reset();
                     widget.docid.reference.update({
                'count': content.text,
              });
                  },
                  child: const Text("Reset"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}