class SessionEntity {
  final String accessToken;
  final String refreshToken;

  SessionEntity({required this.accessToken, required this.refreshToken});

  factory SessionEntity.fromJson(Map<String, dynamic> json) {
    return SessionEntity(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
