import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';

class MindfulExerciseProvider extends ChangeNotifier {
  List<MindfulExerciseModel> _allMindfulExercises = [];
  List<MindfulExerciseModel> mindfulExercises = [];

  MindfulExerciseProvider() {
    _allMindfulExercises = [
      MindfulExerciseModel(
        category: "Breathing Exercise",
        name: "Deep Breathing",
        description:
            "A simple yet powerful breathing technique to calm the mind and body. This practice helps reduce stress and enhances focus by bringing attention to each breath.",
        instructions: [
          "Find a comfortable sitting position and close your eyes.",
          "Take a deep breath in through your nose, expanding your abdomen.",
          "Hold your breath for a few seconds, then slowly exhale through your mouth.",
          "Repeat this process for five minutes, focusing only on your breath."
        ],
        duration: 10,
        instructionsUrl: "https://example.com/deep-breathing",
        imagePath: "assets/images/mindful1.jpg",
      ),
      MindfulExerciseModel(
        category: "Body Awareness",
        name: "Body Scan Meditation",
        description:
            "A guided practice to bring awareness to different parts of the body. This technique helps release tension and promotes relaxation.",
        instructions: [
          "Lie down or sit comfortably with your eyes closed.",
          "Slowly bring your attention to your feet, noticing any sensations.",
          "Move your focus upward, scanning each body part with awareness.",
          "Acknowledge areas of tension and consciously relax them."
        ],
        duration: 15,
        instructionsUrl: "https://example.com/body-scan-meditation",
        imagePath: "assets/images/mindful2.jpg",
      ),
      MindfulExerciseModel(
        category: "Focus & Awareness",
        name: "5-4-3-2-1 Grounding",
        description:
            "A grounding exercise to bring attention to the present moment using your senses. Ideal for reducing anxiety and stress.",
        instructions: [
          "Identify 5 things you can see around you.",
          "Recognize 4 things you can touch or feel.",
          "Listen for 3 sounds in your environment.",
          "Notice 2 things you can smell and 1 thing you can taste."
        ],
        duration: 15,
        instructionsUrl: "https://example.com/5-4-3-2-1-grounding",
        imagePath: "assets/images/mindful3.jpg",
      ),
      MindfulExerciseModel(
        category: "Gratitude Practice",
        name: "Gratitude Reflection",
        description:
            "A mindfulness exercise to cultivate gratitude and shift your perspective toward positivity.",
        instructions: [
          "Take a deep breath and close your eyes.",
          "Think of three things you are grateful for today.",
          "Reflect on why these things are meaningful to you.",
          "Express gratitude by writing them down or saying them out loud."
        ],
        duration: 15,
        instructionsUrl: "https://example.com/gratitude-practice",
        imagePath: "assets/images/mindful4.jpg",
      ),
      MindfulExerciseModel(
        category: "Walking Meditation",
        name: "Mindful Walking",
        description:
            "A practice that transforms a simple walk into a meditative experience by focusing on movement and surroundings.",
        instructions: [
          "Walk at a slow, natural pace in a quiet space.",
          "Pay attention to each step and the sensation of your feet touching the ground.",
          "Observe your surroundings—sights, sounds, and smells.",
          "Breathe deeply and remain fully present in the moment."
        ],
        duration: 15,
        instructionsUrl: "https://example.com/mindful-walking",
        imagePath: "assets/images/mindful5.jpg",
      ),
      MindfulExerciseModel(
        category: "Mindful Eating",
        name: "Savoring a Meal",
        description:
            "A practice that encourages mindful eating by fully engaging with the taste, texture, and aroma of food.",
        instructions: [
          "Choose a small piece of food, such as a raisin or chocolate.",
          "Observe its texture, shape, and color before eating.",
          "Place it in your mouth and slowly chew, focusing on the flavors.",
          "Swallow mindfully, appreciating the experience."
        ],
        duration: 15,
        instructionsUrl: "https://example.com/mindful-eating",
        imagePath: "assets/images/mindful6.jpg",
      ),
      MindfulExerciseModel(
        category: "Visualization",
        name: "Peaceful Place Imagery",
        description:
            "A guided visualization that helps create a sense of peace and relaxation by imagining a calming place.",
        instructions: [
          "Close your eyes and take deep breaths.",
          "Imagine a place where you feel completely at peace, like a beach or forest.",
          "Visualize the details—colors, sounds, and sensations.",
          "Stay in this space for a few minutes before slowly opening your eyes."
        ],
        duration: 10,
        instructionsUrl: "https://example.com/peaceful-visualization",
        imagePath: "assets/images/mindful7.jpg",
      ),
      MindfulExerciseModel(
        category: "Self-Compassion",
        name: "Loving-Kindness Meditation",
        description:
            "A meditation to cultivate self-love and compassion by sending positive thoughts to yourself and others.",
        instructions: [
          "Sit comfortably and take deep breaths.",
          "Silently repeat kind phrases like ‘May I be happy, may I be at peace.’",
          "Extend these wishes to loved ones, acquaintances, and even strangers.",
          "Feel the warmth of kindness spreading within you."
        ],
        duration: 10,
        instructionsUrl: "https://example.com/loving-kindness",
        imagePath: "assets/images/mindful1.jpg",
      ),
      MindfulExerciseModel(
        category: "Journaling",
        name: "Mindful Journaling",
        description:
            "A practice of self-reflection through writing, allowing for deeper awareness of thoughts and emotions.",
        instructions: [
          "Take a journal and find a quiet space.",
          "Write down your thoughts without judgment.",
          "Reflect on how you feel in the present moment.",
          "End with a positive affirmation or intention for the day."
        ],
        duration: 25,
        instructionsUrl: "https://example.com/mindful-journaling",
        imagePath: "assets/images/mindful2.jpg",
      ),
      MindfulExerciseModel(
        category: "Sound Awareness",
        name: "Listening Meditation",
        description:
            "A practice that enhances mindfulness by focusing on sounds around you, helping to sharpen awareness and relaxation.",
        instructions: [
          "Sit in a quiet place and close your eyes.",
          "Listen to the sounds in your environment without labeling them.",
          "Focus on distant sounds, then shift attention to closer ones.",
          "Let each sound come and go naturally without resistance."
        ],
        duration: 15,
        instructionsUrl: "https://example.com/listening-meditation",
        imagePath: "assets/images/mindful3.jpg",
      ),
    ];
    mindfulExercises = List.from(_allMindfulExercises);
  }
}
