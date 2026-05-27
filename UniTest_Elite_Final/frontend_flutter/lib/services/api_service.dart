import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {

static const String baseUrl =
    'http://localhost:8000/api';

  /// LOGIN
  static Future loginStudent({

    required String email,
    required String password,

  }) async {

    final response = await http.post(

      Uri.parse('$baseUrl/login/'),

      headers: {
        'Content-Type': 'application/json',
      },

      body: jsonEncode({

        'email': email,
        'password': password,
      }),
    );

    return jsonDecode(response.body);
  }

  /// REGISTER
  static Future registerStudent({

    required String fullName,
    required String nationalId,
    required String email,
    required String career,
    required String password,

  }) async {

    final response = await http.post(

      Uri.parse('$baseUrl/register/'),

      headers: {
        'Content-Type': 'application/json',
      },

      body: jsonEncode({

        'full_name': fullName,

        'national_id': nationalId,

        'email': email,

        'career': career,

        'password': password,
      }),
    );

    return jsonDecode(response.body);
  }
}