import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SurveyResults extends StatefulWidget {
  const SurveyResults({super.key, required this.title});

  final String title;

  @override
  State<SurveyResults> createState() => _SurveyResultsState();
}

class _SurveyResultsState extends State<SurveyResults> {
  int _redCounter = 2;
  int _yellowCounter = 5;
  int _greenCounter = 10;
  final user = FirebaseAuth.instance.currentUser!;

  void _incrementCounter(String color) {
    setState(() {
      if (color == 'red') {
        _redCounter++;
      } else if (color == 'yellow') {
        _yellowCounter++;
      } else if (color == 'green') {
        _greenCounter++;
      }
    });
  }

  void _decrementCounter(String color) {
    setState(() {
      if (color == 'red') {
        _redCounter--;
      } else if (color == 'yellow') {
        _yellowCounter--;
      } else if (color == 'green') {
        _greenCounter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the SurveyResults object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello ${user.email}!"),
            const Row(children: [
              SizedBox(width: 30),
              Text(
                "Candidate Qualifications",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    height: 30,
                    width: _redCounter /
                        (_redCounter + _yellowCounter + _greenCounter) *
                        350,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                const SizedBox(
                  width: 10,
                ),
                AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    height: 30,
                    width: _yellowCounter /
                        (_redCounter + _yellowCounter + _greenCounter) *
                        350,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 242, 125),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                const SizedBox(
                  width: 10,
                ),
                AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    height: 30,
                    width: _greenCounter /
                        (_redCounter + _yellowCounter + _greenCounter) *
                        350,
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Negative',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          iconSize: 25,
                          color: Colors.red,
                          onPressed: () {
                            _decrementCounter('red');
                          },
                        ),
                        const Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '$_redCounter',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            icon: const Icon(Icons.add),
                            iconSize: 25,
                            color: Colors.red,
                            onPressed: () {
                              _incrementCounter('red');
                            }),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    const Text(
                      'Neutral',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 230, 0),
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          iconSize: 25,
                          color: Colors.yellow,
                          onPressed: () {
                            _decrementCounter('yellow');
                          },
                        ),
                        const Icon(
                          Icons.sentiment_neutral,
                          color: Colors.yellow,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '$_yellowCounter',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            icon: const Icon(Icons.add),
                            iconSize: 25,
                            color: Colors.yellow,
                            onPressed: () {
                              _incrementCounter('yellow');
                            }),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    const Text(
                      'Positive',
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          iconSize: 25,
                          color: Colors.green,
                          onPressed: () {
                            _decrementCounter('green');
                          },
                        ),
                        const Icon(
                          Icons.sentiment_satisfied_alt,
                          color: Colors.green,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '$_greenCounter',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            icon: const Icon(Icons.add),
                            iconSize: 25,
                            color: Colors.green,
                            onPressed: () {
                              _incrementCounter('green');
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  color: Colors.deepPurple[200],
                  child: const Text('sign out')),
            )
          ],
        ),
      ),
    );
  }
}
