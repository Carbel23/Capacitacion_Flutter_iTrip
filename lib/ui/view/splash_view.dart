import 'package:flutter/material.dart';
import 'package:itrip/use_cases/singleton/session_manager.dart';
import 'package:itrip/utils/colors_app.dart';
import 'package:itrip/utils/constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> startApp() async {
    await Future.delayed(Duration(seconds: 2));
    bool sessionGuardada =
        SessionManager.getInstance().getToken() != null &&
        (SessionManager.getInstance().getToken() ?? "").isNotEmpty;
    if (sessionGuardada) {
      Navigator.of(
        Constants.navigatorKey.currentContext!,
      ).pushReplacementNamed("/home");
    } else {
      Navigator.of(
        Constants.navigatorKey.currentContext!,
      ).pushReplacementNamed("/login");
    }
  }

  @override
  void initState() {
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.primaryColor,
      child: Center(child: Image.asset("assets/img/logo.png", width: 300)),
    );
  }
}
