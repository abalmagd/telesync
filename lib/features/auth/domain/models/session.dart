import 'dart:convert';

import 'package:equatable/equatable.dart';

class Session extends Equatable {
  final String? sessionId;
  final String? sessionExpireDate;
  final String? requestToken;
  final String? requestTokenExpireDate;
  final bool isGuest;

  const Session({
    this.sessionId,
    this.sessionExpireDate,
    this.requestToken,
    this.requestTokenExpireDate,
    this.isGuest = false,
  });
  factory Session.fromRawJson(String str) => Session.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      sessionId: json['session_id'],
      sessionExpireDate: json['expires_at'],
      isGuest: json['is_guest'],
    );
  }

  Map<String, dynamic> toJson() => {
        'session_id': sessionId,
        'expires_at': sessionExpireDate,
        'is_guest': isGuest,
      };

  @override
  String toString() => 'Session('
      'sessionId: $sessionId, '
      'isGuest: $isGuest, '
      'expiresAt: $sessionExpireDate'
      ')';

  @override
  List<Object?> get props => [sessionId, isGuest, sessionExpireDate];
}
