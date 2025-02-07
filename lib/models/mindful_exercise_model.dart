class MindfulExerciseModel {
  final String category;
  final String name;
  final String description;
  final List<String> instructions;
  final int duration;
  final String instructionsUrl;
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
