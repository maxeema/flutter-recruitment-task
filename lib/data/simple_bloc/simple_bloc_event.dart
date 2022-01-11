part of 'simple_bloc.dart';

class SimpleBlocEvent {
  final dynamic arguments;

  const SimpleBlocEvent._(this.arguments);

  factory SimpleBlocEvent.execute({dynamic arguments}) =>
      SimpleBlocEvent._(arguments);
}
