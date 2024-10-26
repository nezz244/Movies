import 'package:flutter/material.dart';
import 'package:wookie_movies_flutter_lrliwe/themes/fonts.dart';

class CrawlingText extends StatelessWidget {
  final String text;
  const CrawlingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    List<String> lines = _splitTextIntoSquareLines(text);

    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: const Duration(seconds: 10),
      builder: (context, value, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(0.6)
            ..translate(0.0, value * 500),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: lines
                .map((line) => Text(
              line,
              textAlign: TextAlign.center,
              style: AppFonts.starWarsCrawl,
            ))
                .toList(),
          ),
        );
      },
    );
  }

  List<String> _splitTextIntoSquareLines(String text) {
    int maxLength = 40;
    List<String> words = text.split(' ');
    List<String> lines = [];
    String currentLine = '';

    for (var word in words) {
      if ((currentLine + word).length > maxLength) {
        lines.add(currentLine);
        currentLine = word;
      } else {
        currentLine += ' $word';
      }
    }
    if (currentLine.isNotEmpty) {
      lines.add(currentLine);
    }

    return lines;
  }
}
