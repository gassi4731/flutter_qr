import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGenerate extends StatelessWidget {
  const QrCodeGenerate(this.data);
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
