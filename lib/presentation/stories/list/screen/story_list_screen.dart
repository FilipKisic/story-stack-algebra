import 'package:flutter/material.dart';

class StoryListScreen extends StatelessWidget {
  const StoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1C29),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Story stack',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => StoryCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Color(0xFF8DEBD2),
        backgroundColor: Color(0xFFA093FF),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          '@author',
          style: TextStyle(color: Color(0xFF8DEBD2), fontSize: 16),
        ),
        Text(
          'Story title containing some text ;)',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        Row(
          children: [
            Icon(Icons.calendar_month, color: Color(0xFFA093FF)),
            Text(
              '01.01.2026',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(width: 20),
            Icon(Icons.comment_rounded, color: Color(0xFFA093FF)),
            Text(
              '69',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(width: 20),
            Icon(Icons.thumb_up, color: Color(0xFFA093FF)),
            Text(
              '113',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
