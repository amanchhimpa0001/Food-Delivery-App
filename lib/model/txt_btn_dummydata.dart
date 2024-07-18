import 'package:food_delivery_new_project/helpers/all_image.dart';

class dummydata {
  static List<String> News_button = [
    "Home",
    "Work",
    "Others",
  ];
  static List<String> food_button = [
    "Burger",
    "Sandwich",
    "Pizza",
    'Sanwich',
    'chaumin',
    'golgape',
  ];
  static List<String> Offers_list = [
    "Offers",
    "Pick Up",
    "Offer",
    'Online payment available',
  ];
  static List<String> DeliverTimelist = [
    "10-15 min",
    "20 min",
    "30 min",
  ];
  static List<String> peckinglist = [
    "\$",
    "\$\$",
    "\$\$\$",
  ];
  static List<Map<String, dynamic>> cardlist = [
    {"image": Getimage.Cash, "cardname": "Cash"},
    {"image": Getimage.visa, "cardname": "Visa"},
    {"image": Getimage.masterscard, "cardname": "Mastercard"},
    {"image": Getimage.paypal, "cardname": "PayPal"}
  ];
}
