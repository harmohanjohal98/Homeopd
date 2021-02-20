import 'dart:core';

import 'package:flutter_app/main/models/T3_Model.dart';
import 'package:flutter_app/main/main/utils/app_image.dart';

List<T3DashboardSliderModel> getDashboardSlider() {
  List<T3DashboardSliderModel> list = List<T3DashboardSliderModel>();
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg", "Fast Food", "John smith", t3_ic_dish1, t3_ic_profile));
  return list;
}

List<Theme3Dish> getDashboardList() {
  List<Theme3Dish> list = List<Theme3Dish>();

}

List<Theme3Follower> getFollowers() {
  List<Theme3Follower> list = List<Theme3Follower>();

  Theme3Follower model1 = Theme3Follower();
  model1.location = "Email us";
  model1.name = "ABC@example.com";
  model1.userImg = t3_ic_email;

  Theme3Follower model2 = Theme3Follower();
  model2.location = "Call us";
  model2.name = "+91 9876543210";
  model2.userImg = t3_ic_call;

  Theme3Follower model3 = Theme3Follower();
  model3.location = "Whatsapp no.";
  model3.name = "+91 9876543210";
  model3.userImg = t3_ic_whatsapp;


  list.add(model2);
  list.add(model1);
  list.add(model3);

  return list;
}
