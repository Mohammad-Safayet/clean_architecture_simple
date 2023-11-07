abstract class JokesRepository {
  Future getJokesCategories();

  Future getJoke(String category);

  Future getRandomJoke();
}
