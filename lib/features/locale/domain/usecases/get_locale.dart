import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/locale/domain/entities/locale.dart';
import 'package:boiler/features/locale/domain/repositories/locale_repository.dart';
import 'package:dartz/dartz.dart';

class GetLocale implements UseCase<Locale, String> {
  final LocaleRepository repository;
  const GetLocale({required this.repository});
  @override
  Future<Either<Failure, Locale>> call(String uid)async {
    return repository.getLocale(uid);
  }
}
