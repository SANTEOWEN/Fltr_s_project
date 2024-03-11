import 'package:get_it/get_it.dart';
import 'package:side_blog_app/core/secrets/app_secrets.dart';
import 'package:side_blog_app/features/auth/data/datasources/auth_remote_source.dart';
import 'package:side_blog_app/features/auth/data/repositries/auth_repository_impl.dart';
import 'package:side_blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:side_blog_app/features/auth/domain/usecases/user_login.dart';
import 'package:side_blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:side_blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initdependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserSignUp(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserLogin(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogin: serviceLocator(),
    ),
  );
}
