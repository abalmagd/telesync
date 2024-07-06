class EnvironmentVariables {
  // TODO: Add API keys to .env
  static const apiKeyV3 = '';
  static const apiKeyV4 = '';
  static const baseUrl = 'https://api.themoviedb.org/3';

  static const tmdbDomain = 'https://www.themoviedb.org/';
  static const gravatar = 'https://www.gravatar.com/avatar/';
  static const tmdbImage = 'https://image.tmdb.org/t/p/';

  //
  static const posterQuality = 'w342';
  static const backdropQuality = 'w780';
  static const ogBackdropQuality = 'original';

  static const authentication = '/authentication';
  static const session = '$authentication/session';
  static const newSession = '$authentication/session/new';
  static const newGuestSession = '$authentication/guest_session/new';
  static const createRequestToken = '$authentication/token/new';

  static const account = '/account';

  static const discover = '/discover';

  static const movie = '/movie';
  static const popularMovies = '$movie/popular';
  static const topRatedMovies = '$movie/top_rated';
  static const nowPlayingMovies = '$movie/now_playing';
  static const upcomingMovies = '$movie/upcoming';
  static const trendingMovies = '/trending/movie/day';

  static const series = '/tv';
  static const discoverSeries = '$discover$series';
  static const topRatedSeries = '$series/top_rated';
  static const trendingSeries = '/trending/$series/day';

  static const genre = '/genre';
  static const movieGenres = '$genre$movie/list';
  static const seriesGenres = '$genre$series/list';

  static const person = '/person';
  static const popularPersons = '$person/popular';
  static const trendingPersons = '/trending/$person';
}
