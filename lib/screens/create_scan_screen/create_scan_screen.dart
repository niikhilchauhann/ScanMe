import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../configs/routes.dart';
import '../../widgets/widget_exports.dart';

class CreateScanScreen extends StatelessWidget {
  const CreateScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // actions: [
        //   ElevatedButton(
        //     onPressed: () {},
        //     style: ElevatedButton.styleFrom(
        //       shape: const CircleBorder(),
        //       backgroundColor: Colors.white,
        //     ),
        //     child: const Icon(
        //       EvaIcons.cameraOutline,
        //       color: Color(0xFF6565FF),
        //       size: 28,
        //     ),
        //   ),
        // ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Generate ",
              style: TextStyle(
                fontFamily: 'poppins_bold',
                fontSize: 24,
                color: Color(0xFF6565FF),
              ),
            ),
            const Text(
              "your code below!",
              style: TextStyle(
                fontFamily: 'poppins_bold',
                fontSize: 24,
              ),
            ),
            SizedBox(height: 8),
            const Text(
              "Create QR Code",
              style: TextStyle(
                fontFamily: 'poppins_regular',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32),
            DestinationWidget(
              title: 'Website',
              icon: EvaIcons.browserOutline,
              color: const Color(0xFF68A2F4),
              onTap: () => Navigator.pushNamed(
                context,
                Routes.createQrWebsite,
              ),
            ),
            SizedBox(height: 16),
            DestinationWidget(
              title: 'Email',
              icon: EvaIcons.emailOutline,
              color: const Color(0xFF2A9FEE),
              onTap: () => Navigator.pushNamed(
                context,
                Routes.createQrWebsite,
              ),
            ),
            SizedBox(height: 16),
            DestinationWidget(
              title: 'Wifi',
              icon: EvaIcons.wifi,
              color: const Color(0xFF9E72E4),
              onTap: () => Navigator.pushNamed(
                context,
                Routes.createQrWebsite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
