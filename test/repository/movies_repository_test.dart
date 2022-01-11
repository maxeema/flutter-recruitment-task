import 'package:filmguru/data/api/movies_service_local.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('Future.value() returns the value', () async {
    final moviesRepository = MoviesServiceLocal();
    final movies = await moviesRepository.getMovies();
    print('movies.length: ${movies.length}');
    expect(movies.length, equals(20));
  });
}