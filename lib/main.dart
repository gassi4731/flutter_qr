import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: <Widget>[
                  new TextField(
                    enabled: true,
                    obscureText: false,
                    controller: _textEditingController,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Next'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return QrcodeGenerate(_textEditingController.text);
                    },
                  ),
                );
                _textEditingController.text = '';
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QrcodeGenerate extends StatelessWidget {
  const QrcodeGenerate(this.data);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qrcode Generate'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: data,
              version: QrVersions.auto,
              size: 200,
            ),
            Text(data, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
