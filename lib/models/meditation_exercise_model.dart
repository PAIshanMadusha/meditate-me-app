class MeditationExerciseModel {
  final String category;
  final String name;
  final String description;
  final int duration;
  final String audioUrl;
  final String videoUrl;

  MeditationExerciseModel({
    required this.category,
    required this.name,
    required this.description,
    required this.duration,
    required this.audioUrl,
    required this.videoUrl,
  });

  //Method to Covert the json Data into a MeditationExercise
  factory MeditationExerciseModel.fromJson(Map<String, dynamic> json) {
    return MeditationExerciseModel(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      audioUrl: json['audio_url'],
      videoUrl: json['video_url'],
    );
  }

  //Method to Convert MeditationExercise to json Data
  Map<String, dynamic> toJson(){
    return{
      'category': category,
      'name': name,
      'description': description,
      'duration': duration,
      'audio_url': audioUrl,
      'video_url': videoUrl,
    };
  }
}
