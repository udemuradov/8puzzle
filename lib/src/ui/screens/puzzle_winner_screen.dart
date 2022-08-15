
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle8/src/bloc/puzzle_bloc/puzzle_bloc.dart';
import 'package:puzzle8/src/ui/widgets/app_button_widget.dart';

class PuzzleWinnerScreen extends StatelessWidget {
  final PuzzleState state;
  const PuzzleWinnerScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Good Game',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
              text: "Your number of taps : ",
              style: const TextStyle(fontSize: 20),
              children: [
                TextSpan(
                    text: state.move.toString(),
                    style: const TextStyle(fontSize: 20))
              ]),
        ),
        const SizedBox(
          height: 20,
        ),
        AppButtonWidget(
          tap: () =>
              BlocProvider.of<PuzzleBloc>(context).add(PuzzleShuffleEvent()),
          text: "Try again",
        )
      ],
    ));
  }
}