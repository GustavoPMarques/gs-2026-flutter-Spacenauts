import 'package:flutter/material.dart';
import 'package:spacenauts/navigation/app_routes.dart';
import 'package:spacenauts/ui/screens/alertas_screen.dart';
import 'package:spacenauts/ui/screens/home_screen.dart';
import 'package:spacenauts/ui/screens/info_satelite_screen.dart';
import 'package:spacenauts/ui/screens/intro_screen.dart';
import 'package:spacenauts/ui/screens/monitoramento_screen.dart';
import 'package:spacenauts/ui/screens/splash_screen.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(
            onNavigateToIntro: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.intro,
                (route) => false,
              );
            },
          ),
        );

      case AppRoutes.intro:
        return MaterialPageRoute(
          builder: (context) => IntroScreen(
            onNavigateToHome: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (route) => false,
              );
            },
          ),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            onHomeClick: () => Navigator.pushNamed(context, AppRoutes.home),
            onAlertasClick: () => Navigator.pushNamed(context, AppRoutes.alertas),
            onMonitorarClick: () => Navigator.pushNamed(context, AppRoutes.monitorar),
            onSatelitesClick: () => Navigator.pushNamed(context, AppRoutes.infoSatelite),
          ),
        );

      case AppRoutes.alertas:
        return MaterialPageRoute(
          builder: (context) => AlertasScreen(
            onHomeClick: () => Navigator.pushNamed(context, AppRoutes.home),
            onAlertasClick: () => Navigator.pushNamed(context, AppRoutes.alertas),
            onMonitorarClick: () => Navigator.pushNamed(context, AppRoutes.monitorar),
            onSatelitesClick: () => Navigator.pushNamed(context, AppRoutes.infoSatelite),
          ),
        );

      case AppRoutes.monitorar:
        return MaterialPageRoute(
          builder: (context) => MonitoramentoScreen(
            onHomeClick: () => Navigator.pushNamed(context, AppRoutes.home),
            onAlertasClick: () => Navigator.pushNamed(context, AppRoutes.alertas),
            onMonitorarClick: () => Navigator.pushNamed(context, AppRoutes.monitorar),
            onSatelitesClick: () => Navigator.pushNamed(context, AppRoutes.infoSatelite),
          ),
        );

      case AppRoutes.infoSatelite:
        return MaterialPageRoute(
          builder: (context) => InfoSateliteScreen(
            onHomeClick: () => Navigator.pushNamed(context, AppRoutes.home),
            onAlertasClick: () => Navigator.pushNamed(context, AppRoutes.alertas),
            onMonitorarClick: () => Navigator.pushNamed(context, AppRoutes.monitorar),
            onSatelitesClick: () => Navigator.pushNamed(context, AppRoutes.infoSatelite),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Rota não encontrada')),
          ),
        );
    }
  }
}