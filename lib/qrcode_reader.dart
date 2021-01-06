import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class QrCodeReader extends StatefulWidget {
  QrCodeReader({Key key, this.title}) : super(key: key);

  final String title;

  final Map<String, dynamic> pluginParameters = {};

  @override
  _QrCodeReaderState createState() => _QrCodeReaderState();
}

class _QrCodeReaderState extends State<QrCodeReader> {
  Future<String> _barcodeString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QRCode Reader Example'),
      ),
      body: Center(
          child: FutureBuilder<String>(
              future: _barcodeString,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return Text(snapshot.data != null ? snapshot.data : '');
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _barcodeString = QRCodeReader()
                .setAutoFocusIntervalInMs(200)
                .setForceAutoFocus(true)
                .setTorchEnabled(true)
                .setHandlePermissions(true)
                .setExecuteAfterPermissionGranted(true)
                .scan();
          });
        },
        tooltip: 'Reader the QRCode',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
