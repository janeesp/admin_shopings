import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:shoping_admin/features/add_page/banner/edit_banner.dart';
import 'package:shoping_admin/features/add_page/featured/Tab_page.dart';
import 'package:shoping_admin/features/add_page/newesr_arrivals/newst_tab.dart';

import 'package:shoping_admin/main.dart';

import 'features/add_page/banner/add_banners.dart';
import 'features/add_page/featured/add_featured.dart';
import 'features/add_page/newesr_arrivals/NewestArrivals.dart';
import 'features/baby_kidy/baby&kidy.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: scrWidth*0.1,
                ),
                InkWell(
                  onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => EditBanner(),));
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
                          Text("add banners",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>ArrivalsTab(),));
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
                          Text("NewestArrivals",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TabPage(),));
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
                          Text("add Featured",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Babykidys(),));
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
                          Text("baby&kid",
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
      ),
    );
  }
}
