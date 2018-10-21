import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:swipedetector/swipedetector.dart';

class TripDetails extends StatefulWidget {
  @override
  _TripDetailsState createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  double imageHeight;
  ScrollController controller = ScrollController();

  List<String> tripImagesLink = [
    "https://images.pexels.com/photos/590513/pexels-photo-590513.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/241558/pexels-photo-241558.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/590798/pexels-photo-590798.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/1250643/pexels-photo-1250643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/285938/pexels-photo-285938.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
  ];

  @override
  void initState() {
    super.initState();
    imageHeight = 650.0;
  }


  @override
  void dispose() {
    super.dispose();
  }

  int manageRangeOverflow(index) {
    int intToReturn = tripImagesLink.length - index;
    if (intToReturn >= tripImagesLink.length)
      intToReturn -= tripImagesLink.length;
    else if (intToReturn < 0) intToReturn = intToReturn.abs();
    return intToReturn;
  }

  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      swipeConfiguration: SwipeConfiguration(
          verticalSwipeMinVelocity: 100.0,
          verticalSwipeMinDisplacement: 60.0,
          verticalSwipeMaxWidthThreshold:100.0,
          horizontalSwipeMaxHeightThreshold: 50.0,
          horizontalSwipeMinDisplacement:50.0,
          horizontalSwipeMinVelocity: 200.0),
      onSwipeUp: (){
        setState(() {
          imageHeight -= 100.0;
        });
        print(imageHeight);
      },
      onSwipeDown: (){
        if(imageHeight!=650.0)
          {
            setState(() {
              imageHeight += 100.0;
            });
          }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Align(
          alignment: Alignment.topCenter,
          child: PageView.builder(
            onPageChanged: (index){
              setState(() {
                imageHeight = 650.0;
              });
            },
              itemCount: tripImagesLink.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Container(
                      height: imageHeight,
                      child: Image.network(
                        tripImagesLink[index],
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: imageHeight - 50.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                      color: Color.fromRGBO(245, 245, 220, 1.0),
                                      width: 3.0,
                                      style: BorderStyle.solid)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  child: Image.network(
                                    tripImagesLink[manageRangeOverflow(index - 2)],
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                      color: Color.fromRGBO(245, 245, 220, 1.0),
                                      width: 3.0,
                                      style: BorderStyle.solid)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  child: Image.network(
                                    tripImagesLink[manageRangeOverflow(index - 1)],
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                      color: Color.fromRGBO(245, 245, 220, 1.0),
                                      width: 3.0,
                                      style: BorderStyle.solid)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  child: Image.network(
                                    tripImagesLink[manageRangeOverflow(index)],
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                      color: Color.fromRGBO(245, 245, 220, 1.0),
                                      width: 3.0,
                                      style: BorderStyle.solid)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  child: Image.network(
                                    tripImagesLink[manageRangeOverflow(index + 1)],
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                      color: Color.fromRGBO(245, 245, 220, 1.0),
                                      width: 3.0,
                                      style: BorderStyle.solid)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  child: Image.network(
                                    tripImagesLink[manageRangeOverflow(index + 2)],
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Material(
                        color: Colors.transparent,
                        child: Padding(padding: EdgeInsets.only(top: imageHeight+40.0),
                          child: ListView(
                            controller: controller,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.symmetric(
                                      horizontal: MediaQuery.of(context).size.width*0.08)),
                                  Container(
                                    width: 8.0,
                                    height: 50.0,
                                    color: Colors.orangeAccent,
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Day ${index+1}".toUpperCase(),
                                          style: TextStyle(fontSize: 22.0,color: Colors.orangeAccent),),
                                        Text("Aug 20",
                                          style: TextStyle(fontSize: 18.0),)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right:
                                    MediaQuery.of(context).size.width*0.08),
                                    child: Text(
                                      "57 Avenue",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black87
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 100.0,
                              )
                            ],
                          ),),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
