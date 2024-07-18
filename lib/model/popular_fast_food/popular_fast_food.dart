class Popular_fastfood_model {
  String fastfoodimg,
      namepizza,
      Resipename,
      foodprice,
      discription,
      rating,
      mints,
      diliverycharge,
      id;

  bool isDeliveryFree;
  List size;
  List<Map<String, dynamic>> ingredients;

  Popular_fastfood_model(
      {required this.Resipename,
      required this.fastfoodimg,
      required this.namepizza,
      required this.foodprice,
      required this.ingredients,
      required this.isDeliveryFree,
      required this.size,
      required this.mints,
      required this.rating,
      required this.discription,
      required this.diliverycharge,
      required this.id});
}
