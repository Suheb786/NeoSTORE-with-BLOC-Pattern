import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostorewithbloc/data/components/text_editing_controllers.dart';
import 'package:neostorewithbloc/module/login/model/login_field_model.dart';

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
  final loginKey = GlobalKey<FormState>();

  final Validators validators = Validators();

  //* Textediting Controller ----------------->>>>>>>>>>
  //* used in Login Screen ------- >>>>
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                            validator: (email) => validators.validEmail(email),
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
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              final filedModel = LoginFieldModel(
                                  email: email.text, password: password.text);
                              return CustomButton(
                                navigation: () =>
                                    BlocProvider.of<LoginCubit>(context)
                                        .checkLoginButton(
                                            formKey: loginKey,
                                            model: LoginFieldModel(
                                                email: email.text,
                                                password: password.text)),
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
                              ConstantStrings.forgot_password,
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
                            ConstantStrings.new_account,
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
