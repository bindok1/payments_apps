import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:payments_apps/theme.dart';

void main() {
  runApp(PaymentApps());
}

class PaymentApps extends StatefulWidget {
  @override
  State<PaymentApps> createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget Header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50, right: 32, left: 32),
        child: Column(
          children: [
            SafeArea(
              child: Center(
                child: Image.asset(
                  'assets/images/icon_one.png',
                  width: 267,
                  height: 200,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Upgrade to',
                      style: Titletextstyle,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Pro',
                      style: TitleProtextstyle,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              'Go unlock all features and \nbuild your own business bigger',
              style: SubTitletextstyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    Widget Option(int index, String title, String subTitle, String Pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selectedIndex ==
                        index //jika selectedindex = index maka akan ganti warna
                    ? Color(0xff007Dff)
                    : Color(0xff4D5B7C),
              ) //gunakan ternary
              ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/images/check_two.png',
                          width: 18,
                          height: 18,
                        )
                      : Image.asset(
                          'assets/images/check.png',
                          width: 18,
                          height: 18,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Planetextstyle,
                      ),
                      Text(
                        subTitle,
                        style: Desctextstyle,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 91,
                  ),
                  Text(
                    Pricing,
                    style: Pricetextstyle,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget checkButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51.23,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff007DFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(71))),
                onPressed: () {},
                child: Text(
                  'Checkout Now',
                  style: Buttontextstyle,
                )),
          )
        ],
      );
    }

    // ignore: dead_code
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(
              0xff04112f), //backgroun color, default scaffold adalah putih
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Header(),
                  SizedBox(
                    height: 50,
                  ),
                  Option(0, 'Monthly', 'Good For Starting Up', '\$20'),
                  Option(1, 'Quaterly', 'Focusing Building On', '\$55'),
                  Option(2, 'Yearly', 'Steady Company', '\$220'),
                  SizedBox(
                    height: 50,
                  ),
                  selectedIndex == -1 ? SizedBox() : checkButton(),
                ],
              ),
            ),
          )),
    );
  }
}
