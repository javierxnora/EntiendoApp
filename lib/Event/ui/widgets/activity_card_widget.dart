import 'package:flutter/material.dart';

class ActivityCard extends StatefulWidget {
  String activityStatus = "";
  String activityTime = "";
  String activityCourse = "";
  String activityName = "";
  String studentName = "";

  ActivityCard(
    this.activityStatus,
    this.activityTime,
    this.activityCourse,
    this.activityName,
    this.studentName,
  );

  @override
  _ActivityCardState createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  @override
  Widget build(BuildContext context) {
    final _mediaQueryData = MediaQuery.of(context);
    final screenWidth = _mediaQueryData.size.width;
    final screenHeight = _mediaQueryData.size.height;

    return FittedBox(
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 1.5,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: screenHeight * 0.08,
                      minWidth: screenWidth * 0.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.activityTime,
                        style: TextStyle(
                          fontFamily: "HKGrotesk-Medium",
                          fontSize: 18,
                          color: Color(0xFF344356).withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                ActivityDivider(widget.activityStatus),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: screenHeight * 0.08,
                      minWidth: screenWidth * 0.3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(widget.studentName,
                            style: TextStyle(
                              fontFamily: "HKGrotesk-Bold",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF344356),
                            ),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          widget.activityCourse,
                          style: TextStyle(
                            fontFamily: "HKGrotesk-Medium",
                            fontSize: 15,
                            color: Color(0xFF344356),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Evaluación N°1",
                          style: TextStyle(
                            fontFamily: "HKGrotesk-Medium",
                            fontSize: 15,
                            color: Color(0xFF344356),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: screenHeight * 0.08,
                      minWidth: screenWidth * 0.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF5468FF),
                          child: Text("7.0",
                              style: TextStyle(
                                  fontFamily: "HKGrotesk-Medium",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    ],
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

Widget ActivityDivider(String activityStatus) {
  return Container(
    height: 50,
    child: VerticalDivider(
      color: getColor(activityStatus),
      thickness: 5,
    ),
  );
}

Color getColor(String activityStatus) {
  //This Widget return a Divider that helps to know the activity status.
  switch (activityStatus) {
    case "pending":
      {
        return Colors.amber;
      }
    case "completed":
      {
        return Colors.green;
      }
    case "cancelled":
      {
        return Colors.red;
      }

    default:
      {
        return Color(0xFF5468FF);
      }
  }
}
