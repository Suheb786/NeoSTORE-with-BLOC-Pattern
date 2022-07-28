// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostorewithbloc/data/constants/colors.dart';
import 'package:neostorewithbloc/data/widgets/progressing_indicator.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';
import '../../../data/components/enum.dart';
import '../../../data/components/text_editing_controllers.dart';
import '../../../data/components/validator.dart';
import '../../../data/widgets/background_image.dart';
import '../../../data/widgets/custom_appBar.dart';
import '../../../data/widgets/custom_textfiled.dart';
import '../cubit/register_cubit.dart';
import '../../../data/widgets/custom_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
//*used in registration screen-------->>>>
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextControllers controller = TextControllers();
  Validators validators = Validators();
  final registrationFormKey = GlobalKey<FormState>();
  bool? check = false;
  Gender genderType = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "Register"),
      body: Stack(
        children: [
          const BGimage(),
          Form(
            key: registrationFormKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("NeoSTORE",
                          style: Theme.of(context).textTheme.headline1),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelText: "First Name",
                        controller: firstNameController,
                        validator: (fname) => validators.validFirstName(fname),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Last Name",
                        controller: lastNameController,
                        validator: (lname) => validators.validLastName(lname),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Email",
                        controller: emailController,
                        validator: (email) => validators.validEmail(email),
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Password",
                        controller: passwordController,
                        validator: (value) => validators.validpassword(value),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Confirm Password",
                        controller: confirmPasswordController,
                        validator: (cpass) => validators.validConfirmPassword(
                            cpass,
                            passwordController,
                            confirmPasswordController),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Gender",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Expanded(
                            child: RadioListTile(
                                value: Gender.female,
                                groupValue: genderType,
                                activeColor: ConstantColors.white,
                                title: Text(
                                  "Female",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    genderType = value as Gender;
                                  });
                                }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                value: Gender.male,
                                groupValue: genderType,
                                activeColor: ConstantColors.white,
                                title: Text(
                                  "Male",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    genderType = value as Gender;
                                  });
                                }),
                          )
                        ],
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        controller: phoneNoController,
                        validator: (phone) => validators.validPhoneNo(phone),
                        labelText: "Phone No",
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormField<bool>(
                        builder: (state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: Transform.scale(
                                  scale: 0.5,
                                  child: Checkbox(
                                    onChanged: (value) {
                                      setState(() {
                                        check = value!;
                                        state.didChange(value);
                                      });
                                    },
                                    fillColor: MaterialStateColor.resolveWith(
                                      (states) => ConstantColors.white,
                                    ),
                                    activeColor: MaterialStateColor.resolveWith(
                                      (states) => ConstantColors.white,
                                    ),
                                    checkColor: MaterialStateColor.resolveWith(
                                      (states) => ConstantColors.red,
                                    ),
                                    value: check,
                                  ),
                                ),
                              ),
                              Text(
                                "I agree the Terms & Condition",
                                style: Theme.of(context).textTheme.headline3,
                              )
                            ],
                          );
                        },
                        validator: (value) =>
                            Validators().checkToggleButton(check),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<RegisterCubit, RegisterState>(
                        listener: (context, state) {
                          if (state is RegisterLoadingState) {
                            return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text));
                          }
                        },
                        builder: (context, state) {
                          RegisterModel registrationModel = RegisterModel(
                            first_name: firstNameController.text,
                            last_name: lastNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirm_password: confirmPasswordController.text,
                            gender: "Male",
                            phone_no: phoneNoController.text,
                          );
                          return CustomButton(
                              navigation: () =>
                                  BlocProvider.of<RegisterCubit>(context)
                                      .checkRegisterButton(
                                    registrationFormKey,
                                    context,
                                    registrationModel,
                                  ),
                              text: "REGISTER",
                              textColor: Colors.red,
                              backgroundColor: Colors.white);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
