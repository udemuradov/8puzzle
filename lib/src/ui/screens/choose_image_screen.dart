import 'package:flutter/material.dart';
import 'package:puzzle8/src/ui/screens/puzzle_screen.dart';
import 'package:puzzle8/src/utils/constants.dart';

class ChooseImageScreen extends StatelessWidget {
  const ChooseImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text('Choose an image and tap on it',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  wordSpacing: 1,
                  letterSpacing: 2)),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PuzzleScreen())),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(width: 1, color: Colors.amber),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  AppImages.original,
                  // width: 200,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              AppImages.bird,
              width: 200,
            ),
          )
        ],
      ),
    );
  }
}
