import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostorewithbloc/module/home/cubit/home_cubit.dart';
import 'package:neostorewithbloc/routes/app_routes.dart';
import '../../data/utils/authentication.dart';
import '../../data/widgets/snackbars.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeLogout) {
              Navigator.popAndPushNamed(context, Routes.LOGIN);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBars()
                    .successSnackBar(context: context, text: "See you soon"),
              );
            }
          },
          builder: (context, state) {
            return MaterialButton(
              color: Colors.blue,
              onPressed: () {
                BlocProvider.of<HomeCubit>(context).logout(context);
              },
              splashColor: Colors.blueGrey,
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
