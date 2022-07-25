import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostorewithbloc/data/constants/strings.dart';
import 'package:neostorewithbloc/module/login/controller/login_controller.dart';
import 'package:neostorewithbloc/module/login/cubit/login_cubit.dart';

import '../../../data/widgets/background_image.dart';
import '../../../data/widgets/custom_button.dart';
import '../../../data/widgets/custom_textfiled.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final loginKey = GlobalKey<FormState>();

  final LoginController controller = LoginController();

  //* Textediting Controller ----------------->>>>>>>>>>
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const BGimage(),
          Center(
            child: Form(
              key: loginKey,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "NeoSOFT",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CustomTextField(
                            controller: emailController,
                            validator: (email) => controller.validEmail(email),
                            labelText: "Username",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          CustomTextField(
                            controller: passwordController,
                            validator: (value) =>
                                controller.validPassword(value),
                            obscureText: true,
                            labelText: "Password",
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              return CustomButton(
                                navigation: () => BlocProvider.of<LoginC>(context),
                               
                                text: "LOGIN",
                                backgroundColor: Colors.white,
                                textColor: Colors.red,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            // onTap: () => Get.toNamed("/forgot-password"),
                            child: Text(
                              ConstantStrings.FORGOT_PASSWORD,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            ConstantStrings.NEW_ACCOUNT,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: GestureDetector(
                            // onTap: (() => Get.toNamed(Routes.REGISTER)),
                            child: Container(
                              color: Colors.red[900],
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
