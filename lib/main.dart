import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MD Link Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MdLinkExample(),
    );
  }
}

class MdLinkExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MD Link Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MarkdownBody(
              data:
                  "This is a trivial example [with a clickable link](https://google.com).\n\nNotice that the tappable area is too small and violates kMinInteractiveDimension (${kMinInteractiveDimension}px)",
              onTapLink: (text, href, title) {
                print("Link tapped! $text $href $title");
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Congrats!'),
                      content: Text('You tapped the tiny link.'),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
