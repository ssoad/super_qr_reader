import 'package:flutter/material.dart';
import 'package:flutter_smart_qr/src/qrcode_reader_view.dart';

class ScanView extends StatefulWidget {
  final bool hasHintText;

  final String? centeredText;

  /// default style for the centered text is
  /// color: white
  /// fontSize: 16
  final TextStyle? centeredTextStyle;

  /// default alignment for the centered text is
  /// TextAlign.center
  final TextAlign? centeredTextAlignment;

  final bool hasFlashLightSwitch;

  final bool hasImagePicker;

  ScanView({
    Key? key,
    this.hasHintText = false,
    this.centeredText,
    this.centeredTextStyle,
    this.centeredTextAlignment,
    this.hasFlashLightSwitch = true,
    this.hasImagePicker = true,
  }) : super(key: key);

  @override
  _ScanViewState createState() => new _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  GlobalKey<QrcodeReaderViewState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: QrcodeReaderView(
        key: _key,
        hasHintText: widget.hasHintText,
        hasFlashLightSwitch: widget.hasFlashLightSwitch,
        centeredText: widget.centeredText,
        onScan: onScan,
        hasImagePicker: widget.hasImagePicker,
        headerWidget: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
    );
  }

  Future onScan(String? data) async {
    Navigator.of(context).pop(data);
  }
}
