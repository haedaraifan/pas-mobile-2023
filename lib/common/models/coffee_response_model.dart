// To parse this JSON data, do
//
//     final productResponseModel = productResponseModelFromJson(jsonString);
import 'dart:convert';

List<ProductResponseModel> productResponseModelFromJson(String str) => List<ProductResponseModel>.from(json.decode(str).map((x) => ProductResponseModel.fromJson(x)));

String productResponseModelToJson(List<ProductResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductResponseModel {
    final String id;
    final int productResponseModelId;
    final String name;
    final String description;
    double price;
    final String region;
    final int weight;
    final List<String> flavorProfile;
    final List<GrindOption> grindOption;
    final int roastLevel;
    final String imageUrl;
    int? quantity;

    ProductResponseModel({
        required this.id,
        required this.productResponseModelId,
        required this.name,
        required this.description,
        required this.price,
        required this.region,
        required this.weight,
        required this.flavorProfile,
        required this.grindOption,
        required this.roastLevel,
        required this.imageUrl,
        this.quantity = 1,
    });

    factory ProductResponseModel.fromJson(Map<String, dynamic> json) => ProductResponseModel(
        id: json["_id"],
        productResponseModelId: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        region: json["region"],
        weight: json["weight"],
        flavorProfile: List<String>.from(json["flavor_profile"].map((x) => x)),
        grindOption: List<GrindOption>.from(json["grind_option"].map((x) => grindOptionValues.map[x]!)),
        roastLevel: json["roast_level"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "id": productResponseModelId,
        "name": name,
        "description": description,
        "price": price,
        "region": region,
        "weight": weight,
        "flavor_profile": List<dynamic>.from(flavorProfile.map((x) => x)),
        "grind_option": List<dynamic>.from(grindOption.map((x) => grindOptionValues.reverse[x])),
        "roast_level": roastLevel,
        "image_url": imageUrl,
    };
}

enum GrindOption {
    CAFETIERE,
    ESPRESSO,
    FILTER,
    FRENCH_PRESS,
    GRIND_OPTION_WHOLE_BEAN,
    POUR_OVER,
    WHOLE_BEAN
}

final grindOptionValues = EnumValues({
    "Cafetiere": GrindOption.CAFETIERE,
    "Espresso": GrindOption.ESPRESSO,
    "Filter": GrindOption.FILTER,
    "French press": GrindOption.FRENCH_PRESS,
    "Whole bean": GrindOption.GRIND_OPTION_WHOLE_BEAN,
    "Pour Over": GrindOption.POUR_OVER,
    "Whole Bean": GrindOption.WHOLE_BEAN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
