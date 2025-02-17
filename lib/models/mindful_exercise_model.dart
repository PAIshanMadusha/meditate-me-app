import 'package:hive/hive.dart';
part 'mindful_exercise_model.g.dart';

@HiveType(typeId: 1)
class MindfulExerciseModel {

  @HiveField(0)
  final String category;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final List<String> instructions;

  @HiveField(4)
  final int duration;

  @HiveField(5)
  final String instructionsUrl;

  @HiveField(6)
  final String imagePath;

  MindfulExerciseModel({
    required this.category,
    required this.name,
    required this.description,
    required this.instructions,
    required this.duration,
    required this.instructionsUrl,
    required this.imagePath,
  });

  //Method to Covert the json Data into a MindfulExercise
  factory MindfulExerciseModel.fromJson(Map<String, dynamic> json) {
    return MindfulExerciseModel(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      instructions: List<String>.from(json['instructions']),
      duration: json['duration'],
      instructionsUrl: json['instructions_url'],
      imagePath: json['image_path'],
    );
  }

  //Method to Convert MindfulExercise to json Data
  Map<String, dynamic> toJson(){
    return{
      'category': category,
      'name': name,
      'description': description,
      'instructions': instructions,
      'duration': duration,
      'instructions_url': instructionsUrl,
      'image_path': imagePath,
    };
  }
}
