import 'package:emt7any/core/helper/service_locator.dart';
import 'package:emt7any/feature/auth/cubit/student_cubit.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_cubit.dart';
import 'package:emt7any/feature/tzlmat/tzlmat_cubit.dart';
import 'package:emt7any/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => sl<ExamCubit>()),
      BlocProvider(create: (context) => sl<StudentCubit>()),
      BlocProvider(create: (context) => sl<TzlmatCubit>()),
    ],
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
      home: const IntroductionScreen(),
    ),
  );
}

/**
 * 
 * token: 134|A9qqjIHacdkMYBhIljnhN1fFsz4JamFN78xh2JNC57e0c3ca
I/flutter (26194): debug isAuthenticated: true, student: {id: 5, name: طارق هشام سيد الفرماوي, 
phone: 01010869006, email: tarekelfarmawy@outlook.com, student_code: studentTest, gender: male, 
section: scientific, student_id: 1, national_id: 12345678909998, school: {name: مدرسة السعيدية,
 governorate: الجيزة, adminstration: إدراة شرق التعليمية}, seat_number: 1010101, academic_year: first, 
 guardian_phone: 01010869000, birth_date: 1999-05-29T21:00:00.000Z}, this: StudentState(error: , loading: false, 
 student: {id: 5, name: طارق هشام سيد الفرماوي, phone: 01010869006, email: tarekelfarmawy@outlook.com, student_code: studentTest, 
 gender: male, section: scientific, student_id: 1, national_id: 12345678909998, school: {name: مدرسة السعيدية, governorate: الجيزة,
  adminstration: إدراة شرق التعليمية}, seat_number: 1010101, academic_year: first, guardian_phone: 01010869000,
   birth_date: 1999-05-29T21:00:00.000Z}, isAuthenticated: true)

 */
