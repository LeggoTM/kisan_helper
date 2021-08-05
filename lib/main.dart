import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:kisan_helper/bananaclick.dart';
import 'package:kisan_helper/cucumberclick.dart';
import 'package:kisan_helper/fertcalc.dart';
import 'package:kisan_helper/fertcalcbanana.dart';
import 'package:kisan_helper/fertcalccucumber.dart';
import 'package:kisan_helper/fertcalcpepper.dart';
import 'package:kisan_helper/fertcalcpotato.dart';
import 'package:kisan_helper/fertcalctomato.dart';
import 'package:kisan_helper/pepperbellclick.dart';
import 'package:kisan_helper/potatoclick.dart';
import 'package:kisan_helper/screens/disease_classifier.dart';
import 'package:kisan_helper/screens/homescreen.dart';
import 'package:kisan_helper/riceclick.dart';
import 'package:kisan_helper/tomatoclick.dart';
import 'package:kisan_helper/views/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => MySplashScreen(),
        '/home': (context) => HomeScreen(),
        '/disease_classifier': (context) => DiseaseClassifier(),
        '/home_page': (context) => LoadingScreen(),
        '/riceclick': (context) => RiceDiseaseDetection(),
        '/fertilizercalculator': (context) => FertilizerCalculator(),
        '/tomatoclick': (context) => TomatoDiseaseDetection(),
        '/bananaclick': (context) => BananaDiseaseDetection(),
        '/cucumberclick': (context) => CucumberDiseaseDetection(),
        '/pepperbellclick': (context) => PepperBellDiseaseDetection(),
        '/potatoclick': (context) => PotatoDiseaseDetection(),
        '/fertcalctomato': (context) => FertCalcTomato(),
        '/fertcalcbanana': (context) => FertCalcBanana(),
        '/fertcalccucumber': (context) => FertCalcCucumber(),
        '/fertcalcpepperbell': (context) => FertCalcPepperBell(),
        '/fertcalcpotato': (context) => FertCalcPotato(),
      },
    );
  }
}

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/kisanlogo.png"),
      title: Text(
        "KisanHelper",
        style: TextStyle(fontSize: 18),
      ),
      showLoader: true,
      navigator: HomeScreen(),
      durationInSeconds: 3,
    );
  }
}
