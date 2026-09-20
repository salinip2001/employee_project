import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/api_constants.dart';
import '../models/employee_model.dart';

class EmployeeRemoteDataSource {
  final http.Client client;

  EmployeeRemoteDataSource({required this.client});

  Future<List<EmployeeModel>> fetchEmployees() async {
    final response = await client.get(
      Uri.parse('${ApiConstants.baseUrl}/employees'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      final List<dynamic> data = body['data'] as List<dynamic>;
      return data
          .map((json) => EmployeeModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
        'Failed to load employees (status ${response.statusCode})',
      );
    }
  }
}
