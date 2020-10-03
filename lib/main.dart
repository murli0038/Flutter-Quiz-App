import 'package:flutter/material.dart';
import 'package:myquiz_app/quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizbrain = QuizBrain();

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: QuizllerApp(),
        ),
      ),
    );
  }
}


class QuizllerApp extends StatefulWidget {
  @override
  _QuizllerAppState createState() => _QuizllerAppState();
}

class _QuizllerAppState extends State<QuizllerApp>
{
  List <Icon>ScoreKeeper = [];


  int QuestionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //TODO: Question
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQuestionNumber(QuestionNumber),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),),
            ),
          ),
        ),
        //TODO: true button
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: (){
                    bool ans = quizbrain.getQuestionAns(QuestionNumber);

                    if (ans == true)
                      {
                        print("right ans picked");
                      }
                    else{
                      print("user got a wrong !");
                    }

                    setState(() {
                      // ScoreKeeper.add(Icon(Icons.check, color: Colors.green,));
                      if (QuestionNumber < 5)
                        {
                          QuestionNumber++;
                        }
                      else
                        {
                          QuestionNumber = 0;
                          Alert(
                            context: context,
                            type: AlertType.success,
                            title: "Quizzler",
                            desc: "Your awesome Quiz will Restart !!",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "COOL",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                              )
                            ],
                          ).show();
                        }

                    });
              },
              child: Text("True",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              color: Colors.green,
            ),
          ),
        ),
        //TODO: false button
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: (){

                bool ans = quizbrain.getQuestionAns(QuestionNumber);

                if (ans == false)
                {
                  print("right ans picked");
                }
                else{
                  print("user got a wrong !");
                }


                setState(() {
                  // ScoreKeeper.add(Icon(Icons.check, color: Colors.green,));
                  if (QuestionNumber < 5)
                  {
                    QuestionNumber++;
                  }
                  else
                  {
                    QuestionNumber = 0;

                  }

                });
              },
              child: Text("False",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              color: Colors.red,
            ),
          ),
        ),
        //TODO: true or flase tracker
        Row(
          children: ScoreKeeper,
        )
      ],
    );
  }
}



