import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puzzle8/src/models/puzzle.dart';

part 'puzzle_event.dart';
part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  List<PuzzleModel> puzzleModel = List.generate(
      9,
      (index) => PuzzleModel(
          imagePath: index == 0 ? "" : "assets/$index.jpg",
          value: index == 0 ? 0 : index));

  int move = 0;
  PuzzleBloc() : super(const PuzzleInitial()) {
    bool isSorted() {
      var deb = puzzleModel.first.value;
      for (var i = 1; i < puzzleModel.length - 1; i++) {
        if (deb > puzzleModel[i].value) {
          return false;
        }
        deb = puzzleModel[i].value;
      }
      return true;
    }

    puzzleModel.shuffle();
    on<PuzzleStartEvent>((event, emit) {
      emit(PuzzleLoad(puzzleModel, move));
    });

    on<PuzzleMoveEvent>((event, emit) async {
      emit(const PuzzleInitial());
      if (event.index - 1 >= 0 &&
              puzzleModel[event.index - 1] ==
                  const PuzzleModel(value: 0, imagePath: "") &&
              event.index % 3 != 0 ||
          event.index + 1 < 9 &&
              puzzleModel[event.index + 1] ==
                  const PuzzleModel(value: 0, imagePath: "") &&
              (event.index + 1) % 3 != 0 ||
          (event.index - 3 >= 0 &&
              puzzleModel[event.index - 3] ==
                  const PuzzleModel(value: 0, imagePath: "")) ||
          (event.index + 3 < 9 &&
              puzzleModel[event.index + 3] ==
                  const PuzzleModel(value: 0, imagePath: ""))) {
        move++;
        puzzleModel[puzzleModel
                .indexOf(const PuzzleModel(value: 0, imagePath: ""))] =
            puzzleModel[event.index];
        puzzleModel[event.index] = const PuzzleModel(value: 0, imagePath: "");
      }
      if (isSorted() == true) {
        emit(PuzzleCheckFinish(move));
      } else {
        emit(PuzzleLoad(
          puzzleModel,
          move,
        ));
      }
    });

    on<PuzzleShuffleEvent>((event, emit) async {
      emit(const PuzzleInitial());
      puzzleModel.shuffle();
      move = 0;
      emit(PuzzleLoad(puzzleModel, move));
    });

    // on<PuzzleEvent>((event, emit) {
    //   emit(const PuzzleError());
    // });
  }
}
