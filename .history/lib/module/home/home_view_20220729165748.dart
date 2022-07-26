import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostorewithbloc/data/network/common_provider/fetch_user_provider.dart';
import 'cubit/home_cubit.dart';
import '../../routes/app_routes.dart';

import '../../data/widgets/snackbars.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        if
        builder: (context, state) {
          return Center(
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is HomeLogout) {
                  Navigator.popAndPushNamed(context, Routes.LOGIN);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBars().successSnackBar(
                        context: context, text: "See you soon"),
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
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
