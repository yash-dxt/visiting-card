import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:visiting_card/models/card_model.dart';
import 'package:visiting_card/widgets/widgets.dart';

class SharingPage extends StatefulWidget {
  final VisitingCard card;

  const SharingPage({Key key, this.card}) : super(key: key);

  @override
  _SharingPageState createState() => _SharingPageState();
}

class _SharingPageState extends State<SharingPage> {
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> shareScreenShot() async {
    Directory directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
    final String localPath =
        '${directory.path}/${DateTime.now().toIso8601String()}.png';

    await screenshotController.capture(path: localPath, pixelRatio: 4);

    await Future.delayed(Duration(seconds: 1));

    await FlutterShare.shareFile(
      title: 'Share Visiting Card',
      filePath: localPath,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Screenshot(
              controller: screenshotController,
              child: VisitingCardTwo(
                majorColor: majorColor,
                visitingCardBlack: visitingCardBlack,
                workPosition: widget.card.workPosition,
                address1: widget.card.address1,
                address2: widget.card.address2,
                address3: widget.card.address3,
                phoneNumber: widget.card.phoneNumber,
                email: widget.card.email,
                fullName: widget.card.fullName,
                path: widget.card.path,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: NeuContainerWithoutPadding(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () async {
                    await shareScreenShot();
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.share,
                    color: Colors.black38,
                  ),
                  heroTag: 'b',
                ),
                SizedBox(
                  width: 5,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  mini: true,
                  onPressed: () {
                    screenshotController
                        .capture(pixelRatio: 4)
                        .then((File image) async {
                      await ImageGallerySaver.saveImage(
                          image.readAsBytesSync());

                      print('saved to gallery');
                    }).catchError((onError) {
                      print(onError);
                    });
                  },
                  child: Icon(
                    Icons.file_download,
                    color: Colors.black38,
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
