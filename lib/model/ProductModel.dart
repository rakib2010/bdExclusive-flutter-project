class ProductModel {
  int id;

  String productName;

  int quantity;

  double price;

  String remarks;

  String imageUri;
  String imageName;

  int categoryId;

//<editor-fold desc="Data Methods">

  ProductModel({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.remarks,
    required this.imageUri,
    required this.imageName,
    required this.categoryId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          productName == other.productName &&
          quantity == other.quantity &&
          price == other.price &&
          remarks == other.remarks &&
          imageUri == other.imageUri &&
          imageName == other.imageName &&
          categoryId == other.categoryId);

  @override
  int get hashCode =>
      id.hashCode ^
      productName.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      remarks.hashCode ^
      imageUri.hashCode ^
      imageName.hashCode ^
      categoryId.hashCode;

  @override
  String toString() {
    return 'ProductModel{' +
        ' id: $id,' +
        ' productName: $productName,' +
        ' quantity: $quantity,' +
        ' price: $price,' +
        ' remarks: $remarks,' +
        ' imageUri: $imageUri,' +
        ' imageName: $imageName,' +
        ' categoryId: $categoryId,' +
        '}';
  }

  ProductModel copyWith({
    int? id,
    String? productName,
    int? quantity,
    double? price,
    String? remarks,
    String? imageUri,
    String? imageName,
    int? categoryId,
  }) {
    return ProductModel(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      remarks: remarks ?? this.remarks,
      imageUri: imageUri ?? this.imageUri,
      imageName: imageName ?? this.imageName,
      categoryId: categoryId ?? this.categoryId,
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
      'imageName': this.imageName,
      'categoryId': this.categoryId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      productName: map['productName'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      remarks: map['remarks'] as String,
      imageUri: map['imageUri'] as String,
      imageName: map['imageName'] as String,
      categoryId: map['categoryId'] as int,
    );
  }

//</editor-fold>
}
