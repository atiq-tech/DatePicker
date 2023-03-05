import 'package:bornon_app/api_models/category_apimodel.dart';
import 'package:bornon_app/api_models/hotdeal_model.dart';
import 'package:bornon_app/api_models/new_arrival_model.dart';
import 'package:bornon_app/api_models/product_model.dart';
import 'package:bornon_app/custom_http_api_integration/allproduct_apiintegration.dart';
import 'package:bornon_app/custom_http_api_integration/category_apiintegration.dart';
import 'package:bornon_app/custom_http_api_integration/newarrival_api_intregration.dart';
import 'package:flutter/material.dart';

import '../custom_http_api_integration/hot_deal_product_api_integration.dart';


class CounterProvider extends ChangeNotifier {
  //ApiallProduct ? apiall;
  List<ProductModel> allProductlistData = [];

  getProduct(BuildContext context) async {
    allProductlistData = await ApiallProduct.GetApiData(context);
    notifyListeners();
  }

  //  HotDealProduct ? apiall;
  List<HotDealProductModel> allHotDealData = [];

  getHotdeal(BuildContext context) async {
    allHotDealData = await HotDealProduct.GetHotDealApi(context);
    notifyListeners();
  }

  //  NewArrivalProduct ? apiall;
  List<Data> allnewArrivalData = [];

  getNewArrival(BuildContext context) async {
     allnewArrivalData = await NewArrivalProduct.GetNewArrivalData(context);
    notifyListeners();
  }

    //CategoryProduct ? apiall;
  List<CategoryData> allcategorylistData = [];

  getCategorys(BuildContext context) async {
    allcategorylistData = await CategoryProduct.GetCategoryApi(context);
    notifyListeners();
  }
}
