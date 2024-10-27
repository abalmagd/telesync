import 'package:easy_localization/easy_localization.dart';
import 'package:telesync/core/domain/constants/constants.dart';

class Session {
  Session({
    required this.requestToken,
    required this.expiresAt,
  });

  String requestToken;
  DateTime expiresAt;

  factory Session.fromJson(Map<String, dynamic> json) {
    final expiresAt =
        (json['expires_at'] as String).replaceAll(' UTC', 'Z').trim();
    return Session(
      requestToken: json['request_token'],
      expiresAt: DateTime.parse(expiresAt).toLocal(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'request_token': requestToken,
      'expires_at': expiresAt.toString(),
    };
  }
}
