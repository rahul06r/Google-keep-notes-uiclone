import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/datadetailed.dart';
import 'package:myapp/pages/new_page.dart';
import 'package:myapp/pages/detailed_page.dart';

import 'package:myapp/pages/search_page.dart';
import 'package:myapp/pages/sidebar.dart';

class Initialpage extends StatefulWidget {
  final String titletext;
  final String desctext;
  final hours;
  final minutes;
  final bgcolors;

  const Initialpage({
    Key? key,
    required this.titletext,
    required this.desctext,
    required this.bgcolors,
    required this.hours,
    required this.minutes,
  }) : super(key: key);

  @override
  _InitialpageState createState() =>
      _InitialpageState(titletext, desctext, bgcolors, hours, minutes);
}

class _InitialpageState extends State<Initialpage> {
  final String titletext;
  final String desctext;
  final hours;
  final minutes;
  final bgcolors;
  GlobalKey<ScaffoldState> _drawerkey = GlobalKey();

  _InitialpageState(
      this.titletext, this.desctext, this.bgcolors, this.hours, this.minutes);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _drawerkey,
        drawer: Drawer(
          child: Sidebar(),
        ),
        bottomNavigationBar: getbottomsheet(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewPAge()));
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 40,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    _drawerkey.currentState!.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    // size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              // add an inkwell here
                              InkWell(
                                // mouseCursor: MouseCursor.defer,
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FittedBox(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchPage()));
                                      },
                                      child: Text(
                                        "Search your notes",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(.7)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.qr_code,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    accounts(context);
                                  },
                                  child: CircleAvatar(
                                    child: Image(
                                      image: AssetImage("assets/bg photo.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      titletext == ""
                          ? Container()
                          : GestureDetector(
                              // new page added here dynamically
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Deatiledpage(
                                      title: titletext,
                                      desc: desctext,
                                      backco: bgcolors,
                                      hours: hours,
                                      minutes: minutes,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .92,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 1,
                                    clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(.2)),
                                        color: bgcolors,
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            titletext,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 6, left: 8),
                                            child: Text(
                                              desctext,
                                              // newdesc,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      Column(
                        children: List.generate(title.length, (index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * .92,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 1,
                                clipBehavior: Clip.antiAlias,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.black.withOpacity(.2)),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6, left: 8),
                                        child: Text(
                                          descrption[index],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// bottom bar here

  Widget getbottomsheet() {
    return Container(
      decoration: BoxDecoration(
          border: BorderDirectional(
              top: BorderSide(
        color: Colors.black.withOpacity(.6),
      ))),
      width: double.infinity,
      height: 40,
      // color: Colors.red,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPAge()));
            },
            child: Icon(
              Icons.check_box_outlined,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            CupertinoIcons.pencil,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.keyboard_voice,
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              takeit(context);
            },
            child: Icon(
              Icons.filter,
            ),
          )
        ],
      ),
    );
  }

  accounts(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Align(
            alignment: Alignment.center,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              CupertinoIcons.clear_thick,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Google",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/bg photo.png"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Abc",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text("abc@gmail.com"),
                            ],
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Manage your Google Account",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(Icons.person_add_alt_1_outlined),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add another accounts",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(
                              Icons.manage_accounts,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Manage accounts on this device",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  takeit(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Align(
            alignment: Alignment.center,
            child: Material(
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Add image",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                        children: List.generate(cameratake.length, (index) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(cameratake[index]['icon']),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cameratake[index]['text'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    })),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
