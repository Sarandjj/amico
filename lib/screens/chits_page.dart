import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class GoldPlanePage extends StatefulWidget {
  const GoldPlanePage({Key? key}) : super(key: key);

  @override
  State<GoldPlanePage> createState() => _GoldPlanePageState();
}

class _GoldPlanePageState extends State<GoldPlanePage>
    with TickerProviderStateMixin {
  // final bool _isLoad = true;
  final List<String> imageList = [
    'asset/image/planes/page1.jpg',
    'asset/image/planes/page2.jpg',
    'asset/image/planes/page3.jpg',
    'asset/image/planes/page4.jpg',
    'asset/image/planes/page5.jpg',
    'asset/image/planes/page6.jpg',
    //'asset/image/planes/page7.jpg',
    'asset/image/planes/page8.jpg',
    'asset/image/planes/page9.jpg',
  ];
  int _current = 0;

  final PageController _pageController = PageController();

  // Add a variable to track whether sharing is in progress.
  bool _sharingInProgress = false;

  @override
  void dispose() {
    // Dispose of the PageController.
    _pageController.dispose();
    super.dispose();
  }

  void _onShareXFileFromAssets(BuildContext context) async {
    if (_sharingInProgress) {
      // Sharing is already in progress, ignore this tap.
      return;
    }

    final imageFilePath = imageList[_current];
    final box = context.findRenderObject() as RenderBox?;

    setState(() {
      _sharingInProgress =
          true; // Disable further taps until sharing is complete.
    });

    try {
      final data = await rootBundle.load(imageFilePath);
      final buffer = data.buffer;
      await Share.shareXFiles(
        [
          XFile.fromData(
            buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
            name: 'Chit_Schemes.jpg',
            mimeType: 'image/jpeg',
          ),
        ],
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
    } finally {
      if (mounted) {
        setState(() {
          _sharingInProgress =
              false; // Re-enable taps after sharing is complete.
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    // Adjust the height to account for the safe area on iOS
    if (isIOS) {}

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  SizedBox(
                    width: width,
                    child: GestureDetector(
                      onTap: () {
                        _onShareXFileFromAssets(context);
                      },
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: imageList.length,
                        onPageChanged: (value) {
                          if (mounted) {
                            setState(() {
                              _current = value;
                            });
                          }
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imageList[index],
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        if (mounted) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            TabPageSelector(
              controller: TabController(
                  length: imageList.length,
                  initialIndex: _current,
                  vsync: this),
              selectedColor: const Color.fromRGBO(0, 174, 242, 1),
              color: Colors.grey,
              borderStyle: BorderStyle.none,
            ),
          ],
        ),
      ),
    );
  }
}
