import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_code_scaner/flutter_qr_code_scaner.dart';

class ScanQrcodePage extends StatefulWidget {
  const ScanQrcodePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScanQrcodePageState createState() => _ScanQrcodePageState();
}

class _ScanQrcodePageState extends State<ScanQrcodePage> {
  final GlobalKey<QrcodeReaderViewState> _key = GlobalKey();
  final Completer<Widget> _qrcodeReaderViewcompleter = Completer<Widget>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final _widget = QrcodeReaderView(
        key: _key,
        onScan: onScan,
        hasImagePicker: true,
        hasHintText: true,
        hasLightSwitch: true,
        headerWidget: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      );

      Future.delayed(const Duration(milliseconds: 280), () {
        _qrcodeReaderViewcompleter.complete(_widget);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Widget>(
          future: _qrcodeReaderViewcompleter.future,
          builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!;
            } else if (snapshot.hasError) {
              return const Icon(Icons.error_outline);
            } else {
              return Container(
                color: Colors.black,
                child: const Center(
                  child: CupertinoActivityIndicator(
                    animating: true,
                  ),
                ),
              );
            }
          }),
    );
  }

  Future onScan(String? data) async {
    print('识别为: $data');
    _key.currentState?.stopScan();
    Navigator.pop(context, data);
  }

  @override
  void dispose() {
    super.dispose();
  }
}