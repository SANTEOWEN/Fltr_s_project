
import 'package:fpdart/fpdart.dart';
import 'package:side_blog_app/core/error/failures.dart';
import 'package:side_blog_app/features/auth/domain/entities/user.dart';

//this auth_repository is the storage location for where data are stored and maintained
abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name, 
    required String email, 
    required String password,
  });

  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email, 
    required String password,
  });
}