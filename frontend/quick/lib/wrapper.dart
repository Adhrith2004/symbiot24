import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>?> sendPostRequest() async {
  final url = 'http://192.168.9.237:8080/predict';
  final headers = {'Content-Type': 'application/json', 'charset': 'utf-8'};
  const body = """{
    "symptoms": [
      "fatigue",
      "mood swings",
      "weight loss",
      "restlessness",
      "sweating",
      "diarrhoea",
      "fast heart rate",
      "excessive hunger",
      "muscle weakness",
      "irritability",
      "abnormal menstruation",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0"
    ]
  }""";

  try {
    final response = await http.post(Uri.parse(url),
        headers: headers, body: body, encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      print('Failed to send data: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
