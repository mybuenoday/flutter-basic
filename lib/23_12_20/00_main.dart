import 'package:flutter/material.dart';
import 'model/estp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EstpWidget(
        estp: Estp(
          title: 'Entrepreneur ESTP',
          subTitle: 'The Extraverted, Observant, Thinking, and Prospecting personality traits. They tend to be energetic and action-oriented, deftly navigating whatever is in front of them. They love uncovering life’s opportunities, whether socializing with others or in more personal pursuits.',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHu4cQ9fimxtezgnDCY1gPKUUTWvXOjVWJHQ&usqp=CAU',
          description: 'ESTP Strengths\n'
              '👍 Bold – People with the Entrepreneur personality type are full of life and energy. There is no greater joy for Entrepreneurs than pushing boundaries and discovering and using new things and ideas.\n'
              '👍 Rational and Practical – Entrepreneurs love knowledge and philosophy, but not for their own sake. What’s fun for Entrepreneur personalities is finding ideas that are actionable and drilling into the details so they can put them to use. If a discussion is completely arbitrary, there are better uses for Entrepreneurs’ time.\n'
              '👍 Original – Combining their boldness and practicality, Entrepreneurs love to experiment with new ideas and solutions. They put things together in ways no one else would think to.\n'
              '👍 Perceptive – This originality is helped by Entrepreneurs’ ability to notice when things change – and when they need to change! Small shifts in habits and appearances stick out to Entrepreneurs, and they use these observations to help create connections with others.\n'
              '👍 Direct – This perceptive skill isn’t used for mind games – Entrepreneurs prefer to communicate clearly, with direct and factual questions and answers. Things are what they are.\n'
              '👍 Sociable – All these qualities pull together to make a natural group leader in Entrepreneurs. This isn’t something that they actively seek – people with this personality type just have a knack for making excellent use of social interactions and networking opportunities.\n'
              '\n'
              'ESTP Weaknesses\n'
              '🤔 Insensitive – Feelings and emotions come second to facts and “reality” for Entrepreneurs. Emotionally charged situations are awkward, uncomfortable affairs, and Entrepreneurs’ blunt honesty doesn’t help here. These personalities often have a lot of trouble acknowledging and expressing their own feelings as well.\n'
              '🤔 Impatient – Entrepreneurs move at their own pace to keep themselves excited. Slowing down because someone else “doesn’t get it” or having to stay focused on a single detail for too long is extremely challenging for Entrepreneurs.\n'
              '🤔 Risk-prone – This impatience can lead Entrepreneurs to push into uncharted territory without thinking of the long-term consequences. Entrepreneur personalities sometimes intentionally combat boredom with extra risk.\n'
              '🤔 Unstructured – Entrepreneurs see an opportunity – to fix a problem, to advance, to have fun – and seize the moment, often ignoring rules and social expectations in the process. This may get things done, but it can create unexpected social fallout.\n'
              '🤔 May Miss the Bigger Picture – Living in the moment can cause Entrepreneurs to miss the forest for the trees. People with this personality type love to solve problems here and now, perhaps too much. All parts of a project can be perfect, but the project will still fail if those parts do not fit together.\n'
              '🤔 defiant – Entrepreneurs won’t be boxed in. Repetition, hardline rules, sitting quietly while they are lectured at – this isn’t how Entrepreneurs live their lives. They are action-oriented and hands-on. Environments like school and much entry-level work can be so tedious that they’re intolerable, requiring extraordinary effort from Entrepreneurs to stay focused long enough to get to freer positions.\n',
        ),
      ),
    );
  }
}

class EstpWidget extends StatefulWidget {
  final Estp estp;

  const EstpWidget({
    super.key,
    required this.estp,
  });

  @override
  State<EstpWidget> createState() => _EstpWidgetState();
}

class _EstpWidgetState extends State<EstpWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  widget.estp.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ), // Image.network
              ),
              secondArea(),
              thirdArea(),
              fourthArea(),
            ],
          ),
        )

      ),
    );
  }

  Widget secondArea() {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.estp.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      isFavorite ? Icons.star : Icons.star_border,
                      color: Colors.red,
                    ),
                    const Text('65'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.estp.subTitle,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget thirdArea() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButtonWidget(
          icon: Icon(
            Icons.phone,
            color: Colors.blue,
          ),
          title: 'CALL',
        ),
        IconButtonWidget(
          icon: Icon(
            Icons.near_me,
            color: Colors.blue,
          ),
          title: 'ROUTE',
        ),
        IconButtonWidget(
          icon: Icon(
            Icons.share,
            color: Colors.blue,
          ),
          title: 'SHARE',
        ),
      ],
    );
  }

  Widget fourthArea() {
    return Padding(
      padding: EdgeInsets.all(32.0), // 8의 배수
      child: Text(
        widget.estp.description
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  final String title;
  final Icon icon;

  const IconButtonWidget({
    super.key, // Widget에는 항상 key
    required this.title,
    required this.icon,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        Text(
          title,
          style: const TextStyle(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}