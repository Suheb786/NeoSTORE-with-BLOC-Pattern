import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/components/enum.dart';
import '../../../data/components/text_editing_controllers.dart';

import '../../../data/components/validator.dart';
import '../../../data/widgets/background_image.dart';
import '../../../data/widgets/custom_appBar.dart';
import '../../../data/widgets/custom_textfiled.dart';
import '../cubit/register_cubit.dart';

import '../../../data/widgets/custom_button.dart';
import '../../../data/widgets/custom_radio_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextController controller = TextController();
  Validators validators = Validators();
  final registrationFormKey = GlobalKey<FormState>();
  var gendeerType = Gender.male;
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
                        controller: controller.firstNameController,
                        validator: (fname) => validators.validFirstName(fname),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Last Name",
                        controller: controller.lastNameController,
                        validator: (lname) => validators.validLastName(lname),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Email",
                        controller: controller.emailController,
                        validator: (email) => validators.validEmail(email),
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Password",
                        controller: controller.passwordController,
                        validator: (value) => validators.validpassword(value),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Confirm Password",
                        controller: controller.confirmPasswordController,
                        validator: (cpass) =>
                            validators.validConfirmPassword(cpass),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      BlocBuilder<RegisterCubit, RegisterState>(
                        builder: (context, state) {
                          return Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Gender",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              // CustomRadioButton(title: "Male", value: Gender.male, groupValue: genderType, onChanged: (val){})
                              // CustomRadioButton(
                              //   title: "Male",
                              //   groupValue: controller.genderType.value,
                              //   value: Gender.male,
                              //   onChanged: (val) {
                              //     validators.genderCheck(gendeerType);

                              //     gendeerType = val as Gender;
                              //   },
                              // ),
                              // CustomRadioButton(
                              //   title: "Female",
                              //   // groupValue: controller.genderType.value,
                              //   value: Gender.female,

                              //   // onChanged: (val) {
                              //   //   controller.genderCheck();

                              //   //   controller.genderType.value = val as Gender;
                              //   // },
                              // ),
                            ],
                          );
                        },
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        controller: controller.phoneNoController,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Transform.scale(
                              scale: 0.5,
                              child: Checkbox(
                                onChanged: (c) {},
                                value: false,
                                onChanged: validators.toggleCheck(check),
                                activeColor:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          Text(
                            "I agree the Terms & Condition",
                            style: Theme.of(context).textTheme.headline3,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<RegisterCubit, RegisterState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return CustomButton(
                              navigation: () =>
                                  BlocProvider.of<RegisterCubit>(context)
                                      .checkRegisterButton(
                                          registrationFormKey, context),
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
