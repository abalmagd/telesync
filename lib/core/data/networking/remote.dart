enum Remote {
  auth('/auth'),
  login('/login');

  final String path;

  const Remote(this.path);
}
