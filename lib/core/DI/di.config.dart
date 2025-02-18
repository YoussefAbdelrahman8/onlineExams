// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/forget_password/data/data_sources/dao_impl/forget_pass_api_dao_impl.dart'
    as _i213;
import '../../features/forget_password/data/data_sources/dao_impl/reset_password_api_dao_impl.dart'
    as _i912;
import '../../features/forget_password/data/data_sources/dao_impl/verify_reset_code_api_dao_impl.dart'
    as _i680;
import '../../features/forget_password/data/data_sources/forget_pass_dao.dart'
    as _i545;
import '../../features/forget_password/data/data_sources/reset_pass_dao.dart'
    as _i907;
import '../../features/forget_password/data/data_sources/verify_reset_code_dao.dart'
    as _i785;
import '../../features/forget_password/data/repositories/forget_pass_repo_impl.dart'
    as _i825;
import '../../features/forget_password/data/repositories/reset_password_repo_impl.dart'
    as _i196;
import '../../features/forget_password/data/repositories/verify_reset_code_repo_impl.dart'
    as _i553;
import '../../features/forget_password/domain/repositories/forget_pass_repo.dart'
    as _i38;
import '../../features/forget_password/domain/repositories/reset_pass_repo.dart'
    as _i1019;
import '../../features/forget_password/domain/repositories/verify_reset_code_repo.dart'
    as _i642;
import '../../features/forget_password/domain/use_cases/forget_pass_usecase.dart'
    as _i308;
import '../../features/forget_password/domain/use_cases/reset_pass_usecase.dart'
    as _i826;
import '../../features/forget_password/domain/use_cases/verify_reset_code_usecase.dart'
    as _i43;
import '../../features/forget_password/presentation/manager/send_email_view_model/forgetpassword_email_sent_view_model_cubit.dart'
    as _i653;
import '../../features/signup/data/remote/data_sources/dao_impl/signup_api_dao_impl.dart'
    as _i695;
import '../../features/signup/data/remote/data_sources/signup_dao.dart'
    as _i669;
import '../../features/signup/data/repositories/signup_repo_impl.dart' as _i991;
import '../../features/signup/domain/repositories/signup_repo.dart' as _i502;
import '../../features/signup/domain/use_cases/signup_usecase.dart' as _i25;
import '../../features/signup/presentation/manager/signup_view_model_cubit.dart'
    as _i326;
import '../network/api_manager.dart' as _i119;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i119.ApiManager>(() => _i119.ApiManager());
    gh.factory<_i907.ResetPasswordDao>(
        () => _i912.ResetPasswordApiDaoImpl(gh<_i119.ApiManager>()));
    gh.factory<_i669.SignupDao>(
        () => _i695.SignupApiDaoImpl(gh<_i119.ApiManager>()));
    gh.factory<_i785.VerifyResetCodeDao>(
        () => _i680.VerifyResetCodeApiDaoImpl(gh<_i119.ApiManager>()));
    gh.factory<_i1019.ResetPasswordRepo>(
        () => _i196.ResetPasswordRepoImpl(gh<_i907.ResetPasswordDao>()));
    gh.factory<_i545.ForgetPasswordDao>(
        () => _i213.ForgetPasswordApiDaoImpl(gh<_i119.ApiManager>()));
    gh.factory<_i826.ResetPasswordUseCase>(
        () => _i826.ResetPasswordUseCase(gh<_i1019.ResetPasswordRepo>()));
    gh.factory<_i642.VerifyResetCodeRepo>(
        () => _i553.VerifyResetCodeRepoImpl(gh<_i785.VerifyResetCodeDao>()));
    gh.factory<_i502.SignupRepo>(
        () => _i991.SignupRepoImpl(gh<_i669.SignupDao>()));
    gh.factory<_i38.ForgetPasswordRepo>(
        () => _i825.ForgetPasswordRepoImpl(gh<_i545.ForgetPasswordDao>()));
    gh.factory<_i308.ForgetPasswordUseCase>(
        () => _i308.ForgetPasswordUseCase(gh<_i38.ForgetPasswordRepo>()));
    gh.factory<_i43.VerifyResetCodeUseCase>(
        () => _i43.VerifyResetCodeUseCase(gh<_i642.VerifyResetCodeRepo>()));
    gh.factory<_i25.SignupUseCase>(
        () => _i25.SignupUseCase(gh<_i502.SignupRepo>()));
    gh.factory<_i653.ForgetPasswordEmailSentViewModelCubit>(() =>
        _i653.ForgetPasswordEmailSentViewModelCubit(
            gh<_i308.ForgetPasswordUseCase>()));
    gh.factory<_i326.SignupViewModelCubit>(
        () => _i326.SignupViewModelCubit(gh<_i25.SignupUseCase>()));
    return this;
  }
}
