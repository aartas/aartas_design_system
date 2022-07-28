import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/category_model.dart';
import 'package:aartas_design_system/models/sub_category_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  List<CategoryData> _categoryList = [];

  List<CategoryData> getCategoryList() {
    return _categoryList;
  }

  Future<CategoryResponse> fetchCategoryList() async {
    var _url = Uri.parse("$baseURL/clinishare/get/category/list");
    final res = await http.post(_url);
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      _categoryList = CategoryResponse.fromJson(json.decode(res.body)).data!;
      notifyListeners();
      return CategoryResponse.fromJson(json.decode(res.body));
    }

    return CategoryResponse(message: _message);
  }

  List<SubCategoryOptionsData> _searchResponse = [];

  List<SubCategoryOptionsData> getSearchResponse() {
    return _searchResponse;
  }

  Future<SubCategoryOptionsResponse> fetchSearchResponse(
    String? type,
    String? search,
  ) async {
    var _url = Uri.parse("$baseURL/api/$type/list");
    final res = await http.post(_url, body: {
      "search": search ?? "",
    });
    String _message = "(${res.statusCode}) $_url: type:$type, search:$search";
    log(_message);

    if (res.statusCode == 200) {
      _searchResponse =
          SubCategoryOptionsResponse.fromJson(json.decode(res.body)).data!;
      notifyListeners();
      return SubCategoryOptionsResponse.fromJson(json.decode(res.body));
    }

    return SubCategoryOptionsResponse(message: _message);
  }
}
