import 'package:filmguru/data/model/movie_item.dart';
import 'package:filmguru/data/simple_bloc/simple_bloc.dart';
import 'package:filmguru/feature/movies_list/bloc/movies_list_bloc.dart';
import 'package:filmguru/feature/movies_list/widgets/movie_item_row.dart';
import 'package:filmguru/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mainAppBarTitle),
      ),
      body: BlocBuilder<MoviesListBloc, SimpleBlocState<List<MovieItem>>>(
        builder: (context, state) {
          if (state.inProgress) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.hasData) {
            final movies = state.asData;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: movies.length,
              itemBuilder: (context, idx) {
                final movie = movies[idx];
                return MovieItemRow(movie);
              }
            );
          }
          if (state.hasError) {
            return Text('${state.asError}');
            // TODO show the "Reload" button bellow to retry fetching data
          }
          // TODO show the "Load" button (the case we didn't call the "execute" on our MoviesListBloc)
          return Container();
        }
      ),
    );
  }
}
