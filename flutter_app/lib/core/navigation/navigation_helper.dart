import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Navigation helper wrapper for GoRouter.
///
/// Use this class to keep navigation behavior consistent across the app.
abstract class NavigationHelper {
  NavigationHelper._();

  static void push(BuildContext context, String location, {Object? extra}) {
    context.push(location, extra: extra);
  }

  static void replace(BuildContext context, String location, {Object? extra}) {
    context.go(location, extra: extra);
  }

  static void pop(BuildContext context) {
    if (context.canPop()) {
      context.pop();
      return;
    }

    GoRouter.of(context).go('/');
  }
}
