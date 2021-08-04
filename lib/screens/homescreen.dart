import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "KisanHelper",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(height: 60),
          color: Colors.white,
        ),
        body: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage('assets/adnew.png'), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    color: Colors.green[300],
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(37, 25, 37, 25),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, '/riceclick');
                    },
                    child: Text(
                      "🌾 Rice",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, '/tomatoclick');
                    },
                    child: Text(
                      "🍅 Tomato",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    color: Colors.green[300],
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, '/bananaclick');
                    },
                    child: Text(
                      "🍌 Banana",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(11, 25, 11, 25),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, '/cucumberclick');
                    },
                    child: Text(
                      "🥒 Cucumber",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    color: Colors.green[300],
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(12, 25, 12, 25),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, '/pepperbellclick');
                    },
                    child: Text(
                      "🍏 PepperBell",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, '/potatoclick');
                    },
                    child: Text(
                      "🥔 Potato",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
















// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/disease_classifier');
//                 },
//                 child: Text('Disease Classifier'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/home_page');
//                 },
//                 child: Text('Weather'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
