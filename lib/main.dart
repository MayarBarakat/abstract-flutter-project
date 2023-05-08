import 'package:abstract_flutter_project/shared/network/local/cache_helper.dart';
import 'package:abstract_flutter_project/shared/network/remote/dio_helper.dart';
import 'package:abstract_flutter_project/shared/styles/theme.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => ShopCubit()..loading(),
          ),

          BlocProvider(
            create: (BuildContext context) => ShopRegisterCubit(),
          ),

        ],
        child: BlocConsumer<ShopCubit, ShopStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: theme(),
                home: Layout(),
              );
            }));

  }
}



