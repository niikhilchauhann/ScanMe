import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../configs/routes.dart';
import '../../models/recent_qr_models.dart';
import '../../widgets/widget_exports.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Find ",
              style: TextStyle(
                fontFamily: 'poppins_bold',
                fontSize: 24,
                color: Color(0xFF6565FF),
              ),
            ),
            const Text(
              "your Recent QRs!",
              style: TextStyle(
                fontFamily: 'poppins_bold',
                fontSize: 24,
              ),
            ),
            SizedBox(height: 32),

            DestinationWidget(
              title: 'Website',
              icon: EvaIcons.browserOutline,
              color: const Color(0xFF68A2F4),
              onTap: () => Navigator.pushNamed(
                context,
                Routes.recentsScreen,
                arguments: {
                  'icon': EvaIcons.browserOutline,
                  'color': const Color(0xFF68A2F4),
                  'items': RecentQrModel.websiteLists,
                },
              ),
            ),
                        SizedBox(height: 16),

            DestinationWidget(
              title: 'Email',
              icon: EvaIcons.emailOutline,
              color: const Color(0xFF2A9FEE),
              onTap: () => Navigator.pushNamed(
                context,
                Routes.recentsScreen,
                arguments: {
                  'icon': EvaIcons.emailOutline,
                  'color': const Color(0xFF2A9FEE),
                  'items': RecentQrModel.emailLists,
                },
              ),
            ),
                        SizedBox(height: 16),

            DestinationWidget(
              title: 'Wifi',
              icon: EvaIcons.wifi,
              color: Color(0xFF9E72E4),
              onTap: () => Navigator.pushNamed(
                context,
                Routes.recentsScreen,
                arguments: {
                  'icon': EvaIcons.wifi,
                  'color': const Color(0xFF9E72E4),
                  'items': RecentQrModel.wifiPasswordLists,
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
