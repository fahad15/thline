import 'package:meta/meta.dart' show required;

class RappiCategory {
  const RappiCategory({
    @required this.name,
    @required this.products,
  });
  final String name;

  final List<RappiProduct> products;
}

class RappiProduct {
  const RappiProduct({
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.image,
  });
  final String name;
  final String description;
  final double price;
  final String image;
}

const rappiCategories = [
  RappiCategory(name: 'orden Again', products: [
    RappiProduct(
        name: 'Silim Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
  ]),
  RappiCategory(name: 'orden ', products: [
    RappiProduct(
        name: 'Silim1 Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim1 Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim1 Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim1 Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
  ]),
  RappiCategory(name: 'thichen ', products: [
    RappiProduct(
        name: ' Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: ' Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: ' Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: ' Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: ' Lights',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
  ]),
  RappiCategory(name: 'orang ', products: [
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
  ]),
  RappiCategory(name: 'too ', products: [
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
  ]),
  RappiCategory(name: 'bnana ', products: [
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
    RappiProduct(
        name: 'Silim ',
        description: 'beef-bibimbap mit Ries, bohhen, spink',
        price: 26.50,
        image: 'assets/logo.jpg'),
  ]),
];
