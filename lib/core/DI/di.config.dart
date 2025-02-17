// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/signup/data/remote/data_sources/dao_impl/signup_api_dao_impl.dart'
    as _i695;
import '../../features/signup/data/remote/data_sources/signup_dao.dart'
    as _i669;
import '../../features/signup/data/repositories/signup_repo_impl.dart' as _i991;
import '../../features/signup/domain/repositories/signup_repo.dart' as _i502;
import '../../features/signup/domain/use_cases/signup_usecase.dart' as _i25;
import '../../features/signup/presentation/manager/signup_view_model_cubit.dart'
    as _i326;
import '../network//api_manager.dart' as _i822;

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
    gh.singleton<_i822.ApiManager>(() => _i822.ApiManager());
    gh.factory<_i669.SignupDao>(
        () => _i695.SignupApiDaoImpl(gh<_i822.ApiManager>()));
    gh.factory<_i502.SignupRepo>(
        () => _i991.SignupRepoImpl(gh<_i669.SignupDao>()));
    gh.factory<_i25.SignupUseCase>(
        () => _i25.SignupUseCase(gh<_i502.SignupRepo>()));
    gh.factory<_i326.SignupViewModelCubit>(
        () => _i326.SignupViewModelCubit(gh<_i25.SignupUseCase>()));
    return this;
  }
}
