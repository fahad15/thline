/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
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

  FeedbackForm(this.name, this.address, this.vendor, this.url ,this.gps, this.lat,this.lng);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['name']}",
        "${json['address']}",
        "${json['vendor']}",
        "${json[' url']}",
        "${json['gps']}",
        "${json['lat']}",
        "${json['lng']}"
        
    );
  }

  // Method to make GET parameters.
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
