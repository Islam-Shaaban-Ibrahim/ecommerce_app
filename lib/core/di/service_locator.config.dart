// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i5;
import '../../features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i6;
import '../../features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i8;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i7;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i18;
import '../../features/auth/domain/repository/auth_repository.dart' as _i17;
import '../../features/auth/domain/use_cases/login.dart' as _i19;
import '../../features/auth/domain/use_cases/register.dart' as _i20;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i21;
import '../../features/home/data/data_source/home_api_remote_data_source.dart'
    as _i10;
import '../../features/home/data/data_source/home_remote_data_source.dart'
    as _i9;
import '../../features/home/data/repository/home_repository_impl.dart' as _i14;
import '../../features/home/domain/repository/home_repository.dart' as _i13;
import '../../features/home/domain/use_cases/get_brands.dart' as _i23;
import '../../features/home/domain/use_cases/get_categories.dart' as _i22;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i25;
import '../../features/products/data/data_source/products_api_remote_data_source.dart'
    as _i12;
import '../../features/products/data/data_source/products_remote_data_source.dart'
    as _i11;
import '../../features/products/data/repository/products_repository_impl.dart'
    as _i16;
import '../../features/products/domain/repository/products_repository.dart'
    as _i15;
import '../../features/products/domain/use_cases/get_products.dart' as _i24;
import '../../features/products/presentation/cubit/products_cubit.dart' as _i26;
import 'register_module.dart' as _i27;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => registerModule.getPrefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i4.Dio>(() => registerModule.dio);
    gh.singleton<_i5.AuthLocalDataSource>(
        () => _i6.AuthSharedPrefLocalDataSource());
    gh.singleton<_i7.AuthRemoteDataSource>(
        () => _i8.AuthAPIRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i9.HomeRemoteDataSource>(
        () => _i10.HomeApiRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i11.ProductsRemoteDataSource>(
        () => _i12.ProductsApiRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i13.HomeRepository>(
        () => _i14.HomeRepositoryImp(gh<_i9.HomeRemoteDataSource>()));
    gh.singleton<_i15.ProductsRepository>(
        () => _i16.ProductsRepositoryImpl(gh<_i11.ProductsRemoteDataSource>()));
    gh.singleton<_i17.AuthRepository>(() => _i18.AuthRepositoryImpl(
          gh<_i5.AuthLocalDataSource>(),
          gh<_i7.AuthRemoteDataSource>(),
        ));
    gh.singleton<_i19.Login>(() => _i19.Login(gh<_i17.AuthRepository>()));
    gh.singleton<_i20.Register>(() => _i20.Register(gh<_i17.AuthRepository>()));
    gh.singleton<_i21.AuthCubit>(() => _i21.AuthCubit(
          gh<_i19.Login>(),
          gh<_i20.Register>(),
        ));
    gh.singleton<_i22.GetCategories>(
        () => _i22.GetCategories(gh<_i13.HomeRepository>()));
    gh.singleton<_i23.GetBrands>(
        () => _i23.GetBrands(gh<_i13.HomeRepository>()));
    gh.singleton<_i24.GetProducts>(
        () => _i24.GetProducts(gh<_i15.ProductsRepository>()));
    gh.factory<_i25.HomeCubit>(() => _i25.HomeCubit(
          gh<_i23.GetBrands>(),
          gh<_i22.GetCategories>(),
        ));
    gh.singleton<_i26.ProductsCubit>(
        () => _i26.ProductsCubit(gh<_i24.GetProducts>()));
    return this;
  }
}

class _$RegisterModule extends _i27.RegisterModule {}
