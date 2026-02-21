class ProductData {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  ProductData({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  ProductData.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'],
        imageUrl = json['imageUrl'];

  Map<String,dynamic>  toJson() =>{
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'imageUrl': imageUrl,
  };
}