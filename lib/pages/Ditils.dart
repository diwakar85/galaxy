import 'package:flutter/material.dart';
import 'HomePage.dart';

class Details extends StatefulWidget {
  Planet? page;

  Details({this.page});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  late AnimationController rotationController;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? showBottomSheetController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      duration: Duration(milliseconds: 3600),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Container(
        width: double.infinity,
        color: Color(0xff3A385E),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.16,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0xff43446E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Text(
                        "${widget.page!.name}",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text(
                        "${widget.page!.galaxy}",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.08),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.075,
                            width: MediaQuery.of(context).size.width * 0.075,
                            child: Image.asset("Assets/Images/ic_distance.png"),
                          ),
                          Text(" ${widget.page!.distance}",
                              style:
                              TextStyle(fontSize: 16, color: Colors.white)),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.075,
                            width: MediaQuery.of(context).size.width * 0.075,
                            child: Image.asset("Assets/Images/ic_gravity.png"),
                          ),
                          Text(" ${widget.page!.gravity} m/s²",
                              style:
                              TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.335),
                  child: RotationTransition(
                    turns: rotationController,
                    child: Image.asset(
                      "${widget.page!.asset}",
                      height: MediaQuery.of(context).size.height * 0.32,
                      width: MediaQuery.of(context).size.width * 0.32,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.055),
            Text(
              "OVERVIEW",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.030),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                "${widget.page!.overView}",
                style: TextStyle(
                    fontSize: 15, color: Colors.white.withOpacity(0.5)),
              ),
            ),
            GestureDetector(
              onTap: () {
                showBottomSheetController =
                    scaffoldkey.currentState!.showBottomSheet((context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        color: Color(0xff3A385E),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.09,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12)),
                                color: Colors.blue[900],
                              ),
                              child: Text(
                                "Welcome to ${widget.page!.name}",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Image.asset(
                                "${widget.page!.asset}",
                                height: MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                            ),
                            Text(
                              "Distance to Sun",
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              "${widget.page!.dts}",
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height * 0.05),
                            Text(
                              "Distance to Earth",
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              "${widget.page!.dte}",
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height * 0.075),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.018),
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    color: Colors.blue[900],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Text(
                        "\$${widget.page!.price}",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "< Back",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
