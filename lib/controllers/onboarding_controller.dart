import 'package:get/get.dart';
import '../model/question_model.dart';


class OnboardingController extends GetxController {
  // Current step (0-4)
  RxInt currentStep = 0.obs;

  // Store selected option index per question
  RxList<int> selectedOptions = List.filled(5, -1).obs;

  // Example questions and options
  final List<QuestionModel> questions = [
    QuestionModel(
      title: "How are you feeling today?",
      subtitle: "Let's understand how you're feeling today.",
      options: [
        "I'm feeling good!",
        "I'm okay, not great, not bad.",
        "I'm feeling a bit low.",
        "I'm feeling really down today.",
      ],
    ),
    QuestionModel(
      title: "What's been hardest for you lately?",
      subtitle: "Let's pinpoint what's been the most challenging.",
      options: [
        "Sleep – struggling to get enough rest.",
        "Energy – don't feel energized.",
        "Motivation – hard to stay focused.",
        "Mood – feeling emotionally drained.",
      ],
    ),
    QuestionModel(
      title: "Do you prefer calm or energizing routines?",
      subtitle: "Need calming or something energizing today?",
      options: [
        "Calm – peaceful & soothing.",
        "Energizing – get me moving.",
        "I'm not sure – could use either.",
        "Nothing too intense right now.",
      ],
    ),
    QuestionModel(
      title: "What time do you usually wake up?",
      subtitle: "Your wake-up time helps create a balanced routine.",
      options: [
        "6:00 AM – I start my day early.",
        "7:00 AM – I wake up around this time.",
        "8:00 AM – I get up a bit later.",
        "I'm a night owl – wake up around 9:00 AM or later.",
      ],
    ),
    QuestionModel(
      title: "What's your primary goal for using this app?",
      subtitle: "Let's focus on what you want to achieve.",
      options: [
        "Find Calm – relax & manage stress.",
        "Increase Energy – boost motivation.",
        "Improve Focus – be more productive.",
        "Overall Wellness – feel better & care for mental health.",
      ],
    ),
  ];

  void selectOption(int optionIndex) {
    selectedOptions[currentStep.value] = optionIndex;
  }

  void nextStep() {
    if (currentStep.value < questions.length) {
      currentStep++;
    }
  }

  void prevStep() {
    if (currentStep.value > 0) {
      currentStep--;
    }
  }

  bool get isLastStep => currentStep.value == questions.length;
}
