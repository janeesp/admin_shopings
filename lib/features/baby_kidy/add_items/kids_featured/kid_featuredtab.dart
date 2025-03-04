import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoping_admin/features/baby_kidy/add_items/kids_featured/update_kidsfeatured.dart';

import '../../../../main.dart';
import '../../../model_page/baby_model.dart';
import 'kids_featured.dart';


class KidsFeaturedTab extends StatefulWidget {
  @override
  _KidsFeaturedTabState createState() => _KidsFeaturedTabState();
}

class _KidsFeaturedTabState extends State<KidsFeaturedTab> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.black87,
          labelColor: Colors.black87,
          unselectedLabelColor: Colors.brown,
          indicatorWeight: 4.0,
          tabs: [
            Tab(text: "AddPage"), // ✅ Correct Tab widget usage
            Tab(text: "edit"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          KidsFeatured(),
          EditKidsFeatured()
        ],
      ),
    );
  }
}

class EditKidsFeatured extends StatefulWidget {
  const EditKidsFeatured({super.key});

  @override
  State<EditKidsFeatured> createState() => _EditKidsFeaturedState();
}

class _EditKidsFeaturedState extends State<EditKidsFeatured> {
  Stream<List<BabyModel>> getWatch() =>
      FirebaseFirestore.instance.collection("baby&kids").doc("baby&kids").collection("kidsFeatured").snapshots().map(
            (event) => event.docs
            .map(
              (e) => BabyModel.fromMap(e.data()),
        )
            .toList(),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: scrWidth * 2,
              child: StreamBuilder<List<BabyModel>>(
                  stream:getWatch() ,
                  builder: (context, snapshot) {
                    var data = snapshot.data;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("error: ${snapshot.error}"),
                      );
                    }
                    if (data!.isEmpty) {
                      return Center(
                        child: Text("No items Available"),
                      );
                    }
                    return ListView.builder(
                      itemCount: data!.length,
                      padding: EdgeInsets.symmetric(
                          horizontal: scrWidth * 0.02,
                          vertical: scrWidth * 0.03),
                      itemBuilder: (context, index) {
                        final items = data[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: scrWidth * 0.25,
                            width: scrWidth * 1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                      offset: Offset(0, 0.2),
                                      color: Colors.white.withOpacity(0.2))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: scrWidth * 0.25,
                                        width: scrWidth * 0.2,
                                        child: items.image == ""
                                            ? Center(child: Text("No Image"))
                                            : Image(
                                          image: NetworkImage(
                                              items.image.toString()),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        width: scrWidth * 0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "names :${items.name}",
                                            style: TextStyle(
                                                fontSize: scrWidth * 0.03),
                                          ),
                                          Text(
                                            "category :${items.catogery}",
                                            style: TextStyle(
                                                fontSize: scrWidth * 0.03),
                                          ),
                                          Text("price      :${items.rate}"),
                                          Text("total    :${items.total}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: scrWidth * 0.1,
                                          width: scrWidth * 0.1,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black45),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 2,
                                                    spreadRadius: 1,
                                                    offset: Offset(0, 0.2),
                                                    color: Colors.white
                                                        .withOpacity(0.2))
                                              ]),
                                          child: IconButton(
                                              onPressed: () {
                                         Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          UpdateKidsfeatured(babyModel: items),));
                                              },
                                              icon: Icon(Icons.edit)),
                                        ),
                                        SizedBox(
                                          width: scrWidth * 0.02,
                                        ),
                                        Container(
                                          height: scrWidth * 0.1,
                                          width: scrWidth * 0.1,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black45),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 2,
                                                    spreadRadius: 1,
                                                    offset: Offset(0, 0.2),
                                                    color: Colors.white
                                                        .withOpacity(0.2))
                                              ]),
                                          child: IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        title: Text(
                                                            "you want to delete?"),
                                                        content: SizedBox(
                                                          height: scrWidth * 0.05,
                                                          width: scrWidth * 0.06,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                      "baby&kids")
                                                                      .doc("baby&kids").collection("kidsFeatured").doc(items.id)
                                                                      .delete();
                                                                  ScaffoldMessenger
                                                                      .of(
                                                                      context)
                                                                      .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                          Text("Deleted successdfully")));
                                                                  Navigator.pop(context);
                                                                },
                                                                child: Container(
                                                                  height: scrWidth *
                                                                      0.06,
                                                                  width: scrWidth *
                                                                      0.15,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          10),
                                                                      color: Colors
                                                                          .black12),
                                                                  child: Center(
                                                                      child: Text(
                                                                          'yes')),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Container(
                                                                  height: scrWidth *
                                                                      0.06,
                                                                  width: scrWidth *
                                                                      0.15,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          10),
                                                                      color: Colors
                                                                          .black12),
                                                                  child: Center(
                                                                      child: Text(
                                                                          'No')),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                );
                                              },
                                              icon:
                                              Icon(Icons.delete_outlined)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}


