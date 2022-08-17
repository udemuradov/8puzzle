import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle8/src/bloc/puzzle_bloc/puzzle_bloc.dart';
import 'package:puzzle8/src/ui/screens/puzzle_winner_screen.dart';
import 'package:puzzle8/src/ui/widgets/puzzle_container_widget.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PuzzleBloc>(context);
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text('8 Puzzle'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<PuzzleBloc, PuzzleState>(
            bloc: bloc..add(PuzzleStartEvent()),
            builder: (context, state) {
              if (state is PuzzleInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PuzzleLoad) {
                return PuzzleContainerWidget(state: state);
              }
              if (state is PuzzleCheckFinish) {
                return PuzzleWinnerScreen(
                  state: state,
                );
              }
              if (state is PuzzleError) {
                return Center(
                    child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<PuzzleBloc>(context)
                              .add(PuzzleStartEvent());
                        },
                        child: const Text('restart')));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}