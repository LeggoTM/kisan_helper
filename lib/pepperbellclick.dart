import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';

class PepperBellDiseaseDetection extends StatefulWidget {
  @override
  _DiseaseDetectionState createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<PepperBellDiseaseDetection> {
  List? _outputs;
  var _image;
  bool _loading = false;
  int _selectedIndex = 1;
  File? _storedImage;

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/pepper_bell.tflite",
      labels: "assets/pepper_bell.txt",
      numThreads: 1,
    );
  }

  @override
  void initState() {
   
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  classifyImage(XFile image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      captureImage();
    } else if (index == 2) {
      pickImage();
    } else if (index == 1) {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
      _storedImage = File(image.path);
    });
    classifyImage(_image);
  }

  captureImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
      _storedImage = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Pepper Bell",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          //elevation: 0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Gallery',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _loading
                    ? Container(
                        height: 300,
                        width: 300,
                      )
                    : Container(
                        margin: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _image == null
                                ? Container()
                                : Image.file(
                                    _storedImage!,
                                    // scale: 3,
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            _image == null
                                ? Container()
                                : _outputs != null
                                    ? Column(
                                        children: [
                                          Text(
                                            _outputs![0]["label"],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          //_outputs[0]["label"]=="2 banana_black_sigatoka"Text('Good')?null:
                                          Text(_outputs![0]["label"] ==
                                                  "0 pepper_bell_bactrerial_spot"
                                              ? "Biological Control: Submerge seeds for 1 minute in 1.3% SODIUM HYPOCHLODITE OR HOT WATER\nChemical Control:STREPTOMYCIN SULPHATE 90.0% SP, TETRACYCLINE Hydrochloride 10.0% SP"
                                              : _outputs![0]["label"] ==
                                                      "1 pepper_bell_healthy"
                                                  ? ""
                                                  : "")
                                        ],
                                      )
                                    : Container(child: Text("")),
                            FlatButton(
                                color: Colors.green[300],
                                textColor: Colors.white,
                                disabledColor: Colors.grey,
                                disabledTextColor: Colors.black,
                                padding: EdgeInsets.fromLTRB(24, 25, 24, 25),
                                splashColor: Colors.greenAccent,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/fertcalcpepperbell');
                                },
                                child: Text('Fertilizer Calculator')),
                          ],
                        ),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
