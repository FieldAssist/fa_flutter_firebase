import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

abstract class AnalyticsService {
  Future<void> setUserId(String id);

  Future<void> setUserProperties(
      {@required String name, @required String value});

  Future<void> setCurrentPage({@required String pageName});

  Future<void> logEvent({
    @required String name,
    Map<String, dynamic> parameters,
  });

  FirebaseAnalytics getAnalyticsClient();

  void onError(MyException exception);

  void onSuccess(String name, Map<String, dynamic> parameters);
}
