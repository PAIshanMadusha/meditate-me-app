import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/meditation_exercise_model.dart';

class MeditationProvider extends ChangeNotifier {
  List<MeditationExerciseModel> _allMeditationExercises = [];
  List<MeditationExerciseModel> meditationExercises = [];

  MeditationProvider() {
    _allMeditationExercises = [
      MeditationExerciseModel(
        category: "Stress Relief",
        name: "Claim Your Mind",
        description:
            "A guided meditation to help you regain control over your thoughts and emotions. Through deep breathing and mindful awareness, you’ll learn to release stress and tension. This session is perfect for moments of high stress when you need a mental reset. Take a step back, breathe, and let go of worries weighing you down.",
        duration: 15,
        audioUrl: "https://example.com/stress-relief-audio.mp3",
        videoUrl: "https://youtube.com/watch?v=stress-relief-video",
      ),
      MeditationExerciseModel(
        category: "Mindfulness",
        name: "Present Moment Awareness",
        description:
            "Immerse yourself in the present moment with this mindfulness practice. By tuning into your breath and surroundings, you’ll cultivate awareness and clarity. This exercise helps reduce anxiety and improves focus, allowing you to embrace life as it unfolds. Experience the power of now and bring a sense of peace into your day.",
        duration: 10,
        audioUrl: "https://example.com/mindfulness-audio.mp3",
        videoUrl: "https://youtube.com/watch?v=mindfulness-video",
      ),
      MeditationExerciseModel(
        category: "Sleep",
        name: "Deep Sleep Meditation",
        description:
            "A relaxing bedtime meditation to quiet your mind and prepare you for deep sleep. Gentle voice guidance and soothing background music will ease you into relaxation. By releasing the day's stress, you allow your body to enter a state of complete rest. Perfect for those who struggle with overthinking or restlessness before bed.",
        duration: 20,
        audioUrl: "https://example.com/sleep-meditation.mp3",
        videoUrl: "https://youtube.com/watch?v=sleep-meditation-video",
      ),
      MeditationExerciseModel(
        category: "Focus & Concentration",
        name: "Productivity Booster",
        description:
            "Enhance your concentration with this short yet effective meditation. By focusing on controlled breathing and visualization techniques, you’ll clear distractions. This session helps sharpen your mind, improve work efficiency, and increase mental clarity. Great for students, professionals, or anyone needing a boost in productivity.",
        duration: 12,
        audioUrl: "https://example.com/productivity-booster.mp3",
        videoUrl: "https://youtube.com/watch?v=focus-meditation-video",
      ),
      MeditationExerciseModel(
        category: "Anxiety Relief",
        name: "Overcome Anxiety",
        description:
            "A calming meditation designed to ease anxiety and bring emotional balance. Using deep breathing and grounding techniques, you’ll learn to release nervous energy. This session helps quiet racing thoughts and promotes a sense of inner peace. Find comfort in the present and let go of the fears that hold you back.",
        duration: 18,
        audioUrl: "https://example.com/anxiety-relief.mp3",
        videoUrl: "https://youtube.com/watch?v=anxiety-meditation-video",
      ),
      MeditationExerciseModel(
        category: "Self-Love",
        name: "Embrace Yourself",
        description:
            "Cultivate self-love and appreciation with this heart-centered meditation. Through positive affirmations and gentle guidance, you’ll strengthen your self-worth. This session helps release self-doubt and build confidence in who you truly are. Embrace yourself with kindness and let self-love shine from within.",
        duration: 15,
        audioUrl: "https://example.com/self-love.mp3",
        videoUrl: "https://youtube.com/watch?v=self-love-meditation",
      ),
      MeditationExerciseModel(
        category: "Gratitude",
        name: "Grateful Heart",
        description:
            "A gratitude meditation to shift your mindset towards positivity and appreciation. By reflecting on life’s blessings, you’ll nurture a deeper sense of joy and contentment. This practice enhances emotional well-being and helps you embrace each moment fully. Gratitude opens the door to more happiness, love, and fulfillment in life.",
        duration: 10,
        audioUrl: "https://example.com/gratitude.mp3",
        videoUrl: "https://youtube.com/watch?v=gratitude-meditation",
      ),
      MeditationExerciseModel(
        category: "Healing",
        name: "Inner Healing",
        description:
            "A meditation designed to support emotional and physical healing. Through breathwork and visualization, you’ll reconnect with your inner strength. This practice helps release past pain, stress, and negative energy from your body. Allow yourself to heal, grow, and embrace a state of renewal.",
        duration: 20,
        audioUrl: "https://example.com/healing-meditation.mp3",
        videoUrl: "https://youtube.com/watch?v=healing-meditation-video",
      ),
      MeditationExerciseModel(
        category: "Energy Boost",
        name: "Morning Energizer",
        description:
            "Start your day feeling refreshed and motivated with this energizing meditation. Using breathing techniques and visualization, you’ll awaken your senses and boost energy. This session helps eliminate morning grogginess and sets a positive tone for the day ahead. Recharge your mind and body to take on any challenge with enthusiasm.",
        duration: 12,
        audioUrl: "https://example.com/morning-boost.mp3",
        videoUrl: "https://youtube.com/watch?v=morning-meditation-video",
      ),
      MeditationExerciseModel(
        category: "Spiritual Awakening",
        name: "Awaken Your Soul",
        description:
            "A deep meditation to connect with your higher self and expand consciousness. This practice uses guided visualization and breath awareness to heighten intuition. You’ll gain clarity, wisdom, and a greater understanding of your life’s purpose. Unlock the power of your soul and embrace spiritual transformation.",
        duration: 25,
        audioUrl: "https://example.com/spiritual-awakening.mp3",
        videoUrl: "https://youtube.com/watch?v=spiritual-awakening-video",
      ),
      MeditationExerciseModel(
        category: "Relaxation",
        name: "Full Body Relaxation",
        description:
            "A progressive relaxation meditation to release physical tension and stress. You’ll be guided through a body scan technique to relax every muscle from head to toe. This practice is great for unwinding after a long day or reducing physical discomfort. Sink into deep relaxation and let your body fully recharge.",
        duration: 22,
        audioUrl: "https://example.com/full-body-relaxation.mp3",
        videoUrl: "https://youtube.com/watch?v=relaxation-meditation",
      ),
      MeditationExerciseModel(
        category: "Confidence",
        name: "Unstoppable Confidence",
        description:
            "Build self-confidence and inner strength with this empowering meditation. Through affirmations and visualization, you’ll replace self-doubt with self-belief. This session helps you step into your full potential and face challenges with courage. Let go of fears and embrace a confident, unstoppable version of yourself.",
        duration: 15,
        audioUrl: "https://example.com/confidence-boost.mp3",
        videoUrl: "https://youtube.com/watch?v=confidence-meditation",
      ),
    ];
    meditationExercises = List.from(_allMeditationExercises);
  }
}
