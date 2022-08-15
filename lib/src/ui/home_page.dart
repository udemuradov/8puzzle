import 'package:flutter/material.dart';
import 'package:puzzle8/src/ui/screens/choose_image_screen.dart';
import 'package:puzzle8/src/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AppImages.bg,
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      (MaterialPageRoute(
                          builder: (context) => const ChooseImageScreen()))),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: width * .2),
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.cyan,
                    elevation: 10,
                    shadowColor: Colors.black,
                  ),
                  child: const Text(
                    'START GAME',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        wordSpacing: 2,
                        letterSpacing: 4),
                  )))
        ],
      ),
    );
  }
}








