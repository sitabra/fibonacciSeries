import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController inputFirst = TextEditingController();
  TextEditingController inputSecond = TextEditingController();

  List<int> finalResult = [];
  int f1=0 , f2=1, f3=1;
  double result =0;

  String? fibonacciSeries() {
    int firstRange = int.parse(inputFirst.text.toString());
    int lastRange = int.parse(inputSecond.text.toString());


    if (firstRange < lastRange) {
      while(f1 <= lastRange){
        if(f1 >= firstRange){
          result++;
          f1 = f2;
          f2 = f3;
          f3 = f1 + f2;
        }
      }throw result;
    } else {
      ///todo show a error message.eg. range not valid
    }
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
                onPressed: () {
                  fibonacciSeries();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Fibonacci Series'),
                          content: Text(finalResult.join(',')),
                        );
                      });
                }),
          ],
        ),
      ),
    );
  }
}
