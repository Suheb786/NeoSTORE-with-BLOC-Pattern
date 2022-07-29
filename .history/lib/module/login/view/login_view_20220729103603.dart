import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/utils/authentication.dart';

import '../model/login_field_model.dart';

import '../../../data/components/validator.dart';
import '../../../data/constants/constant_strings.dart';

import '../../../data/widgets/background_image.dart';
import '../../../data/widgets/custom_button.dart';
import '../../../data/widgets/custom_textfiled.dart';
import '../../../routes/app_routes.dart';
import '../cubit/login_cubit.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

 /// common instences [loginKey]

  final loginKey = GlobalKey<FormState>();
  final Validators validators = Validators();

  //* Textediting Controller ----------------->>>>>>>>>>
  //* used in Login Screen ------- >>>>
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


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
                            controller: email,
                            validator: (em) => validators.validEmail(em),
                            labelText: "Username",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          CustomTextField(
                            controller: password,
                            validator: (value) =>
                                validators.validPassword(value),
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
                              if (state is LoginSuccess) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, Routes.HOME, (route) => false);
                              }
                            },
                            builder: (context, state) {
                              return (state is LoginLoading)
                                  ? const CircularProgressIndicator()
                                  : CustomButton(
                                      navigation: () {
                                        final fieldModel = LoginFieldModel(
                                            email: email.text,
                                            password: password.text);
                                        BlocProvider.of<LoginCubit>(context)
                                            .checkLoginButton(
                                                context: context,
                                                formKey: loginKey,
                                                model: fieldModel);
                                      },
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
                              StringsConstant.forgot_password,
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
                            StringsConstant.new_account,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: GestureDetector(
                            onTap: (() =>
                                Navigator.pushNamed(context, Routes.REGISTER)),
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
