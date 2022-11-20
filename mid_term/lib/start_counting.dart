import 'package:flutter/material.dart';
import 'package:mid_term/tasbhees_list_page.dart';

class TasbeehCountingPage extends StatefulWidget {
  final String? title;
  final String? count;
  const TasbeehCountingPage({ this.title, this.count, super.key});

  @override
  State<TasbeehCountingPage> createState() => _TasbeehCountingPageState();
}

class _TasbeehCountingPageState extends State<TasbeehCountingPage> {
final countController = TextEditingController();

  int count = 0;
  void _increement() {
    setState(() {
      count ++;
    });
  }
  void reset() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Start Your Counting"),
      ),
      body: SafeArea(
        child: Center(
          child: widget.title ==null ?
          InkWell(
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) =>  TasbheePage()));
            },
            child: const Text("Click to Select Tasbeeh",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          )
          : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                       Text(
                       widget.title.toString(),
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                       count.toString(),
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
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