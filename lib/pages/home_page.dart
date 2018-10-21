import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/android-wallpaper-city-dark-248159.jpg",
              ),
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(Color(0x44373737), BlendMode.multiply))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.07),
                child: Text(
                  "Memories",
                  style: TextStyle(
                      fontFamily: "Playfair",
                      fontSize: 59.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.2),
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                children: <Widget>[
                  MemoryCard(
                    isSelected: true,
                    locationImage: "https://053e44c254414925813d3f8f1212f0b3.objectstore.eu/w3tc/wp-content/uploads/sites/15/2014/06/moderne-hippies-citroenwater-1-6.jpg?f35f10",
                    locationName: "Japan",
                    caption: "An unforgettable journey with an acquaintance",
                  ),
                  MemoryCard(
                    isSelected: false,
                    locationImage: "https://images.pexels.com/photos/1008000/pexels-photo-1008000.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                    locationName: "Los Angels",
                    caption: "An unforgettable journey with an acquaintance",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MemoryCard extends StatelessWidget {
  final bool isSelected;
  final String locationImage;
  final String locationName;
  final String caption;
  MemoryCard({
    this.isSelected,
    this.locationImage,
    this.locationName,
    this.caption
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.05),
      child: Container(
        width: double.infinity,
        height: isSelected
            ? MediaQuery.of(context).size.width * 0.85
            : MediaQuery.of(context).size.width * 0.5,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          image: DecorationImage(
              image: NetworkImage(
                locationImage
              ),
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(Colors.grey.shade400, BlendMode.multiply)),
        ),
        child: Stack(
          children: <Widget>[
            isSelected
                ? Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.1),
                      child: Text(
                        "\”",
                        style: TextStyle(
                            fontFamily: "Playfair",
                            fontSize: 120.0,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                  )
                : Container(),
            Align(
              alignment: Alignment.center,
              child: Text(
                locationName,
                style: TextStyle(
                    fontFamily: "Playfair",
                    fontSize: isSelected ? 70.0 : 60.0,
                    color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            isSelected
                ? Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.5,
                          left: MediaQuery.of(context).size.width * 0.12,
                          right: 12.0),
                      child: Text(
                        caption,
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
