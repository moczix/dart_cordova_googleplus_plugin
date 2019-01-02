import 'dart:html';

import 'package:cordova_googleplus_plugin/cordova_googleplus_plugin.dart';

String CLIENT_ID = 'your google client it';

void main() {
  GoogleplusPlugin googleplus = GoogleplusPlugin(webClientId: CLIENT_ID);

  googleplus
      .trySilentLogin()
      .then((GoogleplusPayload payload) => print(payload.email));

  document.getElementById('something').onClick.listen((MouseEvent event) {
    googleplus
        .login()
        .then((GoogleplusPayload payload) => print(payload.email));
  });
}
