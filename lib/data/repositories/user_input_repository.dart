import 'package:http/http.dart' as http;

import 'package:calend/services/api/api_endpoints.dart';
import 'package:calend/services/api/api_headers.dart';
import 'package:calend/services/api/api_service.dart';

class UserInputRepository {
  final ApiService apiService;

  UserInputRepository({required this.apiService});

  Future<http.Response> submitUserInput(String userInput) async {
    final response = await apiService.post(
      endpoint: ApiEndpoints.generatePlan,
      body: {'userInput': userInput},
      headers: ApiHeaders
          .onlyBearerHeader, //!TODO remove bearer when auth is implemented
    );
    return response;
  }
}
