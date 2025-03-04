import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:shoping_admin/features/baby_kidy/add_items/kids_arrivals/kids_tab.dart';

import '../../main.dart';
import 'add_items/kids_arrivals/add_baby_items.dart';
import 'add_items/kids_featured/kid_featuredtab.dart';
import 'add_items/kids_featured/kids_featured.dart';

class Babykidys extends StatefulWidget {
  const Babykidys({super.key});

  @override
  State<Babykidys> createState() => _BabykidysState();
}

class _BabykidysState extends State<Babykidys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      backgroundColor: Colors.black45,
      body: SizedBox(
        child: Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: scrWidth*0.03,
              vertical: scrWidth*0.05
          ),
          child: Column(
            children: [
              SizedBox(
                height: scrWidth*0.1,
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => KidsTab(),));
                },
                child: Container(
                  height: scrWidth*0.15,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset.zero
                        ),
                      ]
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(
                        left: scrWidth*0.036,
                        right: scrWidth*0.036
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("KidsArrivals",
                          style:  ArabicTextStyle(arabicFont: ArabicFont.amiri,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),),
                        Icon(Icons.arrow_forward_ios,size: 20,)

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: scrWidth*0.1,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>KidsFeaturedTab() ,));

                },
                child: Container(
                  height: scrWidth*0.15,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset.zero
                        ),
                      ]
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(
                        left: scrWidth*0.036,
                        right: scrWidth*0.036
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("kids Featured",
                          style:  ArabicTextStyle(arabicFont: ArabicFont.amiri,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),),
                        Icon(Icons.arrow_forward_ios,size: 20,)

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
