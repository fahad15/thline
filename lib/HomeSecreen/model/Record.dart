// To parse this JSON data, do
//
//     final record = recordFromJson(jsonvar);

import 'dart:convert';


 

class Record {
  var id;
  var name;
  var address;
  var vendor;
  var gps;
  var url;
  var contact;
  var lat ;
  var lng ;
  var location;


  Record(this.name, this.address, this.vendor, this.url ,this.gps, this.lat,this.lng);

    
 
  factory Record.fromJson(dynamic json){
    return new Record(
      
       "${json['name']}",
        "${json['address']}",
        "${json['vendor']}",
        "${json[' url']}",
        "${json['gps']}",
        "${json['lat']}",
        "${json['lng']}"
        
    );
  }

 Map toJson() => {
        'name': name,
        'address': address,
        'vendor': vendor,
        'url': url,
        'gps': gps,
        'lat': lat,
        'lng': lng
      };
}
class Location {
  double lat;
  double lng;

  Location(this.lat, this.lng);
}