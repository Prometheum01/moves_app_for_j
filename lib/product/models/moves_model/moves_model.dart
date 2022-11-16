import 'package:json_annotation/json_annotation.dart';

part 'moves_model.g.dart';

@JsonSerializable()
class MovesModel {
  final String name;
  final String type;
  final String muscle;
  final String equipment;
  final String difficulty;
  final String instructions;

  MovesModel({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
  });

  factory MovesModel.fromJson(Map<String, dynamic> json) =>
      _$MovesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovesModelToJson(this);
}
