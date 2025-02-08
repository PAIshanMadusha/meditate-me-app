import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/sleep_exercise_model.dart';

class SleepExerciseProvider extends ChangeNotifier {
  List<SleepExerciseModel> _allSleepExercises = [];
  List<SleepExerciseModel> sleepExercises = [];

  SleepExerciseProvider() {
    _allSleepExercises = [
      SleepExerciseModel(
        category: "Breathing Exercise",
        name: "4-7-8 Breathing",
        description:
            "A relaxation technique to calm the nervous system and promote deep sleep. It involves breathing in for 4 seconds, holding for 7 seconds, and exhaling for 8 seconds.",
        duration: 10,
        audioUrl: "https://example.com/4-7-8-breathing",
      ),
      SleepExerciseModel(
        category: "Body Relaxation",
        name: "Progressive Muscle Relaxation",
        description:
            "A technique that systematically tenses and relaxes different muscle groups, helping to release physical tension and prepare the body for sleep.",
        duration: 15,
        audioUrl: "https://example.com/progressive-muscle-relaxation",
      ),
      SleepExerciseModel(
        category: "Meditation",
        name: "Guided Sleep Meditation",
        description:
            "A soothing meditation that helps slow down thoughts and transition into a restful state through visualization and gentle breathing.",
        duration: 15,
        audioUrl: "https://example.com/guided-sleep-meditation",
      ),
      SleepExerciseModel(
        category: "Visualization",
        name: "Peaceful Journey",
        description:
            "A guided visualization exercise that takes you on a journey to a serene place, helping your mind drift into relaxation and sleep.",
        duration: 15,
        audioUrl: "https://example.com/peaceful-journey",
      ),
      SleepExerciseModel(
        category: "White Noise",
        name: "Ocean Waves Sound",
        description:
            "Listening to the rhythmic sound of ocean waves can create a calming effect, blocking out distractions and promoting deep sleep.",
        duration: 10,
        audioUrl: "https://example.com/ocean-waves",
      ),
      SleepExerciseModel(
        category: "Mindfulness",
        name: "Body Scan for Sleep",
        description:
            "A mindfulness practice that directs attention to different body parts, helping to release tension and ease the mind into relaxation.",
        duration: 15,
        audioUrl: "https://example.com/body-scan-sleep",
      ),
      SleepExerciseModel(
        category: "Self-Compassion",
        name: "Loving-Kindness for Sleep",
        description:
            "A practice of sending positive thoughts and self-compassion before sleep, reducing stress and fostering emotional well-being.",
        duration: 15,
        audioUrl: "https://example.com/loving-kindness-sleep",
      ),
      SleepExerciseModel(
        category: "Breath Awareness",
        name: "Counting Breaths",
        description:
            "A simple technique where you count each breath, helping to shift focus away from racing thoughts and into a restful state.",
        duration: 15,
        audioUrl: "https://example.com/counting-breaths",
      ),
      SleepExerciseModel(
        category: "Sound Healing",
        name: "Binaural Beats",
        description:
            "Listening to binaural beats at a specific frequency helps slow brain waves and induce a state of deep relaxation for better sleep.",
        duration: 15,
        audioUrl: "https://example.com/binaural-beats-sleep",
      ),
      SleepExerciseModel(
        category: "Gratitude Practice",
        name: "Gratitude Reflection Before Sleep",
        description:
            "A practice of reflecting on positive moments and gratitude, reducing stress and setting a peaceful tone before sleep.",
        duration: 10,
        audioUrl: "https://example.com/gratitude-sleep",
      ),
    ];
    sleepExercises = List.from(_allSleepExercises);
  }
}
