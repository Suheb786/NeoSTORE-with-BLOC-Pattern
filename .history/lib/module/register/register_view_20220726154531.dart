import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostorewithbloc/data/constants/components/text_editing_controllers.dart';
import 'package:neostorewithbloc/data/constants/validator.dart';
import 'package:neostorewithbloc/data/widgets/background_image.dart';
import 'package:neostorewithbloc/data/widgets/custom_appBar.dart';
import 'package:neostorewithbloc/data/widgets/custom_textfiled.dart';

import '../../data/constants/components/enum.dart';
import '../../data/widgets/custom_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextController controller = TextController();
  Validators validators = Validators();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "Register"),
      body: Stack(
        children: [
          BGimage(),
          Form(
            // key: controller.registrationFormKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("NeoSTORE",
                          style: Theme.of(context).textTheme.headline1),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelText: "First Name",
                        controller: controller.firstNameController,
                        validator: (fname) => validators.validFirstName(fname),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Last Name",
                        controller: controller.lastNameController,
                        validator: (lname) => validators.validLastName(lname),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Email",
                        controller: controller.emainController,
                        validator: (email) => validators.validEmail(email),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Password",
                        controller: controller.passwordController,
                        validator: (value) => validators.validpassword(value),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(
                        labelText: "Confirm Password",
                        controller: controller.confirmPasswordController,
                        validator: (cpass) =>
                            validators.validConfirmPassword(cpass),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gender",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          // CustomRadioButton(
                          //   title: "Male",
                          //   // groupValue: controller.genderType.value,
                          //   value: Gender.male,
                          //   onChanged: (val) {
                          //     controller.genderCheck();

                          //     controller.genderType.value = val as Gender;
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
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        // controller: controller.phoneNoController,
                        // validator: (phone) => controller.validPhoneNo(phone),
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
                                // onChanged: controller.toggleCheck,
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
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          navigation: () => BlocProvider.of<>(context),
                          text: "REGISTER",
                          textColor: Colors.red,
                          backgroundColor: Colors.white)
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
