import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchData() async {
  final url = 'https://api.example.com/data';

  final response =
      await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Parsed data: $data');
  } else {
    print('Failed to load data: ${response.statusCode}');
  }
}
