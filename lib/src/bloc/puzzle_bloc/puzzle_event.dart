part of 'puzzle_bloc.dart';

abstract class PuzzleEvent extends Equatable {
  // final int? index;
  const PuzzleEvent();

  @override
  List<Object?> get props => [];
}

class PuzzleStartEvent extends PuzzleEvent {
  // const PuzzleStartEvent() : super(null);
}

class PuzzleMoveEvent extends PuzzleEvent {
  final int index;
  const PuzzleMoveEvent({required this.index}) : super();

  @override
  List<Object> get props => [index];
}

class PuzzleShuffleEvent extends PuzzleEvent {}

class PuzzleFinishEvent extends PuzzleEvent {}
