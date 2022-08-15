import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle8/src/bloc/puzzle_bloc/puzzle_bloc.dart';

class PuzzleItemWidget extends StatelessWidget {
  final PuzzleState state;
  final int index;
  const PuzzleItemWidget({Key? key, required this.state, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          BlocProvider.of<PuzzleBloc>(context)
              .add(PuzzleMoveEvent(index: index));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: state.puzzleModel![index].value == index
                    ? const Color.fromARGB(255, 0, 255, 8)
                    : Colors.transparent,
                width: 3,
              ),
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(state.puzzleModel![index].imagePath),
                  fit: BoxFit.cover)),

          // To display item number.
          // child: Text(
          //   state.puzzleModel![index].value.toString(),
          // ),
        ));
  }
}
