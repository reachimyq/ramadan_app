import 'package:flutter/material.dart';
import 'package:ramadan_app/constants.dart';
import 'package:ramadan_app/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NMC Ramadan App',
      home: MyHomePage(title: 'Main Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: kdarkBlue,
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          color: kdarkBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.24,
                  child: Image.asset('images/nmclogowhite.png')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.075,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Ramadan',
                      style: TextStyle(
                          color: kbeige,
                          fontSize: 52,
                          fontFamily: 'PlusJakartaSans-SemiBold',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                    ),
                    const Text(
                      'March-April 2023',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: kbeige, fontSize: 21),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                    ),
                    const Text(
                      'Ramadan 1444',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: kbeige, fontSize: 21),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(_createRoute0());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: kbeige,
                          shape: BoxShape.rectangle,
                        ),
                        child: const Center(
                          child: Text(
                            'Enter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kdarkBlue,
                                fontSize: 21,
                                fontFamily: 'PlusJakartaSans-SemiBold',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Route _createRoute0() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Menu(),
      transitionDuration: const Duration(seconds: 0),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  // Route _createRoute1() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) =>
  //         const Delegates(),
  //     transitionDuration: const Duration(seconds: 0),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return child;
  //     },
  //   );
  // }

  // Route _createRoute2() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => const Speakers(),
  //     transitionDuration: const Duration(seconds: 0),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return child;
  //     },
  //   );
  // }

  // Route _createRoute3() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) =>
  //         const Information(),
  //     transitionDuration: const Duration(seconds: 0),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return child;
  //     },
  //   );
  // }
}
