import 'package:flutter/material.dart';

import 'Constants.dart';
import 'Record.dart' as Record;






// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  final Record.Record record;
  Future<void> launched;
  String phon = '12345';

  DetailPage({this.record});
int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      height: data.size.height / 2,
      width: double.infinity,
      child: Scaffold(
       
          backgroundColor: appDarkGreyColor,
       
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Positioned(
                      bottom: 10.0,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RawMaterialButton(
                          padding: EdgeInsets.all(10.0),
                          shape: CircleBorder(),
                          fillColor: apptDark2,
                          onPressed: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned.fill(
                  top: 10.0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RawMaterialButton(
                        padding: EdgeInsets.all(10.0),
                        elevation: 12.0,
                        onPressed: () {},
                        shape: CircleBorder(),
                       
                    ), 
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Container(
              decoration: BoxDecoration(
                color: appGreyColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.7),
                    blurRadius: 20.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(record.address,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center),
                    SizedBox(height: 10.0),
                    Text(
                      record.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      record.vendor,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300],
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Container(
                      decoration: BoxDecoration(
                          color: appGreyColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.7),
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: Offset(
                                5.0, // Move to right 10  horizontally
                                5.0, // Move to bottom 10 Vertically
                              ),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Positioned(
                            bottom: 10.0,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RawMaterialButton(
                                padding: EdgeInsets.all(10.0),
                                shape: CircleBorder(),
                                fillColor: appGreyColor,
                                onPressed: () {},
                                    
                                child: Icon(
                                  Icons.phone,
                                  size: 25.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10.0,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RawMaterialButton(
                                padding: EdgeInsets.all(10.0),
                                shape: CircleBorder(),
                                fillColor: appGreyColor,
                                onPressed: () {},
                                    
                                child: Icon(
                                  Icons.location_on,
                                  size: 25.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10.0,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RawMaterialButton(
                                padding: EdgeInsets.all(10.0),
                                shape: CircleBorder(),
                                fillColor: appGreyColor,
                                onPressed: () {},
                                child: Icon(
                                  Icons.share,
                                  size: 25.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                          color: appGreyColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.7),
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: Offset(
                                5.0, // Move to right 10  horizontally
                                5.0, // Move to bottom 10 Vertically
                              ),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () =>
                                    SelectableText('Add to My List'),
                                icon: Icon(Icons.gps_fixed),
                                color: Colors.blue,
                              ),
                              SelectableText(
                                record.gps,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.content_copy),
                                onPressed: () => SelectableText(record.gps),
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


