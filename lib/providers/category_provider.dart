import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/category_model.dart';
import 'package:aartas_design_system/models/search_category_list.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  List<CategoryData> _categoryList = [];

  List<CategoryData> getCategoryList() {
    return _categoryList;
  }

  Future<CategoryResponse> fetchCategoryList(
    String baseURL,
  ) async {
    var _url = Uri.parse("$baseURL/clinishare/get/category/list");
    final res = await http.post(_url);
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      _categoryList = CategoryResponse.fromJson(json.decode(res.body)).data!;
      notifyListeners();
      return CategoryResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      notifyListeners();
      return CategoryResponse(message: json.decode(res.body)['message']);
    }
  }

  final List<SearchCategoryData> _searchResponse = [];

  List<SearchCategoryData> getSearchResponse() {
    return _searchResponse;
  }

  Future<SearchCategoryResponse> fetchSearchResponse(
    String baseURL,
    String? type,
    String? search,
  ) async {
    var _url = Uri.parse("$baseURL/$type/list");
    final res = await http.post(_url, body: {
      "search": search ?? "",
    });
    String _message = "(${res.statusCode}) $_url: type:$type, search:$search";
    log(_message);

    if (res.statusCode == 200) {
      log("TEST: ${json.decode(res.body)['data'][type].length}");
      _searchResponse.clear();
      for (var i = 0; i < json.decode(res.body)['data'][type].length; i++) {
        _searchResponse.add(
          SearchCategoryData(
            id: json.decode(res.body)['data'][type][i]['id'],
            title: json.decode(res.body)['data'][type][i]['title'],
          ),
        );
        notifyListeners();
      }
      return SearchCategoryResponse.fromJson(json.decode(res.body));
    }

    return SearchCategoryResponse(message: json.decode(res.body)['message']);
  }

  // -------------------------- Complaints -----------------------------------

  // -------------------------- Complaints -----------------------------------
  // -------------------------- Diagnosis -----------------------------------

  // -------------------------- Diagnosis -----------------------------------
  // -------------------------- Investigations -----------------------------------

  // -------------------------- Investigations -----------------------------------
}
