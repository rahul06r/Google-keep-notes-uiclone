import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/datadetailed.dart';
import 'package:myapp/pages/Initial_page.dart';
// import 'package:myapp/pages/detailed_page.dart';

class NewPAge extends StatefulWidget {
  @override
  _NewPAgeState createState() => _NewPAgeState();
}

class _NewPAgeState extends State<NewPAge> {
  late String titletext;
  late String desctext;
  var bgcolor = Colors.white;
  late TimeOfDay time;

  TextEditingController _controller = new TextEditingController();
  void initState() {
    super.initState();

    time = TimeOfDay.now();
  }

  get hours => time.hour;
  get minutes => time.minute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Initialpage(
                  titletext: titletext,
                  desctext: desctext,
                  bgcolors: bgcolor,
                  hours: hours,
                  minutes: minutes,
                ),
              ),
            );
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
        backgroundColor: bgcolor,
      ),
      bottomNavigationBar: bottom(),
      body: Container(
        color: bgcolor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: (text) {
                    titletext = text;
                  },
                  textCapitalization: TextCapitalization.sentences,
                  controller: _controller,
                  cursorColor: Colors.black,
                  maxLength: 20,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(.2),
                        fontSize: 30,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 10),
                child: TextField(
                  onChanged: (text) {
                    desctext = text;
                  },
                  // controller: _controller,
                  cursorColor: Colors.black,
                  maxLines: 25,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Note",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(.2),
                        fontSize: 20,
                      )),
                ),
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
      color: bgcolor,
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
            "Edited ${hours}:${minutes} PM",
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
                                      bgcolor = colors[index];
                                      changecheck(index);
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
                              // index == 0
                              //     ? Icon(Icons.check,
                              //         color: Colors.black.withOpacity(.5))
                              //     : Icon(null),
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

  changecheck(index) {
    index = Icon(Icons.check);
  }
}
