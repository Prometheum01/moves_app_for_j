// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moves_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovesModel _$MovesModelFromJson(Map<String, dynamic> json) => MovesModel(
      name: json['name'] as String,
      type: json['type'] as String,
      muscle: json['muscle'] as String,
      equipment: json['equipment'] as String,
      difficulty: json['difficulty'] as String,
      instructions: json['instructions'] as String,
    );

Map<String, dynamic> _$MovesModelToJson(MovesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'muscle': instance.muscle,
      'equipment': instance.equipment,
      'difficulty': instance.difficulty,
      'instructions': instance.instructions,
    };
