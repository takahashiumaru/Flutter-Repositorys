// ignore_for_file: lines_longer_than_80_chars, use_key_in_widget_constructors

import 'package:flutter_repository/src/app/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_repository/src/app/util/connection_status_singleton.dart';
import 'package:flutter_repository/src/app/util/theme.dart';
import 'package:flutter_repository/src/app/view/page/menu/menu_page.dart';
import 'package:flutter_repository/src/app/view/page/splash/splash_page.dart';
import 'package:flutter_repository/src/app/view/page/welcome/welcome_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
  );
  connectionStatus = ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  HydratedBlocOverrides.runZoned(
    () => runApp(
      const App(),
    ),
    storage: storage,
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class App extends StatelessWidget {
  const App() : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: CrudExampleTheme.getTheme(),
      builder: EasyLoading.init(),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: authenticationBloc,
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            DateTime now = DateTime.now();
            print(now.hour.toString() + now.minute.toString() + now.second.toString());
            return MenuPage.prepare();
          } else {
            DateTime now = DateTime.now();
            print(now.year.toString() + now.month.toString() + now.day.toString());
            return const WelcomePage();
          }
        },
      ),
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
