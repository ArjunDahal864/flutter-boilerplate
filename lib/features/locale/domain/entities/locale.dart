import 'package:equatable/equatable.dart';

class Locale extends Equatable {
  final String languageCode;
  final String countryCode;
  final String userID;

  const Locale({required this.userID,required this.languageCode,required this.countryCode});
  @override
  List<Object?> get props => [userID,languageCode,countryCode];
}
