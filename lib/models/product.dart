import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class Produc {
  final String name;
  final String description;
  final double pricce;
  final String image;

  const Produc(
      {@required this.name,
      @required this.description,
      @required this.pricce,
      @required this.image});
}
