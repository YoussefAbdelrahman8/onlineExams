import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utiles/color_manager.dart';
import 'package:online_exam_app/features/forget_password/presentation/pages/forget_password_screen.dart';

import '../../../../../core/DI/di.dart';
import '../../../../../core/utiles/Validator_manager.dart';
import '../../../../../core/utiles/string_manager.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../core/widget/custom_text_field.dart';
import '../../../../../core/widget/toast_message.dart';
import '../../manager/send_email_view_model/forgetpassword_email_sent_view_model_cubit.dart';

class SendEmailPart extends StatefulWidget {
  Function(String?) switchTabs;
   SendEmailPart({super.key,required this.switchTabs});

  @override
  State<SendEmailPart> createState() => _SendEmailPartState();
}

class _SendEmailPartState extends State<SendEmailPart> {
  final _formKey = GlobalKey<FormState>();
  bool isButtonEnabled = true;
  bool isLoading = false;
  late TextEditingController emailController;


  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
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
      create: (context) => getIt.get<ForgetPasswordEmailSentViewModelCubit>(),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.02),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                StringManager.forgetPassword[ForgetPassword.forgetPassword]!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: height * 0.03),
              Text(
                StringManager
                    .forgetPassword[ForgetPassword.pleaseEnterUrEmail]!,
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.03),
              Form(
                key: _formKey,
                child: CustomTextField(
                  onChanged: (value) {
                    validate();
                  },
                  label: StringManager.signup[Signup.email]!,
                  hint: StringManager.signup[Signup.enterEmail]!,
                  controller: emailController,
                  validation: ValidatorManager.validateEmail,
                  secure: false,
                ),
              ),
              SizedBox(height: height * 0.05),
              BlocConsumer<ForgetPasswordEmailSentViewModelCubit,
                  ForgetPasswordEmailSentViewModelState>(
                listener: (context, state) {
                  if (state is ForgetPasswordEmailSentSuccessState) {
                    isLoading = false;
                    widget.switchTabs(emailController.text);

                  }
                  if (state is ForgetPasswordEmailSentErrorState) {
                    ToastMessage.toastMessage(state.error!);
                    isLoading = false;
                  }
                },
                builder: (context, state) {
                  if (state is ForgetPasswordEmailSentLoadingState) {
                    isLoading = true;
                  }
                  return CustomButton(
                      onPressed: () {
                        if (isButtonEnabled) {
                          ForgetPasswordEmailSentViewModelCubit.get(context)
                              .senEmail(email: emailController.text);
                        }
                      },
                      width: 343,
                      height: 48,
                      backgroundColor: isButtonEnabled
                          ? Theme.of(context).colorScheme.secondary
                          : ColorManager.black[30]!,
                      content: StringManager
                          .forgetPassword[ForgetPassword.coontinue]!,
                      contentColor: Theme.of(context).colorScheme.primary,
                      borderRadius: 100,
                      borderColor: Colors.transparent,
                      isLoading: isLoading);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
