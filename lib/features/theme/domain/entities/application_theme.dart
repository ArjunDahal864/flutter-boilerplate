import 'package:equatable/equatable.dart';

class ApplicationTheme extends Equatable {
  final String themeType;
  const ApplicationTheme({required this.themeType});

  @override
  List<Object> get props => [themeType];
}
