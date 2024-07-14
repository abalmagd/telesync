class Remote {
  /// The value here is the key name in the .env file
  static const apiToken = 'API_TOKEN';
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const tmdbDomain = 'https://www.themoviedb.org/';
  static const gravatar = 'https://www.gravatar.com/avatar/';
  static const tmdbImage = 'https://image.tmdb.org/t/p/';

  // region Authentication
  static const authentication = '/authentication';
  static const session = '$authentication/session';
  static const newSession = '$authentication/session/new';
  static const newGuestSession = '$authentication/guest_session/new';
  static const createRequestToken = '$authentication/token/new';
// endregion
}
