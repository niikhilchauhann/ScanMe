import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class GenerateQrWidget extends StatefulWidget {
  final TextEditingController controller;
  const GenerateQrWidget({
    super.key,
    required this.controller,
  });

  @override
  State<GenerateQrWidget> createState() => _GenerateQrWidgetState();
}

class _GenerateQrWidgetState extends State<GenerateQrWidget> {
  final key = GlobalKey();
  String textdata = 'androidride.com';
  final textcontroller = TextEditingController();
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 243, 234, 245),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                EvaIcons.arrowIosBackOutline,
                color: Color(0xFF6565FF),
                size: 32,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 243, 234, 245),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Make my code \nscanable",
                    style: TextStyle(
                      fontFamily: 'poppins_bold',
                      fontSize: 24,
                    ),
                  ),
            SizedBox(height: 8),

                  Text(
                    "Your QR Code will be genered automatically",
                    style: TextStyle(
                      fontFamily: 'poppins_regular',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFFF4E3F7),
              height: 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter your website or email or wifi.",
                    style: TextStyle(
                      fontFamily: 'poppins_semi_bold',
                      fontSize: 16,
                    ),
                  ),
            SizedBox(height: 16),

                  TextField(
                    controller: widget.controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 241, 239, 239),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 241, 239, 239),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 241, 239, 239),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 241, 239, 239),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Material(
                type: MaterialType.transparency,
                child: RepaintBoundary(
                  key: key,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 36,
                    ),
                    height: MediaQuery.of(context).size.height * 0.60,
                    width: MediaQuery.of(context).size.width * 0.860,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(0.8, 1),
                        colors: <Color>[
                          Color(0xFFFEEDFC),
                          Colors.white,
                          Color(0xFFE4E6F7),
                          Color(0xFFE2E5F5),
                        ],
                        tileMode: TileMode.mirror,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          height: 240,
                          width: 240,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(0.8, 1),
                              colors: <Color>[
                                Colors.white,
                                Color(0xFFE4E6F7),
                                Colors.white,
                              ],
                              tileMode: TileMode.mirror,
                            ),
                          ),
                          child: Center(
                            child: QrImageView(
                              data: widget.controller.text,
                              size: 180,
                              foregroundColor: const Color(0xFF8194FE),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Here\'s your code!!',
                              style: TextStyle(
                                fontFamily: 'poppins_bold',
                                fontSize: 28,
                                color: Color(0xFF6565FF),
                              ),
                            ),
                            Text(
                              "This is your unique QR code for another person to scan",
                              style: TextStyle(
                                fontFamily: 'poppins_regular',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                try {
                                  RenderRepaintBoundary boundary =
                                      key.currentContext!.findRenderObject()
                                          as RenderRepaintBoundary;
                                  var image = await boundary.toImage();
                                  ByteData? byteData = await image.toByteData(
                                      format: ImageByteFormat.png);
                                  Uint8List pngBytes =
                                      byteData!.buffer.asUint8List();
                                  final appDir =
                                      await getApplicationDocumentsDirectory();
                                  var datetime = DateTime.now();
                                  file =
                                      await File('${appDir.path}/$datetime.png')
                                          .create();
                                  await file?.writeAsBytes(pngBytes);
                                  await Share.shareFiles(
                                    [file!.path],
                                    mimeTypes: ["image/png"],
                                    text: "ScanMe: QR Code",
                                  );
                                } catch (e) {
                                  print(e.toString());
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 32.0,
                                          color: const Color.fromARGB(
                                                  255, 133, 142, 212)
                                              .withOpacity(0.68),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      EvaIcons.shareOutline,
                                      color: Color(0xFF6565FF),
                                    ),
                                  ),
            SizedBox(height: 8),

                                  const Text(
                                    "Share",
                                    style: TextStyle(
                                      fontFamily: 'poppins_semi_bold',
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // const Gap(40),
                            // Column(
                            //   children: [
                            //     Container(
                            //       padding: const EdgeInsets.all(12),
                            //       decoration: BoxDecoration(
                            //         color: Colors.white,
                            //         borderRadius: const BorderRadius.all(
                            //           Radius.circular(12),
                            //         ),
                            //         boxShadow: [
                            //           BoxShadow(
                            //             blurRadius: 32.0,
                            //             color: const Color.fromARGB(
                            //                     255, 133, 142, 212)
                            //                 .withOpacity(0.68),
                            //           ),
                            //         ],
                            //       ),
                            //       child: const Icon(
                            //         EvaIcons.saveOutline,
                            //         color: Color(0xFF6565FF),
                            //       ),
                            //     ),
                            //     const Gap(8),
                            //     const Text(
                            //       "Save",
                            //       style: TextStyle(
                            //         fontFamily: 'poppins_semi_bold',
                            //         fontSize: 14,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        backgroundColor: const Color(0xFF6565FF),
        child: const Icon(Icons.qr_code_2_sharp),
      ),
    );
  }
}
