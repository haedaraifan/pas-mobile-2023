class ListModel {
  final String img;
  final String title;
  final String desc;
  final String price;

  ListModel({
    required this.img,
    required this.title,
    required this.desc,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ListModel &&
              runtimeType == other.runtimeType &&
              title == other.title &&
              desc == other.desc &&
              price == other.price;

  @override
  int get hashCode => title.hashCode ^ desc.hashCode ^ price.hashCode;
}
