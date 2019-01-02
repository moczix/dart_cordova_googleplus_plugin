@JS()
library googleplus;

import 'package:js/js.dart';

@JS()
@anonymous
class GoogleplusOptions {
  external String get webClientId;
  external set webClientId(String value);
  external String get scopes;
  external set scopes(String value);
  external bool get offline;
  external set offline(bool value);
  external factory GoogleplusOptions(
      {webClientId = '', scopes = '', offline = false});
}

@JS('plugins.googleplus')
class GooglePlusApi {
  external static login(
      GoogleplusOptions options, Function success, Function failure);
  external static trySilentLogin(
      GoogleplusOptions options, Function success, Function failure);
  external static logout(Function success);
  external static disconnect(Function success);
}
