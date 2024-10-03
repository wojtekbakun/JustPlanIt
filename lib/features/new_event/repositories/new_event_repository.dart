import 'package:http/http.dart' as http;

import 'package:calend/features/core/api/api_endpoints.dart';
import 'package:calend/features/core/api/api_headers.dart';
import 'package:calend/features/core/api/api_service.dart';

class NewEventRepository {
  final ApiService apiService;

  NewEventRepository({required this.apiService});

  Future<http.Response> newEvent(String userInput) async {
    final response = await apiService.post(
      endpoint: ApiEndpoints.generatePlan,
      body: {'userInput': userInput},
      headers: ApiHeaders
          .onlyBearerHeader, //!TODO remove bearer when auth is implemented
    );
    return response;
  }
}
