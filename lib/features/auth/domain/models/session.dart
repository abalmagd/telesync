class Session {
  Session({
    required this.requestToken,
    required this.expiresAt,
    this.sessionId,
  });

  String requestToken;
  String? sessionId;
  DateTime expiresAt;

  factory Session.fromJson(Map<String, dynamic> json) {
    final expiresAt =
        (json['expires_at'] as String).replaceAll(' UTC', 'Z').trim();
    return Session(
      requestToken: json['request_token'],
      expiresAt: DateTime.parse(expiresAt).toLocal(),
      sessionId: json['session_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'request_token': requestToken,
      'session_id': sessionId,
      'expires_at': expiresAt.toString(),
    };
  }

  Session copyWith({
    String? requestToken,
    String? sessionId,
    DateTime? expiresAt,
  }) {
    return Session(
      requestToken: requestToken ?? this.requestToken,
      expiresAt: expiresAt ?? this.expiresAt,
      sessionId: sessionId ?? this.sessionId,
    );
  }
}
