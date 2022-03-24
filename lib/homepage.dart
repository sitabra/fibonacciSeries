import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final inputFirst = TextEditingController();
  final inputSecond = TextEditingController();

  String? text = '';

  String? fibonacciSeries(){
    int start = int.parse(inputFirst.text.toString());
    int end = int.parse(inputSecond.text.toString());
    int next ;
    var c;

    if(start <= end) {
      for (int i = start; i <= end; i++) {
        if( c <= 1) {
          next = c;
        } else{
          next = start + end;
          start = end;
          end = next;
        }
      }
      }
    return text;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fibonacci Series'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: inputFirst,
              decoration: const InputDecoration(
                hintText: ('Enter the first number'),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            TextField(
              keyboardType: TextInputType.number,
              controller: inputSecond,
              decoration: const InputDecoration(
                hintText: ('Enter the Second Number'),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
              ElevatedButton(
                child: const Text('Check'),
                onPressed: (){
                  fibonacciSeries();
                  showDialog(context: context,
                      builder: (context){
                    return AlertDialog(
                      title: const Text('Fibonacci Series'),
                      content: Text(text!),

                    );
                  });
                }),
          ],
        ),
      ),
    );
  }
}
