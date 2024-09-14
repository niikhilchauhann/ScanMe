import 'package:flutter/material.dart';
import 'package:qrscanner/screens/qr_screens/scan_qr_screen.dart';

class QrListScreen extends StatelessWidget {
  const QrListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Scan QR Code",
              style: TextStyle(
                fontFamily: 'poppins_bold',
                fontSize: 24,
              ),
            ),            SizedBox(height: 8),

            Text(
              "Here's your result:",
              style: TextStyle(
                fontFamily: 'poppins_regular',
                fontSize: 16,
              ),
            ),
            ScanQrScreen()
          ],
        ),
      ),
    );
  }
}
