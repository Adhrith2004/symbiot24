import 'package:flutter/material.dart';

class PatientDiagnosisPage extends StatelessWidget {
  final String disease;
  final String treatment;

  const PatientDiagnosisPage(
      {Key? key, required this.disease, required this.treatment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Diagnosis'),
      ),
      body: Center(
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
    );
  }
}
