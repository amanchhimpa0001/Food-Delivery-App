class All_Categories_model {
  String image,
      foodname,
      pricetxt,
      startingprice,
      discription,
      rating,
      mints,
      diliverycharge,
      id;
  bool isDeliveryFree;
  List size;
  List<Map<String, dynamic>> ingredients;
  All_Categories_model(
      {required this.diliverycharge,
      required this.mints,
      required this.rating,
      required this.discription,
      required this.image,
      required this.foodname,
      required this.id,
      required this.pricetxt,
      required this.startingprice,
      required this.ingredients,
      required this.isDeliveryFree,
      required this.size});
}
