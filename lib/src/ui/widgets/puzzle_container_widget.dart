import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle8/src/bloc/puzzle_bloc/puzzle_bloc.dart';
import 'package:puzzle8/src/ui/widgets/app_button_widget.dart';
import 'package:puzzle8/src/ui/widgets/puzzle_item_widget.dart';

class PuzzleContainerWidget extends StatelessWidget {
  final PuzzleState state;
  const PuzzleContainerWidget({Key? key, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Move: ',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              state.move.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: size.width < 600 ? null : size.width * .4,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              // childAspectRatio: 3
            ),
            itemCount: state.puzzleModel?.length ?? 0,
            itemBuilder: (context, index) {
              // print(state.puzzleImages![index]);
              return state.puzzleModel![index].value != 0
                  ? PuzzleItemWidget(index: index, state: state)
                  : const SizedBox.shrink();
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        AppButtonWidget(
          tap: () =>
              BlocProvider.of<PuzzleBloc>(context).add(PuzzleShuffleEvent()),
          text: "Shuffle",
        )
      ],
    );
  }
}