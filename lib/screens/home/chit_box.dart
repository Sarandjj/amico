import 'package:amico/constan/constan_colors.dart';
import 'package:amico/util/dialog_box.dart';
import 'package:flutter/material.dart';

class ChitBox extends StatelessWidget {
  const ChitBox({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: width < 370 ? width * .76 : width * .79,
        height: height < 800 ? height * .29 : height * .33,
        decoration: BoxDecoration(
          // color: Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            width: 3,
          ),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(0, 82, 247, 0.427),
              Color.fromARGB(47, 33, 149, 243),
              Color.fromRGBO(219, 18, 55, 0.239),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Text(
                'Manage your wealth and see it grow with us',
                style: TextStyle(
                  fontSize: width < 370 ? 20 : 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: height < 800 ? height * .02 : height * .04,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black, width: 1.2),
                  elevation: 18,
                  backgroundColor: ConstanColor.primarycolor,
                  fixedSize: const Size(190, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const CustomHalfCircleDialog(),
                  );
                },
                child: const Text(
                  'Chit Schemes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
