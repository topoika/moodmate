import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base/data/helper/helper.dart';
import 'base/data/provider/provider.dart';
import 'base/views/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositries,
      child: MultiBlocProvider(
        providers: blocProvider(context: context),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          theme: lightTheme,
          home: SplashPage(),
          themeMode: ThemeMode.light,
          navigatorKey: navigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}

// navigation key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Get {
  static BuildContext? get context => navigatorKey.currentContext;
  static NavigatorState? get navigator => navigatorKey.currentState;
}
