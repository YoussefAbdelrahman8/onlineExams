import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/DI/di.dart';
import 'package:online_exam_app/core/routes_manager/route_generator.dart';
import 'package:online_exam_app/core/utiles/color_manager.dart';

import '../../../../../core/routes_manager/routes.dart';
import '../../../../../core/utiles/Validator_manager.dart';
import '../../../../../core/utiles/string_manager.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../core/widget/custom_text_field.dart';
import '../../../../../core/widget/toast_message.dart';
import '../../manager/reset_pass_view_model/reset_pass_view_model_cubit.dart';

class ResetPasswordPart extends StatefulWidget {
  Function(String?) switchTabs;
  String email;

  ResetPasswordPart({super.key, required this.switchTabs, required this.email});

  @override
  State<ResetPasswordPart> createState() => _ResetPasswordPartState();
}

class _ResetPasswordPartState extends State<ResetPasswordPart> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();
  bool isButtonEnabled = true;
  bool isLoading = false;

  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
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
      create: (context) => getIt.get<ResetPassViewModelCubit>(),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.02),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringManager.forgetPassword[ForgetPassword.resetPass]!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: height * 0.03),
                Text(
                  StringManager.forgetPassword[ForgetPassword.passRules]!,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.03),
                CustomTextField(
                    onChanged: (value) => validate(),
                    label: StringManager.signup[Signup.password]!,
                    hint: StringManager.signup[Signup.enterPassword]!,
                    controller: passwordController,
                    validation: ValidatorManager.validatePassword,
                    secure: true),
                SizedBox(height: height * 0.03),
                CustomTextField(
                    onChanged: (value) => validate(),
                    label: StringManager.signup[Signup.confirmPassword]!,
                    hint: StringManager.signup[Signup.confirmPassword]!,
                    controller: confirmPasswordController,
                    validation: validateConfirmPassword,
                    secure: true),
                SizedBox(height: height * 0.05),
                BlocConsumer<ResetPassViewModelCubit, ResetPassViewModelState>(
                  listener: (context, state) {
                    if (state is ResetPassViewModeErrorState) {
                      ToastMessage.toastMessage("a7aa${state.error!}");
                    }
                    if (state is ResetPassViewModeSuccessState) {
                      Navigator.of(context).pushReplacementNamed(Routes.homeScreenRoute);
                    }
                  },
                  builder: (context, state) {
                    if (state is ResetPassViewModeErrorState ||
                        state is ResetPassViewModeSuccessState) {
                      isLoading = false;
                    }
                    if(state is ResetPassViewModeLoadingState){
                      isLoading = false;
                    }

                    return CustomButton(
                        onPressed: () {
                          if (isButtonEnabled) {
                            ResetPassViewModelCubit.get(context).reset(
                                email: widget.email,
                                newPassword: passwordController.text);
                          }
                        },
                        isLoading: isLoading,
                        width: 343,
                        height: 48,
                        backgroundColor: isButtonEnabled
                            ? Theme.of(context).colorScheme.secondary
                            : ColorManager.black[30]!,
                        content: StringManager
                            .forgetPassword[ForgetPassword.coontinue]!,
                        contentColor: Theme.of(context).colorScheme.primary,
                        borderRadius: 100,
                        borderColor: Colors.transparent);
                  },
                ),
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
