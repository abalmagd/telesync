class Session {
  Session({
    required this.requestToken,
    required this.expiresAt,
  });

  String requestToken;
  DateTime expiresAt;

  factory Session.fromJson(Map<String, dynamic> json) {
    final expiresAt = (json['expires_at'] as String).replaceAll(' UTC', '');
    return Session(
      requestToken: json['request_token'],
      expiresAt: DateTime.parse(expiresAt),
    );
  }
}
