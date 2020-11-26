import 'dart:async';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_firebase/src/analytics/base/analytics_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';

abstract class AnalyticsServiceImpl extends AnalyticsService {
  AnalyticsServiceImpl();

  final analytics = FirebaseAnalytics();

  @override
  Future<void> setCurrentPage({String pageName}) {
    return logEvent(name: pageName);
  }

  @override
  Future<void> setUserId(String id) => analytics.setUserId(id);

  @override
  Future<void> setUserProperties({String name, String value}) {
    return analytics.setUserProperty(name: name, value: value);
  }

  @protected
  Future<void> logEvent(
      {@required String name, Map<String, dynamic> parameters}) {
    if (isMobile) {
      return analytics
          .logEvent(name: name, parameters: parameters)
          .then((_) => onSuccess)
          .catchError(onError);
    } else {
      onError(MyException('Error: Not logging firebase analytics.'));
      return null;
    }
  }

  @override
  FirebaseAnalytics getAnalyticsClient() {
    return analytics;
  }

  @override
  void onError(MyException error);

  @override
  void onSuccess();
}
