// ignore_for_file: public_member_api_docs, sort_constructors_first, implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:side_blog_app/core/error/failures.dart';
import 'package:side_blog_app/core/usecase/usecase.dart';
import 'package:side_blog_app/features/auth/domain/entities/user.dart';
import 'package:side_blog_app/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {

  //Here we directly Contacting the AuthoRepository interface.
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(params) async{
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

//we class that holds the parameters of the cridentials
class UserSignUpParams {
  final String email;
  final String password;
  final String name;
  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
