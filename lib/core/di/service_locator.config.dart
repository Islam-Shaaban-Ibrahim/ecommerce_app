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
    as _i9;
import '../../features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i10;
import '../../features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i12;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i11;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i29;
import '../../features/auth/domain/repository/auth_repository.dart' as _i28;
import '../../features/auth/domain/use_cases/login.dart' as _i30;
import '../../features/auth/domain/use_cases/register.dart' as _i31;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i35;
import '../../features/cart/data/data%20source/cart_api_remote_data_source.dart'
    as _i6;
import '../../features/cart/data/data%20source/cart_remote_data_source.dart'
    as _i5;
import '../../features/cart/data/repository/cart_repository_impl.dart' as _i27;
import '../../features/cart/domain/repository/cart_repository.dart' as _i26;
import '../../features/cart/domain/use_cases/add_to_cart.dart' as _i32;
import '../../features/cart/domain/use_cases/get_cart.dart' as _i40;
import '../../features/cart/domain/use_cases/remove_from_cart.dart' as _i34;
import '../../features/cart/domain/use_cases/update_cart.dart' as _i33;
import '../../features/cart/presentation/cubit/cart_cubit.dart' as _i41;
import '../../features/home/data/data_source/home_api_remote_data_source.dart'
    as _i14;
import '../../features/home/data/data_source/home_remote_data_source.dart'
    as _i13;
import '../../features/home/data/repository/home_repository_impl.dart' as _i18;
import '../../features/home/domain/repository/home_repository.dart' as _i17;
import '../../features/home/domain/use_cases/get_brands.dart' as _i36;
import '../../features/home/domain/use_cases/get_categories.dart' as _i37;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i42;
import '../../features/products/data/data_source/products_api_remote_data_source.dart'
    as _i16;
import '../../features/products/data/data_source/products_remote_data_source.dart'
    as _i15;
import '../../features/products/data/repository/products_repository_impl.dart'
    as _i22;
import '../../features/products/domain/repository/products_repository.dart'
    as _i21;
import '../../features/products/domain/use_cases/get_products.dart' as _i38;
import '../../features/products/presentation/cubit/products_cubit.dart' as _i43;
import '../../features/wishlist/data/data%20_source/wishlist_api_remote_data_source.dart'
    as _i8;
import '../../features/wishlist/data/data%20_source/wishlist_remote_data_source.dart'
    as _i7;
import '../../features/wishlist/data/repository/wishlist_repository_impl.dart'
    as _i20;
import '../../features/wishlist/domain/repository/wishlist_repository.dart'
    as _i19;
import '../../features/wishlist/domain/use_cases/add_to_wishlist.dart' as _i24;
import '../../features/wishlist/domain/use_cases/get_wishlist.dart' as _i23;
import '../../features/wishlist/domain/use_cases/remove_from_wishlist.dart'
    as _i25;
import '../../features/wishlist/presentation/cubit/wishlist_cubit.dart' as _i39;
import 'register_module.dart' as _i44;

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
    gh.singleton<_i7.WishlistRemoteDataSource>(
        () => _i8.WishlistApiRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i9.AuthLocalDataSource>(
        () => _i10.AuthSharedPrefLocalDataSource());
    gh.singleton<_i11.AuthRemoteDataSource>(
        () => _i12.AuthAPIRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i13.HomeRemoteDataSource>(
        () => _i14.HomeApiRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i15.ProductsRemoteDataSource>(
        () => _i16.ProductsApiRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i17.HomeRepository>(
        () => _i18.HomeRepositoryImp(gh<_i13.HomeRemoteDataSource>()));
    gh.singleton<_i19.WishlistRepository>(
        () => _i20.WishlistRepositoryImpl(gh<_i7.WishlistRemoteDataSource>()));
    gh.singleton<_i21.ProductsRepository>(
        () => _i22.ProductsRepositoryImpl(gh<_i15.ProductsRemoteDataSource>()));
    gh.singleton<_i23.GetWishlist>(
        () => _i23.GetWishlist(gh<_i19.WishlistRepository>()));
    gh.singleton<_i24.AddToWishlist>(
        () => _i24.AddToWishlist(gh<_i19.WishlistRepository>()));
    gh.singleton<_i25.RemoveFromWishlist>(
        () => _i25.RemoveFromWishlist(gh<_i19.WishlistRepository>()));
    gh.singleton<_i26.CartRepository>(
        () => _i27.CartRepositoryImp(gh<_i5.CartRemoteDataSource>()));
    gh.singleton<_i28.AuthRepository>(() => _i29.AuthRepositoryImpl(
          gh<_i9.AuthLocalDataSource>(),
          gh<_i11.AuthRemoteDataSource>(),
        ));
    gh.singleton<_i30.Login>(() => _i30.Login(gh<_i28.AuthRepository>()));
    gh.singleton<_i31.Register>(() => _i31.Register(gh<_i28.AuthRepository>()));
    gh.singleton<_i32.AddToCart>(
        () => _i32.AddToCart(gh<_i26.CartRepository>()));
    gh.singleton<_i33.UpdateCart>(
        () => _i33.UpdateCart(gh<_i26.CartRepository>()));
    gh.singleton<_i34.RemoveFromCart>(
        () => _i34.RemoveFromCart(gh<_i26.CartRepository>()));
    gh.singleton<_i35.AuthCubit>(() => _i35.AuthCubit(
          gh<_i30.Login>(),
          gh<_i31.Register>(),
        ));
    gh.singleton<_i36.GetBrands>(
        () => _i36.GetBrands(gh<_i17.HomeRepository>()));
    gh.singleton<_i37.GetCategories>(
        () => _i37.GetCategories(gh<_i17.HomeRepository>()));
    gh.singleton<_i38.GetProducts>(
        () => _i38.GetProducts(gh<_i21.ProductsRepository>()));
    gh.factory<_i39.WishlistCubit>(() => _i39.WishlistCubit(
          gh<_i23.GetWishlist>(),
          gh<_i24.AddToWishlist>(),
          gh<_i25.RemoveFromWishlist>(),
        ));
    gh.singleton<_i40.GetCart>(() => _i40.GetCart(gh<_i26.CartRepository>()));
    gh.factory<_i41.CartCubit>(() => _i41.CartCubit(
          gh<_i40.GetCart>(),
          gh<_i32.AddToCart>(),
          gh<_i33.UpdateCart>(),
          gh<_i34.RemoveFromCart>(),
        ));
    gh.singleton<_i42.HomeCubit>(() => _i42.HomeCubit(
          gh<_i36.GetBrands>(),
          gh<_i37.GetCategories>(),
        ));
    gh.singleton<_i43.ProductsCubit>(
        () => _i43.ProductsCubit(gh<_i38.GetProducts>()));
    return this;
  }
}

class _$RegisterModule extends _i44.RegisterModule {}
