import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:telesync/core/data/local/shared_prefs.dart';
import 'package:telesync/features/auth/data/entities/session_entity.dart';

class Session {
  final String accessToken;
  final String refreshToken;

  Session({required this.accessToken, required this.refreshToken});

  factory Session.fromEntity(SessionEntity session) {
    return Session(
      accessToken: session.accessToken,
      refreshToken: session.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  void cacheSession(SharedPreferences prefs) {
    prefs.setString(SharedPrefsKeys.session, jsonEncode(toMap()));
  }

  static Session? loadSession(SharedPreferences prefs) {
    final sessionStr = prefs.getString(SharedPrefsKeys.session);
    if(sessionStr == null) return null;

    final sessionJson = jsonDecode(sessionStr);
    final entity = SessionEntity.fromJson(sessionJson);

    final session = Session.fromEntity(entity);

    return session;
  }
}
