part of 'puzzle_bloc.dart';

abstract class PuzzleState extends Equatable {
  final List<PuzzleModel>? puzzleModel;
  final int? move;
//  final PersonInfo? personInfo;
  const PuzzleState(
    this.puzzleModel,
    this.move,
  );

  @override
  List<Object?> get props => [
        puzzleModel,
        move,
      ];
}

class PuzzleInitial extends PuzzleState {
  const PuzzleInitial() : super(null, null);
}

class PuzzleLoad extends PuzzleState {
  const PuzzleLoad(
    List<PuzzleModel>? puzzleModel,
    int? move,
  ) : super(puzzleModel, move);
}

class PuzzleCheckFinish extends PuzzleState {
  const PuzzleCheckFinish(int? move) : super(null, move);
}

class PuzzleError extends PuzzleState {
  const PuzzleError() : super(null, null);
}
