class Listing {
  String color;
  String description;
  String name;
  String price;
  String size;
  String username;
  bool sold;

  Listing({
    required this.color,
    required this.description,
    required this.name,
    required this.price,
    required this.size,
    required this.username,
    required this.sold,
  });

  // This method is used to convert the data from the database to a map
  Listing.fromJson(Map<String, Object?> json)
      : this(
            color: json['color'] as String,
            description: json['description'] as String,
            name: json['name'] as String,
            price: json['price'] as String,
            size: json['size'] as String,
            username: json['username'] as String,
            sold: json['sold'] as bool);

  // This method is used to update any listing with new values and return the new listing
  Listing copyWith(
      {String? color,
      String? description,
      String? name,
      String? price,
      String? size,
      String? username,
      bool? sold}) {
    return Listing(
      color: color ?? this.color,
      description: description ?? this.description,
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
      'name': name,
      'price': price,
      'size': size,
      'username': username,
      'sold': sold,
    };
  }
}
