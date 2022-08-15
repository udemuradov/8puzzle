import 'package:equatable/equatable.dart';

class PuzzleModel extends Equatable {
  final int value;
  final String imagePath;
  const PuzzleModel({required this.value, required this.imagePath});
  @override
  List<Object?> get props => [value, imagePath];
}
