import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/sign_up_repository_entitiy/sign_up_repository_entitiy.dart';

abstract class AuthRepository {
  Future<Either<Failures, SignUpRepositoryEntitiy>> signUp(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}
