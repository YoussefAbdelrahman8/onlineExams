import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utiles/color_manager.dart';
import 'package:online_exam_app/core/widget/toast_message.dart';
import 'package:online_exam_app/features/forget_password/presentation/manager/verification_view_model/verification_view_model_cubit.dart';
import 'package:online_exam_app/features/forget_password/presentation/widgets/pin_code_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/DI/di.dart';
import '../../../../../core/utiles/string_manager.dart';
import '../../manager/send_email_view_model/forgetpassword_email_sent_view_model_cubit.dart';

class VerificationPart extends StatefulWidget {
  Function(String?) switchTabs;
  String email;

  VerificationPart({super.key, required this.switchTabs, required this.email});

  @override
  State<VerificationPart> createState() => _VerificationPartState();
}

class _VerificationPartState extends State<VerificationPart> {
  late TextEditingController otpController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt.get<VerificationViewModelCubit>()),
        BlocProvider(
            create: (context) =>
                getIt.get<ForgetPasswordEmailSentViewModelCubit>()),
      ],
      child:
          BlocConsumer<VerificationViewModelCubit, VerificationViewModelState>(
        listener: (context, state) {
          if (state is VerificationViewModelSuccessState) {
            widget.switchTabs(widget.email);
          }
          if (state is VerificationViewModelErrorState) {
            ToastMessage.toastMessage(state.error!);
            if (state is VerificationViewModelLoadingState) {
              ToastMessage.toastMessage("Loading......");
            }
          }
        },
        builder: (context, state) {
          bool isError = state is VerificationViewModelErrorState;
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.02),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    StringManager
                        .forgetPassword[ForgetPassword.emailVerification]!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: height * 0.03),
                  Text(
                    StringManager.forgetPassword[ForgetPassword.enterCode]!,
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.03),
                  PinCodeWidget(
                    isError: isError,
                    otpController: otpController,
                    formKey: _formKey,
                    onComplete: (value) {
                      VerificationViewModelCubit.get(context)
                          .verify(resetCode: otpController.text);
                      print(otpController.text);
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          StringManager
                              .forgetPassword[ForgetPassword.dontReceive]!,
                          style: Theme.of(context).textTheme.displayMedium),
                      BlocConsumer<ForgetPasswordEmailSentViewModelCubit,
                          ForgetPasswordEmailSentViewModelState>(
                        listener: (context, state) {
                          if (state is ForgetPasswordEmailSentSuccessState) {}
                          if (state is ForgetPasswordEmailSentErrorState) {
                            ToastMessage.toastMessage(state.error!);
                          }
                        },
                        builder: (context, state) {
                          return GestureDetector(
                              onTap: () {
                                ForgetPasswordEmailSentViewModelCubit.get(
                                        context)
                                    .senEmail(email: widget.email);

                                otpController.clear();
                              },
                              // Implement resend functionality here
                              child: Text(
                                  StringManager
                                      .forgetPassword[ForgetPassword.resend]!,
                                  style:
                                      Theme.of(context).textTheme.labelMedium));
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}
