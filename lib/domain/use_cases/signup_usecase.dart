// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/sign_up_repository_entitiy/sign_up_repository_entitiy.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';

class SignUpUseCase {
  AuthRepository authRepository;
  SignUpUseCase({
    required this.authRepository,
  });
  Future<Either<Failures, SignUpRepositoryEntitiy>> invoke(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return authRepository.signUp(name, email, password, rePassword, phone);
  }
}
