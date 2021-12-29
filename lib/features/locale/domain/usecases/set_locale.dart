import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/locale/domain/entities/locale.dart';
import 'package:boiler/features/locale/domain/repositories/locale_repository.dart';
import 'package:dartz/dartz.dart';

class SetLocale implements UseCase<Locale,Locale>{
  final LocaleRepository repository;
  const SetLocale({required this.repository});
  @override
  Future<Either<Failure, Locale>> call(Locale params) {
    return repository.setLocale(params);
  }
}