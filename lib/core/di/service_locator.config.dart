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
    as _i7;
import '../../features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i8;
import '../../features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i10;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i9;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i22;
import '../../features/auth/domain/repository/auth_repository.dart' as _i21;
import '../../features/auth/domain/use_cases/login.dart' as _i23;
import '../../features/auth/domain/use_cases/register.dart' as _i24;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i25;
import '../../features/cart/data/data%20source/cart_api_remote_data_source.dart'
    as _i6;
import '../../features/cart/data/data%20source/cart_remote_data_source.dart'
    as _i5;
import '../../features/cart/data/repository/cart_repository_impl.dart' as _i20;
import '../../features/cart/domain/repository/cart_repository.dart' as _i19;
import '../../features/cart/domain/use_cases/get_cart.dart' as _i29;
import '../../features/cart/presentation/cubit/cart_cubit.dart' as _i32;
import '../../features/home/data/data_source/home_api_remote_data_source.dart'
    as _i12;
import '../../features/home/data/data_source/home_remote_data_source.dart'
    as _i11;
import '../../features/home/data/repository/home_repository_impl.dart' as _i16;
import '../../features/home/domain/repository/home_repository.dart' as _i15;
import '../../features/home/domain/use_cases/get_brands.dart' as _i26;
import '../../features/home/domain/use_cases/get_categories.dart' as _i27;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i30;
import '../../features/products/data/data_source/products_api_remote_data_source.dart'
    as _i14;
import '../../features/products/data/data_source/products_remote_data_source.dart'
    as _i13;
import '../../features/products/data/repository/products_repository_impl.dart'
    as _i18;
import '../../features/products/domain/repository/products_repository.dart'
    as _i17;
import '../../features/products/domain/use_cases/get_products.dart' as _i28;
import '../../features/products/presentation/cubit/products_cubit.dart' as _i31;
import 'register_module.dart' as _i33;

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
    gh.lazySingleton<_i5.CartRemoteDataSource>(
        () => _i6.CartApiRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i7.AuthLocalDataSource>(
        () => _i8.AuthSharedPrefLocalDataSource());
    gh.singleton<_i9.AuthRemoteDataSource>(
        () => _i10.AuthAPIRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i11.HomeRemoteDataSource>(
        () => _i12.HomeApiRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i13.ProductsRemoteDataSource>(
        () => _i14.ProductsApiRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i15.HomeRepository>(
        () => _i16.HomeRepositoryImp(gh<_i11.HomeRemoteDataSource>()));
    gh.singleton<_i17.ProductsRepository>(
        () => _i18.ProductsRepositoryImpl(gh<_i13.ProductsRemoteDataSource>()));
    gh.singleton<_i19.CartRepository>(
        () => _i20.CartRepositoryImp(gh<_i5.CartRemoteDataSource>()));
    gh.singleton<_i21.AuthRepository>(() => _i22.AuthRepositoryImpl(
          gh<_i7.AuthLocalDataSource>(),
          gh<_i9.AuthRemoteDataSource>(),
        ));
    gh.singleton<_i23.Login>(() => _i23.Login(gh<_i21.AuthRepository>()));
    gh.singleton<_i24.Register>(() => _i24.Register(gh<_i21.AuthRepository>()));
    gh.singleton<_i25.AuthCubit>(() => _i25.AuthCubit(
          gh<_i23.Login>(),
          gh<_i24.Register>(),
        ));
    gh.singleton<_i26.GetBrands>(
        () => _i26.GetBrands(gh<_i15.HomeRepository>()));
    gh.singleton<_i27.GetCategories>(
        () => _i27.GetCategories(gh<_i15.HomeRepository>()));
    gh.singleton<_i28.GetProducts>(
        () => _i28.GetProducts(gh<_i17.ProductsRepository>()));
    gh.singleton<_i29.GetCart>(() => _i29.GetCart(gh<_i19.CartRepository>()));
    gh.factory<_i30.HomeCubit>(() => _i30.HomeCubit(
          gh<_i26.GetBrands>(),
          gh<_i27.GetCategories>(),
        ));
    gh.singleton<_i31.ProductsCubit>(
        () => _i31.ProductsCubit(gh<_i28.GetProducts>()));
    gh.singleton<_i32.CartCubit>(() => _i32.CartCubit(gh<_i29.GetCart>()));
    return this;
  }
}

class _$RegisterModule extends _i33.RegisterModule {}
