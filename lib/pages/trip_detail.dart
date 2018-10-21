import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TripDetails extends StatefulWidget {
  @override
  _TripDetailsState createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  List<String> tripImagesLink = [
    "https://053e44c254414925813d3f8f1212f0b3.objectstore.eu/w3tc/wp-content/uploads/sites/15/2014/06/moderne-hippies-citroenwater-1-6.jpg?f35f10",
    "https://images.pexels.com/photos/241558/pexels-photo-241558.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/590798/pexels-photo-590798.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/1250643/pexels-photo-1250643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/285938/pexels-photo-285938.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
  ];

  int manageRangeOverflow(index) {
    int intToReturn = tripImagesLink.length - index;
    if (intToReturn >= tripImagesLink.length)
      intToReturn -= tripImagesLink.length;
    else if (intToReturn < 0) intToReturn = intToReturn.abs();
    return intToReturn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: PageView.builder(
          itemCount: tripImagesLink.length,
          itemBuilder: (context, index) {
            return Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.83,
                  child: Image.network(
                    tripImagesLink[index],
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.83 - 50.0,
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
                )
              ],
            );
          }),
    );
  }
}
