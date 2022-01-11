import 'package:filmguru/data/model/movie_item.dart';
import 'package:filmguru/data/simple_bloc/simple_bloc.dart';
import 'package:filmguru/repository/movies_repository.dart';

class MoviesListBloc extends SimpleBloc<List<MovieItem>> {
  MoviesListBloc({
    required this.moviesRepository,
  });

  final MoviesRepository moviesRepository;

  @override
  Future<List<MovieItem>> action([arguments]) async {
    final result = await moviesRepository.getMovies();
    return result;
  }

  @override
  void execute() {
    if (!state.inProgress) {
      add(SimpleBlocEvent.execute());
    }
  }
}
