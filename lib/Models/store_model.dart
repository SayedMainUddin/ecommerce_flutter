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
    name: 'Hotel and Restorunt'
  ),
  StoreCategory(
      id: 2,
      name: 'Grocery'
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
    name: 'Sayed Main Uddin',
      imageUrl: 'https://cdn-colla.nitrocdn.com/aGOFLQWREmkPcEuaJpGePQetRgHRrvYU/assets/static/optimized/rev-be63c5d/wp-content/uploads/2018/08/on-demand-home-services-main.jpg',

      //imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fdokument.pub%2Fdl%2Fjumon-company-profile-flipbook-pdf&psig=AOvVaw0kVlHh4d80DvEtSy0yPf3F&ust=1647340980160000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPjZ8ca1xfYCFQAAAAAdAAAAABAD',
 category: storeCategoryList[0].name,
  location: 'Chattogram Bangladesh',
  totalFollowers: 10,
  totalProducts: 5,
  isFollow: true),

  Store(
      id: 2,
      name: 'Love of wisedom',
      imageUrl: 'https://cdn-colla.nitrocdn.com/aGOFLQWREmkPcEuaJpGePQetRgHRrvYU/assets/static/optimized/rev-be63c5d/wp-content/uploads/2018/08/on-demand-home-services-main.jpg',

      // imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fin.worldorgs.com%2Fcatalog%2Fbhadesar%2Fbeauty-salon%2Fhair-dot-com-spa-and-family-seloon&psig=AOvVaw0kkw9kUzKQo0cQQ9P9m_oW&ust=1647341582064000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPDc8eW3xfYCFQAAAAAdAAAAABAD',
      category: storeCategoryList[1].name,
      location: 'Bohoddar Hat',
      totalFollowers: 10,
      totalProducts: 5,
      isFollow: false),
  Store(
      id: 3,
      name: 'Israq Night Club',
      imageUrl: 'https://cdn-colla.nitrocdn.com/aGOFLQWREmkPcEuaJpGePQetRgHRrvYU/assets/static/optimized/rev-be63c5d/wp-content/uploads/2018/08/on-demand-home-services-main.jpg',

      //imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.collinsdictionary.com%2Fdictionary%2Fenglish%2Fnightclub&psig=AOvVaw2S3VE9I5Aa2n66Tf3-kJ1l&ust=1647341642073000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIib0YS4xfYCFQAAAAAdAAAAABAD',
      category: storeCategoryList[3].name,
      location: 'Chawak bazar',
      totalFollowers: 10,
      totalProducts: 5,
      isFollow: true),
  Store(
      id: 4,
      name: 'Diviya Home Service',
      imageUrl: 'https://cdn-colla.nitrocdn.com/aGOFLQWREmkPcEuaJpGePQetRgHRrvYU/assets/static/optimized/rev-be63c5d/wp-content/uploads/2018/08/on-demand-home-services-main.jpg',
      category: storeCategoryList[4].name,
      location: 'USA',
      totalFollowers: 10,
      totalProducts: 5,
      isFollow: true),

];