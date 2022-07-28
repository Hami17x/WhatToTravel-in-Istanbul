import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx_bloc/map/model/map_model.dart';

abstract class IMapService {
  final Dio dio;

  IMapService(this.dio);

  Future<List<MapModel>?> fetchItems(BuildContext context);
}

class MapService extends IMapService {
  MapService(Dio dio) : super(dio);
/*
  @override
  Future<List<MapModel>?> fetchItems(context) async {
    final response =
        await Dio().get('https://fluttertr-ead5c.firebaseio.com/maps.json');

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      //print(_datas);
      if (_datas is List) {
        return _datas.map((e) => MapModel.fromJson(e)).toList();
      }
    }
  }
*/

  @override
  Future<List<MapModel>?> fetchItems(BuildContext context) async {
    final assesBundle = DefaultAssetBundle.of(context);
    final data = await assesBundle.loadString("assets/place.json");
    final body = jsonDecode(data);

    if (body is List) {
      return body.map((e) => MapModel.fromJson(e)).toList();
    }
  }
}
