class Product {
  int? id;
  String? name;
  String? imageUrl;
  String? sold;
  String? price;
  bool? select = false;

  Product({this.name, this.id, this.price, this.select,this.imageUrl,this.sold});
}

List<Product> productList = [
  Product(    id: 1,     name: 'Ready To Deliver To Your Home', imageUrl:  "assets/programingName/botpng.png",          sold: '10',   price: '10000', select: false,  ),
  Product(    id: 2,     name: 'Ready To Deliver To Your Home', imageUrl:  "assets/programingName/chat-app.jpg",        sold: '20',   price: '20',    select: false,  ),
  Product(    id: 3,     name: 'Ready To Deliver To Your Home', imageUrl:  "assets/programingName/csharp.jpg",          sold: '40',   price: '40',    select: false,  ),
  Product(    id: 4,     name: 'Ready To Deliver To Your Home', imageUrl:  "assets/programingName/excel.jpg",           sold: '60',   price: '60',    select: false,  ),
  Product(    id: 5,     name: 'Ready To Deliver To Your Home', imageUrl:  "assets/programingName/flutter.png",         sold: '70',   price: '70',    select: false,  ),
  Product(    id: 6,     name: 'Ready To Deliver To Your Home', imageUrl:  "assets/programingName/flutterapp.png",      sold: '80',   price: '80',    select: false,  ),
  Product(    id: 7,     name: 'Ready To Deliver To Your Home', imageUrl:  "assets/programingName/html.jpg",            sold: '90',   price: '90',    select: false,  ),
  Product(    id: 8,     name: 'Ready To Deliver To Your Home', imageUrl:  "assets/programingName/java.jpg",            sold: '10',   price: '10',    select: false,  ),
  Product(    id: 9,     name: 'Ready To Deliver To Your Home', imageUrl:  "assets/programingName/javascript.jpg",      sold: '90',   price: '90',    select: false,  ),
  Product(    id: 10,    name: 'Ready To Deliver To Your Home', imageUrl: "assets/programingName/machine.png",          sold: '10',   price: '10',    select: false,  ),
  Product(    id: 11,    name: 'Ready To Deliver To Your Home', imageUrl: "assets/programingName/mongodb.png",          sold: '90',   price: '90',    select: false,  ),
  Product(    id: 12,    name: 'Ready To Deliver To Your Home', imageUrl: "assets/programingName/nodejs.png",           sold: '40',   price: '40',    select: false,  ),
  Product(    id: 13,    name: 'Ready To Deliver To Your Home', imageUrl: "assets/programingName/php.jpg",              sold: '70',   price: '70',    select: false,  ),
  Product(    id: 14,    name: 'Ready To Deliver To Your Home', imageUrl: "assets/programingName/posSystem.jpg",        sold: '10',   price: '10',    select: false,  ),
  Product(    id: 15,    name: 'Ready To Deliver To Your Home', imageUrl: "assets/programingName/pythonlogo.png",       sold: '10',   price: '10',    select: false,  ),
  Product(    id: 16,    name: 'Ready To Deliver To Your Home', imageUrl: "assets/programingName/reactjs.png",          sold: '10',   price: '10',    select: false,  ),
  Product(    id: 17,    name: 'Ready To Deliver To Your Home', imageUrl: "assets/images/allCategories/beverage1.jpeg", sold: '10',   price: '10',    select: false,  ),
  Product(    id: 18,    name: 'Ready To Deliver To Your Home', imageUrl: "assets/images/allCategories/seloon.jpg",     sold: '10',   price: '10',    select: false,  ),
  Product(    id: 19,    name: 'Ready To Deliver To Your Home', imageUrl: "assets/images/allCategories/shoes_6.png",    sold: '10',   price: '10',    select: false,  ),
  Product(    id: 20,    name: 'Ready To Deliver To Your Home', imageUrl: "assets/images/allCategories/vagetables.jpg", sold: '10',   price: '10',    select: false,  ),
];


