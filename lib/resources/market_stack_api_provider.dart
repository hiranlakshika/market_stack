import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import '../models/historical_data.dart';
import '../models/intra_day.dart';
import '../util/app_configs.dart';

class MarketStackApiProvider {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<IntraDay?> getIntraDayResult({required final String date, required final String symbol}) async {
    String accessKey = _remoteConfig.getString('access_key');

    final response = await Dio().get('$baseUrl/intraday/$date?access_key=$accessKey&symbols=$symbol').then((res) {
      if (res.statusCode == HttpStatus.ok) {
        return IntraDay.fromJson(res.data);
      }
      return null;
    }).catchError((e, stackTrace) {
      if (e is DioError) {
        if (e.response?.statusCode == HttpStatus.notFound) {
          debugPrint('No data found');
          return null;
        }
        return null;
      }
      return null;
    });

    return response;
  }

  Future<HistoricalData?> getHistoricalData(
      {required final String fromDate, required final String toDate, required final String symbol}) async {
    String accessKey = _remoteConfig.getString('access_key');

    final response = await Dio()
        .get('$baseUrl/eod?access_key=$accessKey&symbols=$symbol&date_from=$fromDate&date_to=$toDate')
        .then((res) {
      if (res.statusCode == HttpStatus.ok) {
        return HistoricalData.fromJson(res.data);
      }
      return null;
    }).catchError((e, stackTrace) {
      if (e is DioError) {
        if (e.response?.statusCode == HttpStatus.notFound) {
          debugPrint('No data found');
          return null;
        }
        return null;
      }
      return null;
    });

    return response;
  }
}
