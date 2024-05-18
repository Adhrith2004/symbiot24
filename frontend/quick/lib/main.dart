import 'package:flutter/material.dart';
import 'wrapper.dart'; // Import the new API service file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiseaseInfoScreen(),
    );
  }
}

class DiseaseInfoScreen extends StatefulWidget {
  @override
  _DiseaseInfoScreenState createState() => _DiseaseInfoScreenState();
}

class _DiseaseInfoScreenState extends State<DiseaseInfoScreen> {
  String disease = '';
  String treatment = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final responseData = await sendPostRequest();
    if (responseData != null) {
      setState(() {
        disease = responseData['disease'];
        treatment = responseData['treatment'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Information'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 20.0,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/your_image.png', // Replace with your image path
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Disease: $disease',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'Treatment: $treatment',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
