import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/datadetailed.dart';

class Deatiledpage extends StatefulWidget {
  final String title;
  final String desc;
  final hours;
  final minutes;

  final backco;

  const Deatiledpage({
    Key? key,
    required this.title,
    required this.desc,
    required this.backco,
    required this.hours,
    required this.minutes,
  }) : super(key: key);
  @override
  _DeatiledpageState createState() =>
      _DeatiledpageState(title, desc, backco, hours, minutes);
}

class _DeatiledpageState extends State<Deatiledpage> {
  final String title;
  final String desc;
  final hours;
  final minutes;

  late final backco;

  _DeatiledpageState(
    this.title,
    this.desc,
    this.backco,
    this.hours,
    this.minutes,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(
            Icons.push_pin_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.add_alert_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.archive_outlined,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: backco,
      ),
      bottomNavigationBar: bottom(),
      body: Container(
        color: backco,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 10),
                child: Text(desc),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottom() {
    return Container(
      height: 70,
      // color: bgcolor,
      color: backco,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  adding(context);
                },
                child: Icon(Icons.add_box_outlined)),
          ),
          Text(
            "Edited ${hours}:${minutes}PM",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                morevert(context);
              },
              child: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
    );
  }

  adding(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              child: Container(
                width: MediaQuery.of(context).size.width * .99,
                height: MediaQuery.of(context).size.height * .3,
                color: Colors.white,
                child: Column(
                  children: List.generate(more.length, (index) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(more[index]['icon']),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            more[index]['text'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          );
        });
  }

  morevert(contxet) {
    return showDialog(
        context: context,
        builder: (contxet) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              child: Container(
                width: MediaQuery.of(context).size.width * .99,
                height: MediaQuery.of(context).size.height * .4,
                color: Colors.white,
                child: Column(
                  children: [
                    Column(
                        children: List.generate(actionitems.length, (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(actionitems[index]['icon']),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              actionitems[index]['text'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    })),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(colors.length, (index) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      backco = colors[index];
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: colors[index],
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                  ),
                                ),
                              ),
                              index == 0
                                  ? Icon(Icons.check,
                                      color: Colors.black.withOpacity(.5))
                                  : Icon(null),
                            ],
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
