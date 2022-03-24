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
  int f1 = 0, f2 = 1;
  int f3 = 0;
  int result = 0;

   fibonacciSeries(int low, int high) {
    if (low < high) {
      while (f1 <= high) {
        if (f1 >= low) {
          result++;
        }
        f1 = f2;
        f2 = f3;
        f3 = f1 + f2;

      }
      return result;
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
                  fibonacciSeries(
                      int.parse(inputFirst.text), int.parse(inputSecond.text));
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Fibonacci Series'),
                          content: Text(result.toString()),
                        );
                      });
                }),
          ],
        ),
      ),
    );
  }
}
