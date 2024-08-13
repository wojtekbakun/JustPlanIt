import 'package:calend/data/repositories/user_input_repository.dart';
import 'package:http/http.dart' as http;

class SubmitUserInputUseCase {
  final UserInputRepository repository;

  SubmitUserInputUseCase({required this.repository});

  Future<http.Response> call(String text) async {
    // This is the use case that will be called from the presentation layer
    return await repository.submitUserInput(text);
  }
}
