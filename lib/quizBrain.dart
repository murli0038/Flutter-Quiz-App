import 'package:myquiz_app/Questions.dart';

class QuizBrain
{
  List <Question> _questionBank = [
    Question(q: "You are in 1st Floor..", a: false),
    Question(q: "YOne human can live or not in room..", a: true),
    Question(q: "A slug's blood in green...", a: false),
    Question(q: "You are in 2st Floor..", a: true),
    Question(q: "One Animal can live or not in room..", a: false),
    Question(q: "A slug's blood in red...", a: true),
  ];

  String getQuestionNumber(int questionnumber)
  {
    return _questionBank[questionnumber].questionText;
  }

  bool getQuestionAns(int questionnumber)
  {
    return _questionBank[questionnumber].questionAns;
  }
}