import 'dart:async';

import 'package:js/js.dart';

import 'cordova_googleplus_api.dart';

class GoogleplusPayload {
  String email;
  String userId;
  int expires;
  int expires_in;
  String displayName;
  String familyName;
  String givenName;
  String imageUrl;
  String idToken;
  String serverAuthCode;
  String accessToken;
}

class GoogleplusPlugin {
  GoogleplusOptions _options;

  GoogleplusPlugin(
      {String webClientId = '', String scopes = '', bool offline = false}) {
    this._options = GoogleplusOptions(
        webClientId: webClientId, scopes: scopes, offline: offline);
  }

  Future<GoogleplusPayload> login() {
    Completer<GoogleplusPayload> completer = Completer();
    GooglePlusApi.login(
        _options,
        allowInterop(
            (dynamic result) => completer.complete(_parseJsPayload(result))),
        allowInterop((int codeError) => completer.completeError(codeError)));
    return completer.future;
  }

  Future<GoogleplusPayload> trySilentLogin() {
    Completer<GoogleplusPayload> completer = Completer();
    GooglePlusApi.trySilentLogin(
        _options,
        allowInterop(
            (dynamic result) => completer.complete(_parseJsPayload(result))),
        allowInterop((int codeError) => completer.completeError(codeError)));
    return completer.future;
  }

  Future<String> logout() {
    Completer<String> completer = Completer();
    GooglePlusApi.logout(
        allowInterop((String result) => completer.complete(result)));
    return completer.future;
  }

  Future<String> disconnect() {
    Completer<String> completer = Completer();
    GooglePlusApi.disconnect(
        allowInterop((String result) => completer.complete(result)));
    return completer.future;
  }

  GoogleplusPayload _parseJsPayload(dynamic data) {
    GoogleplusPayload payload = GoogleplusPayload();
    payload.displayName = data.displayName;
    payload.email = data.email;
    payload.familyName = data.familyName;
    payload.givenName = data.givenName;
    payload.idToken = data.idToken;
    payload.imageUrl = data.imageUrl;
    payload.serverAuthCode = data.serverAuthCode;
    payload.userId = data.userId;
    payload.expires = data.expires;
    payload.expires_in = data.expires_in;
    return payload;
  }
}
