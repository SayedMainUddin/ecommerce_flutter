class Store {
  int? id;
  String name;
  String imageUrl;
  String location;
  String category;
  int totalFollowers;
  int totalProducts;
  bool isFollow = false;


  Store({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.category,
    required this.totalFollowers,
    required this.totalProducts,
    this.isFollow = false,
    this.id,
  });
}
class StoreCategory {
  int? id;
  String name;



  StoreCategory({
    required this.name,
    this.id,
  });
}
List<StoreCategory> storeCategoryList=[
  StoreCategory(
    id: 1,
    name: 'IT support'
  ),
  StoreCategory(
      id: 2,
      name: 'It Support'
  ),
  StoreCategory(
      id: 3,
      name: 'Super Shop'
  ),
  StoreCategory(
      id: 4,
      name: 'Electornics'
  ),
  StoreCategory(
      id: 5,
      name: 'Seloon & Parler'
  ),
  StoreCategory(
      id: 6,
      name: 'Medics and Pharmechies'
  ),
  StoreCategory(
      id: 7,
      name: 'Vehicles'
  ),
  StoreCategory(
      id: 8,
      name: 'Property'
  ),
  StoreCategory(
      id: 9,
      name: 'Optics'
  )
];
List<Store> storeList = [
  Store(
    id: 1,
    name: 'Alchemy Software Limited',
      imageUrl: 'assets/Twilio-SMS-Bot.jpg',
      //imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fdokument.pub%2Fdl%2Fjumon-company-profile-flipbook-pdf&psig=AOvVaw0kVlHh4d80DvEtSy0yPf3F&ust=1647340980160000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPjZ8ca1xfYCFQAAAAAdAAAAABAD',
 category: storeCategoryList[0].name,
  location: 'Chattogram Bangladesh',
  totalFollowers: 10,
  totalProducts: 5,
  isFollow: true),

  Store(
      id: 2,
      name: 'Main Bhai It support',
      imageUrl: 'assets/programingName/chat-app.jpg',

      // imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fin.worldorgs.com%2Fcatalog%2Fbhadesar%2Fbeauty-salon%2Fhair-dot-com-spa-and-family-seloon&psig=AOvVaw0kkw9kUzKQo0cQQ9P9m_oW&ust=1647341582064000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPDc8eW3xfYCFQAAAAAdAAAAABAD',
      category: storeCategoryList[1].name,
      location: 'Noakhali Bangladesh',
      totalFollowers: 10,
      totalProducts: 5,
      isFollow: false),
  Store(
      id: 3,
      name: 'Israq Fiverr support',
      imageUrl: 'assets/programingName/csharp.jpg',

      //imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.collinsdictionary.com%2Fdictionary%2Fenglish%2Fnightclub&psig=AOvVaw2S3VE9I5Aa2n66Tf3-kJ1l&ust=1647341642073000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIib0YS4xfYCFQAAAAAdAAAAABAD',
      category: storeCategoryList[3].name,
      location: 'Chawak bazar',
      totalFollowers: 10,
      totalProducts: 5,
      isFollow: true),
  Store(      id: 4,       name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 5,       name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 6,       name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 7,       name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 8,       name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 9,       name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 10,      name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 11,      name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 12,      name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 13,      name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 14,      name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 15,      name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 16,      name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 17,      name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 18,      name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 19,      name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
  Store(      id: 20,      name: 'Sakib Enterprise',      imageUrl: 'assets/programingName/flutter.png',      category: storeCategoryList[4].name,      location: 'Bohoddar hat',      totalFollowers: 10,      totalProducts: 5,      isFollow: true),
];