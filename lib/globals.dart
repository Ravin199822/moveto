// TODO Implement this library.

library moveto.globals;

import 'model/Articles_All_Model.dart';

class CountedItem {
  static List<ArticleAllModelResponse> bedroomfurnitureglobal =
      List<ArticleAllModelResponse>();
  static List<ArticleAllModelResponse> bedroomelectronicsglobal =
      List<ArticleAllModelResponse>();

  static List<ArticleAllModelResponse> livingroomfurnitureglobal =
      List<ArticleAllModelResponse>();
  static List<ArticleAllModelResponse> livingroomelectronicsglobal =
      List<ArticleAllModelResponse>();

  static List<ArticleAllModelResponse> kitchenfurnitureglobal =
      List<ArticleAllModelResponse>();
  static List<ArticleAllModelResponse> kitchenelectronicsglobal =
      List<ArticleAllModelResponse>();

  static List<ArticleAllModelResponse> vehicleglobal =
      List<ArticleAllModelResponse>();

  static List<ArticleAllModelResponse> customglobal =
  List<ArticleAllModelResponse>();

  static int totalvolume = 0;

  static int loading_floor_price = 0;
  static int unloading_floor_price = 0;

  static var discount_percentage = 0;
}
