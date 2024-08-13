import 'package:calend/core/constants/keys.dart';

class ApiHeaders {
  static const Map<String, String> onlyBearerHeader = {
    'Authorization': ApiKeys.bearer,
  };
}
