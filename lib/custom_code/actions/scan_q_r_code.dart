// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:mobile_scanner/mobile_scanner.dart'; // Import mobile_scanner package

Future<String> scanQRCode(BuildContext context) async {
  // Code to display QR code scanner screen and get the result.
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BarcodeScannerScreen(),
    ),
  );

  // Return the result as a string.
  return result as String;
}

class BarcodeScannerScreen extends StatefulWidget {
  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  final MobileScannerController _controller = MobileScannerController();
  bool isScanning = true; // Flag indicating the scanning state

  @override
  void initState() {
    super.initState();
  }

  void onDetect(BarcodeCapture barcodeCapture) {
    if (isScanning) {
      final barcode = barcodeCapture.barcodes.first;
      if (barcode.rawValue != null) {
        // Use a flag to process the scan result only once
        setState(() {
          isScanning = false;
        });
        _controller.stop().then((_) {
          Navigator.of(context).pop(barcode.rawValue);
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scan'),
      ),
      body: MobileScanner(
        controller: _controller,
        onDetect: onDetect,
        overlayBuilder: (context, constraints) {
          return Container(
            alignment: Alignment.center,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.red,
                  width: 3,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
