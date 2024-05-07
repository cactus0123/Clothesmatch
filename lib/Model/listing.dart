// ignore_for_file: file_names

class Listing {
  String color;
  String description;
  String image;
  String name;
  double price;
  String size;
  String username;
  bool sold;

  Listing({
    required this.color,
    required this.description,
    required this.image,
    required this.name,
    required this.price,
    required this.size,
    required this.username,
    required this.sold,
  });

  //override the == operator to compare two listings
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Listing && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  // This method is used to convert the data from the database to a map
  Listing.fromJson(Map<String, Object?> json)
      : this(
            color: json['color'] as String,
            description: json['description'] as String,
            image: json['image'] as String,
            name: json['name'] as String,
            price: json['price'] as double,
            size: json['size'] as String,
            username: json['username'] as String,
            sold: json['sold'] as bool);

  // This method is used to update any listing with new values and return the new listing
  Listing copyWith(
      {String? color,
      String? description,
      String? image,
      String? name,
      double? price,
      String? size,
      String? username,
      bool? sold}) {
    return Listing(
      color: color ?? this.color,
      description: description ?? this.description,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      size: size ?? this.size,
      username: username ?? this.username,
      sold: sold ?? this.sold,
    );
  }

  // Returns listing as map/json
  Map<String, Object?> toJson() {
    return {
      'color': color,
      'description': description,
      'image': image,
      'name': name,
      'price': price,
      'size': size,
      'username': username,
      'sold': sold,
    };
  }
}
