import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/DI/di.dart';
import 'package:online_exam_app/core/routes_manager/routes.dart';
import 'package:online_exam_app/core/utiles/Validator_manager.dart';
import 'package:online_exam_app/core/utiles/string_manager.dart';
import 'package:online_exam_app/features/login/presentation/manager/login_view_model_cubit.dart';

import '../../../../core/cache/shared_pref.dart';
import '../../../../core/utiles/color_manager.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../../core/widget/toast_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _token;
  bool isChecked = false;
  bool isButtonEnabled = true;
  bool isLoading = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose;
    passwordController.dispose;
    super.dispose();
  }

  void validate() {
    setState(() {
      isButtonEnabled = _formKey.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => getIt.get<LoginViewModelCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringManager.login[Login.login]!),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                    onChanged: (value) => validate(),
                    label: StringManager.signup[Signup.email]!,
                    hint: StringManager.signup[Signup.enterEmail]!,
                    controller: emailController,
                    validation: ValidatorManager.validateEmail,
                    secure: false),
                SizedBox(height: height * 0.03),
                CustomTextField(
                    onChanged: (value) => validate(),
                    label: StringManager.signup[Signup.password]!,
                    hint: StringManager.signup[Signup.enterPassword]!,
                    controller: passwordController,
                    validation: ValidatorManager.validatePassword,
                    secure: true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                          fillColor: WidgetStatePropertyAll(isChecked
                              ? ColorManager.lightOnSecondary
                              : ColorManager.lightPrimaryColor),
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                            SharedPref.setToken(_token);
                          },
                        ),
                        Text(
                          StringManager.login[Login.rememberMe]!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Text(
                        StringManager.login[Login.forgetPass]!,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(Routes.forgetPasswordScreenRoute);
                      },
                    )
                  ],
                ),
                SizedBox(height: height * 0.04),
                BlocConsumer<LoginViewModelCubit, LoginViewModelState>(
                  listener: (context, state) {
                    if (state is LoginViewModelErrorState) {
                      ToastMessage.toastMessage(state.error);
                    }
                    if (state is LoginViewModelSuccessState) {
                      _token = state.loginEntity.token!;
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.homeScreenRoute);
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginViewModelErrorState) {
                      isLoading = false;
                    }
                    if (state is LoginViewModelLoadingState) {
                      isLoading = true;
                    }
                    return CustomButton(
                        onPressed: () {
                          if (isButtonEnabled) {
                            LoginViewModelCubit.get(context).login(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        isLoading: isLoading,
                        width: 343,
                        height: 48,
                        backgroundColor: isButtonEnabled
                            ? Theme.of(context).colorScheme.secondary
                            : ColorManager.black[30]!,
                        content: StringManager.login[Login.login]!,
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
                      Text(StringManager.login[Login.dontHaveAcc]!,
                          style: Theme.of(context).textTheme.displayMedium),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.signUpScreenRoute);
                          },
                          child: Text(StringManager.signup[Signup.signup]!,
                              style: Theme.of(context).textTheme.labelMedium))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
