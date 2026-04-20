import 'package:equatable/equatable.dart';

class MetricPoint extends Equatable {
  const MetricPoint({required this.date, this.value});

  final DateTime date;
  final double? value;

  @override
  List<Object?> get props => [date, value];
}
