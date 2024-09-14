import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({super.key});

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  String qrCode = '';

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(qrCode == '' ? 0 : 16),
              height: qrCode == '' ? 260 : 100,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF6565FF).withOpacity(0.68),
                image: qrCode == ''
                    ? DecorationImage(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/loading.png"))
                    : DecorationImage(
                        image: AssetImage('assets/images/none.png')),
              ),
              child: Center(
                child: Text(
                  '$qrCode',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: CupertinoButton(
                color: Color(0xFF6565FF),
                child: Text(
                  'Start QR scan',
                ),
                onPressed: () => scanQRCode(),
              ),
            ),
          ],
        ),
      );

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
