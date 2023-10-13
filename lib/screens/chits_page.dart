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
  bool _isLoad = true;
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

  void _onShareXFileFromAssets(BuildContext context) async {
    if (!_isLoad) {
      // Sharing is already in progress, ignore this tap.
      return;
    }

    final imageFilePath = imageList[_current];
    final box = context.findRenderObject() as RenderBox?;

    setState(() {
      _isLoad = false; // Disable further taps until sharing is complete.
    });

    final data = await rootBundle.load(imageFilePath);
    final buffer = data.buffer;
    await Share.shareXFiles(
      [
        XFile.fromData(
          buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
          name: 'plane.jpg',
          mimeType: 'image/jpeg',
        ),
      ],
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );

    setState(() {
      _isLoad = true; // Re-enable taps after sharing is complete.
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    // Adjust the height to account for the safe area on iOS
    if (isIOS) {
      height -= MediaQuery.of(context).padding.top;
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                SizedBox(
                  width: width,
                  height: height - 55,
                  child: GestureDetector(
                    onTap: () {
                      _onShareXFileFromAssets(context);
                    },
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: imageList.length,
                      onPageChanged: (value) {
                        setState(() {
                          _current = value;
                        });
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
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabPageSelector(
                controller: TabController(
                    length: imageList.length,
                    initialIndex: _current,
                    vsync: this),
                selectedColor: const Color.fromRGBO(0, 174, 242, 1),
                color: Colors.grey,
                borderStyle: BorderStyle.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
