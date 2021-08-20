import 'dart:convert';



import 'package:http/http.dart' as http;

import 'RecordList.dart';

class RecordServices {
  //
  
 Future<RecordList> getUsers() async {
    var url = "https://script.google.com/macros/s/AKfycbyBjs19TH4IhnJq5u8NxGbbtr0BiwojjWPwhCrx/exec";
      var response = await http.get(url);
      await Future.delayed(Duration(seconds: 1),()=>'sample string');

      if (response.statusCode==200  ) {
        
        var jsonResponse= json.decode(response.body);
        var recordList = new RecordList.fromJson(jsonResponse);
        var records = recordList;
    return records;
        
        } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ');
      }
 }
 Future<RecordList> updateAlbum(String title) async { 
  final http.Response response = await http.put( 
    'https://script.google.com/macros/s/AKfycbyBjs19TH4IhnJq5u8NxGbbtr0BiwojjWPwhCrx/exec', 
    headers: <String, String>{ 
      'Content-Type': 'application/json; charset=UTF-8', 
    }, 
    body: jsonEncode(<String, String>{ 
      'title': title, 
    }), 
  ); 
  // parsing JSOn or throwing an exception 
  if (response.statusCode == 200) { 
    return RecordList.fromJson(json.decode(response.body)); 
  } else { 
    throw Exception('Failed to update album.'); 
  } 
} 
 }
