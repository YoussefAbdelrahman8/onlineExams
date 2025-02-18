import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/DI/di.dart';
import 'package:online_exam_app/core/utiles/Validator_manager.dart';
import 'package:online_exam_app/core/utiles/string_manager.dart';
import 'package:online_exam_app/core/routes_manager/routes.dart';
import 'package:online_exam_app/core/widget/custom_button.dart';
import 'package:online_exam_app/core/widget/toast_message.dart';
import 'package:online_exam_app/features/signup/presentation/manager/signup_view_model_cubit.dart';

import '../../../../core/widget/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  late TextEditingController userNameController;
  late TextEditingController firstNameController;

  late TextEditingController lastNameController;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  late TextEditingController confirmPasswordController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    userNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => getIt.get<SignupViewModelCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringManager.signup[Signup.signup]!),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                  secure: false,
                  validation: ValidatorManager.validateUsername,
                  controller: userNameController,
                  hint: StringManager.signup[Signup.enterUserName]!,
                  label: StringManager.signup[Signup.userName]!,
                ),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            label: StringManager.signup[Signup.firstName]!,
                            hint: StringManager.signup[Signup.enterFirstName]!,
                            controller: firstNameController,
                            validation: ValidatorManager.validateName,
                            secure: false)),
                    SizedBox(width: width * 0.06),
                    Expanded(
                        child: CustomTextField(
                            label: StringManager.signup[Signup.lastName]!,
                            hint: StringManager.signup[Signup.enterLastName]!,
                            controller: lastNameController,
                            validation: ValidatorManager.validateName,
                            secure: false)),
                  ],
                ),
                SizedBox(height: height * 0.03),
                CustomTextField(
                  secure: false,
                  validation: ValidatorManager.validateEmail,
                  controller: emailController,
                  hint: StringManager.signup[Signup.enterEmail]!,
                  label: StringManager.signup[Signup.email]!,
                ),
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: CustomTextField(
                            label: StringManager.signup[Signup.password]!,
                            hint: StringManager.signup[Signup.enterPassword]!,
                            controller: passwordController,
                            validation: ValidatorManager.validatePassword,
                            secure: false)),
                    SizedBox(
                      width: width * 0.06,
                    ),
                    Expanded(
                        child: CustomTextField(
                            label:
                                StringManager.signup[Signup.confirmPassword]!,
                            hint: StringManager.signup[Signup.confirmPassword]!,
                            controller: confirmPasswordController,
                            validation: validateConfirmPassword,
                            secure: false)),
                  ],
                ),
                SizedBox(height: height * 0.03),
                CustomTextField(
                  secure: false,
                  validation: ValidatorManager.validateUsername,
                  controller: phoneNumberController,
                  hint: StringManager.signup[Signup.enterPhoneNumber]!,
                  label: StringManager.signup[Signup.phoneNumber]!,
                ),
                SizedBox(height: height * 0.04),
                BlocConsumer<SignupViewModelCubit, SignupViewModelState>(
                  listener: (context, state) {
                    if (state is ErrorState) {
                      ToastMessage.toastMessage(state.error!);
                    }
                    if (state is SuccessState) {
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.homeScreenRoute);
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadingState) {
                      isLoading = true;
                    }
                    return CustomButton(
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              SignupViewModelCubit.get(context).signup(
                                username: userNameController.text,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phoneNumber: phoneNumberController.text,
                              );
                            }
                          });
                        },
                        isLoading: isLoading,
                        width: 343,
                        height: 48,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        content: StringManager.signup[Signup.signup]!,
                        contentColor: Theme.of(context).colorScheme.primary,
                        borderRadius: 100,
                        borderColor: Colors.transparent);
                  },
                ),
                SizedBox(height: height * 0.02),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(StringManager.signup[Signup.haveAnAccount]!,
                          style: Theme.of(context).textTheme.displayMedium),
                      GestureDetector(
                          onTap: () {},
                          child: Text("Login",
                              style: Theme.of(context).textTheme.labelMedium))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.validation[Validation.confirmPassReq];
    }
    if (value != passwordController.text) {
      return StringManager.validation[Validation.passNotMatched];
    }
    return null;
  }
}
