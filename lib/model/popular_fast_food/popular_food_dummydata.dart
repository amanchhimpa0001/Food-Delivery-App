import 'package:food_delivery_new_project/helpers/all_image.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/model/popular_fast_food/popular_fast_food.dart';

class Popular_food {
  static var Popular_food_list = [
    Popular_fastfood_model(
      id: "1",
      Resipename: "Peppe Pizzeria",
      fastfoodimg: Getimage.pizza,
      namepizza: "European Pizza",
      foodprice: "\$10",
      isDeliveryFree: true,
      rating: "4.8",
      diliverycharge: "Free",
      discription:
          "Prosciutto e funghi is a pizza variety that is topped with tomato sauce.",
      ingredients: [
        {"img": Getimage.Salt, "title": "Salt"},
        {"img": Getimage.Chicken, "title": "Chicken"},
        {"img": Getimage.Onion, "title": "Onion"},
        {"img": Getimage.garlic, "title": "garlic"},
        {"img": Getimage.pepper, "title": "pepper"},
        {"img": Getimage.Ginger, "title": "Ginger"},
        {"img": Getimage.Broccoli, "title": "Broccoli"},
        {"img": Getimage.Orange, "title": "Orange"},
        {"img": Getimage.walnut, "title": "walnut"},
      ],
      mints: "20 mints",
      size: ["10'", "14'", "19'"],
    ),
    Popular_fastfood_model(
      id: "2",
      Resipename: "Fratelli Figurato",
      fastfoodimg: Getimage.burger2,
      namepizza: "Smokin' Burger",
      foodprice: "\$10",
      isDeliveryFree: true,
      rating: "4.9",
      diliverycharge: "Free",
      discription:
          "Prosciutto e funghi is a pizza variety that is topped with tomato sauce.",
      ingredients: [
        {"img": Getimage.Salt, "title": "Salt"},
        {"img": Getimage.Chicken, "title": "Chicken"},
        {"img": Getimage.Onion, "title": "Onion"},
        {"img": Getimage.garlic, "title": "garlic"},
        {"img": Getimage.pepper, "title": "pepper"},
        {"img": Getimage.Ginger, "title": "Ginger"},
        {"img": Getimage.Broccoli, "title": "Broccoli"},
        {"img": Getimage.Orange, "title": "Orange"},
        {"img": Getimage.walnut, "title": "walnut"},
      ],
      mints: "20 mints",
      size: ["20'", "30'", "50'"],
    ),
    Popular_fastfood_model(
      id: "3",
      Resipename: "Fratelli Figurato",
      fastfoodimg: Getimage.burger,
      namepizza: "Buffalo Pizza.",
      foodprice: "\$50",
      isDeliveryFree: true,
      rating: "4.2",
      diliverycharge: "\$400",
      discription:
          "Prosciutto e funghi is a pizza variety that is topped with tomato sauce.",
      ingredients: [
        {"img": Getimage.Salt, "title": "Salt"},
        {"img": Getimage.Chicken, "title": "Chicken"},
        {"img": Getimage.Onion, "title": "Onion"},
        {"img": Getimage.garlic, "title": "garlic"},
        {"img": Getimage.pepper, "title": "pepper"},
        {"img": Getimage.Ginger, "title": "Ginger"},
        {"img": Getimage.Broccoli, "title": "Broccoli"},
        {"img": Getimage.Orange, "title": "Orange"},
        {"img": Getimage.walnut, "title": "walnut"},
      ],
      mints: "20 mints",
      size: ["30'", "35'", "49'"],
    ),
    Popular_fastfood_model(
      id: "4",
      Resipename: "Fratelli Figurato",
      fastfoodimg: Getimage.burgerbistro,
      namepizza: "Bullseye Burgers",
      foodprice:
          Appservices.calculatePriceAfterDiscount("100", "20").toString(),
      isDeliveryFree: false,
      rating: "4.4",
      diliverycharge: "\$400",
      discription:
          "Prosciutto e funghi is a pizza variety that is topped with tomato sauce.",
      ingredients: [
        {"img": Getimage.Salt, "title": "Salt"},
        {"img": Getimage.Chicken, "title": "Chicken"},
        {"img": Getimage.Onion, "title": "Onion"},
        {"img": Getimage.garlic, "title": "garlic"},
        {"img": Getimage.pepper, "title": "pepper"},
        {"img": Getimage.Ginger, "title": "Ginger"},
        {"img": Getimage.Broccoli, "title": "Broccoli"},
        {"img": Getimage.Orange, "title": "Orange"},
        {"img": Getimage.walnut, "title": "walnut"},
      ],
      mints: "20 mints",
      size: ["20'", "34'", "60'"],
    ),
  ];
}
