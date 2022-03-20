class CartModel{
    int id;
    String productName;
    int quantity;
    double price;
    String remarks;
    String imageUri;

//<editor-fold desc="Data Methods">

  CartModel({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.remarks,
    required this.imageUri,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          productName == other.productName &&
          quantity == other.quantity &&
          price == other.price &&
          remarks == other.remarks &&
          imageUri == other.imageUri);

  @override
  int get hashCode =>
      id.hashCode ^
      productName.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      remarks.hashCode ^
      imageUri.hashCode;

  @override
  String toString() {
    return 'CartModel{' +
        ' id: $id,' +
        ' productName: $productName,' +
        ' quantity: $quantity,' +
        ' price: $price,' +
        ' remarks: $remarks,' +
        ' imageUri: $imageUri,' +
        '}';
  }

  CartModel copyWith({
    int? id,
    String? productName,
    int? quantity,
    double? price,
    String? remarks,
    String? imageUri,
  }) {
    return CartModel(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      remarks: remarks ?? this.remarks,
      imageUri: imageUri ?? this.imageUri,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'productName': this.productName,
      'quantity': this.quantity,
      'price': this.price,
      'remarks': this.remarks,
      'imageUri': this.imageUri,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as int,
      productName: map['productName'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      remarks: map['remarks'] as String,
      imageUri: map['imageUri'] as String,
    );
  }

//</editor-fold>
}