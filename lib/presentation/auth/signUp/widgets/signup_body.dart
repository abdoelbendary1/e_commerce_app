import 'package:e_commerce_app/presentation/utils/constants.dart';
import 'package:e_commerce_app/presentation/utils/custom_button.dart';
import 'package:e_commerce_app/presentation/utils/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatefulWidget {
  SignUpBody({
    super.key,
    required this.formKey,
    required this.fullnameController,
    required this.mobileNoController,
    required this.emailController,
    required this.passwordController,
    required this.confirPasswordController,
    required this.buttonFunction,
    this.isObsecure = true,
  });
  late GlobalKey formKey;
  late TextEditingController fullnameController;
  late TextEditingController mobileNoController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirPasswordController;
  late void Function()? buttonFunction;
  late bool isObsecure;

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //logo
          Padding(
            padding: EdgeInsets.only(
                top: 91.h, bottom: 20.h, left: 96.w, right: 96.w),
            child: Image.asset(AppAssets.logo),
          ),

          //text

          //form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: widget.formKey,
              child: Column(
                children: [
                  // Full name
                  CustomTextField(
                    controller: widget.fullnameController,
                    fieldName: "Full Name",
                    hintText: "enter your full name",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Full Name field is required";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  //mobile number
                  CustomTextField(
                    controller: widget.mobileNoController,
                    fieldName: "Mobile Number",
                    hintText: "enter your mobile no.",
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Full Name field is required";
                      }
                      bool phoneValid = RegExp(r"^[\d]{1,15}$").hasMatch(value);
                      if (!phoneValid) {
                        return "Mobile no. is not valid";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  //e-mail
                  CustomTextField(
                    controller: widget.emailController,
                    fieldName: "E-Mail",
                    hintText: "enter your e-mail",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "e-mail field is required";
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return "e-mail is not valid";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  //password
                  CustomTextField(
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          if (widget.isObsecure == true) {
                            widget.isObsecure = false;
                          } else {
                            widget.isObsecure = true;
                          }
                        });
                      },
                      child: Image.asset(widget.isObsecure
                          ? AppAssets.hidePass
                          : AppAssets.viewPass),
                    ),
                    controller: widget.passwordController,
                    obscure: widget.isObsecure,
                    fieldName: "Password",
                    hintText: "enter your password",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "password field is required";
                      }
                      if (value.length < 6 || value.length > 30) {
                        return "password must be more than 6 char and less than 30 char";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ), //re password
                  CustomTextField(
                    obscure: widget.isObsecure,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          if (widget.isObsecure == true) {
                            widget.isObsecure = false;
                          } else {
                            widget.isObsecure = true;
                          }
                        });
                      },
                      child: Image.asset(widget.isObsecure
                          ? AppAssets.hidePass
                          : AppAssets.viewPass),
                    ),
                    controller: widget.confirPasswordController,
                    fieldName: "Confirm password",
                    hintText: "enter your password",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "confirm password field is required";
                      }
                      if (value != widget.passwordController.text) {
                        return "confirm password is not identical";
                      }
                      if (value.length < 6 || value.length > 30) {
                        return "password must be more than 6 char and less than 30 char";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  // login button
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20.h,
                    ),
                    child: CustomButton(
                      buttonText: "Sign Up",
                      buttonFunction: widget.buttonFunction,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
