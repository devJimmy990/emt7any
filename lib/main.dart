import 'package:emt7any/core/helper/service_locator.dart';
import 'package:emt7any/feature/auth/cubit/auth_cubit.dart';
import 'package:emt7any/feature/auth/cubit/auth_state.dart';
import 'package:emt7any/feature/auth/presentation/screen/login_screen.dart';
import 'package:emt7any/feature/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [BlocProvider(create: (context) => sl<AuthCubit>())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
        ),
      ),
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // home: const ScreenRecorederScreen(),
      home: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) =>
            state.user != null ? const HomeScreen() : const LoginScreen(),
      ),
    ),
  );
}
