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
          subTitle: 'An Entrepreneur (ESTP) is someone with the Extraverted, Observant, Thinking, and Prospecting personality traits. They tend to be energetic and action-oriented, deftly navigating whatever is in front of them. They love uncovering life’s opportunities, whether socializing with others or in more personal pursuits.',
          imageUrl: 'https://www.16personalities.com/static/images/personality-types/headers/explorers_Entrepreneur_ESTP_personality_header.svg',
          description: 'ESTP Strengths'
              '👍 Bold – People with the Entrepreneur personality type are full of life and energy. There is no greater joy for Entrepreneurs than pushing boundaries and discovering and using new things and ideas.'
              '👍 Rational and Practical – Entrepreneurs love knowledge and philosophy, but not for their own sake. What’s fun for Entrepreneur personalities is finding ideas that are actionable and drilling into the details so they can put them to use. If a discussion is completely arbitrary, there are better uses for Entrepreneurs’ time.'
              '👍 Original – Combining their boldness and practicality, Entrepreneurs love to experiment with new ideas and solutions. They put things together in ways no one else would think to.'
              '👍 Perceptive – This originality is helped by Entrepreneurs’ ability to notice when things change – and when they need to change! Small shifts in habits and appearances stick out to Entrepreneurs, and they use these observations to help create connections with others.'
              '👍 Direct – This perceptive skill isn’t used for mind games – Entrepreneurs prefer to communicate clearly, with direct and factual questions and answers. Things are what they are.'
              '👍 Sociable – All these qualities pull together to make a natural group leader in Entrepreneurs. This isn’t something that they actively seek – people with this personality type just have a knack for making excellent use of social interactions and networking opportunities.'
              'ESTP Weaknesses'
              '🤔 Insensitive – Feelings and emotions come second to facts and “reality” for Entrepreneurs. Emotionally charged situations are awkward, uncomfortable affairs, and Entrepreneurs’ blunt honesty doesn’t help here. These personalities often have a lot of trouble acknowledging and expressing their own feelings as well.'
              '🤔 Impatient – Entrepreneurs move at their own pace to keep themselves excited. Slowing down because someone else “doesn’t get it” or having to stay focused on a single detail for too long is extremely challenging for Entrepreneurs.'
              '🤔 Risk-prone – This impatience can lead Entrepreneurs to push into uncharted territory without thinking of the long-term consequences. Entrepreneur personalities sometimes intentionally combat boredom with extra risk.'
              '🤔 Unstructured – Entrepreneurs see an opportunity – to fix a problem, to advance, to have fun – and seize the moment, often ignoring rules and social expectations in the process. This may get things done, but it can create unexpected social fallout.'
              '🤔 May Miss the Bigger Picture – Living in the moment can cause Entrepreneurs to miss the forest for the trees. People with this personality type love to solve problems here and now, perhaps too much. All parts of a project can be perfect, but the project will still fail if those parts do not fit together.'
              '🤔 defiant – Entrepreneurs won’t be boxed in. Repetition, hardline rules, sitting quietly while they are lectured at – this isn’t how Entrepreneurs live their lives. They are action-oriented and hands-on. Environments like school and much entry-level work can be so tedious that they’re intolerable, requiring extraordinary effort from Entrepreneurs to stay focused long enough to get to freer positions.',
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
        ), // Column
      ), // SafeArea
    ); // Scaffold
  }

  Widget secondArea() {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.estp.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ), // TextStyle
              ), // Text
              Text(
                widget.estp.subTitle,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
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
        widget.estp.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
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