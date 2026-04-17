import 'package:equatable/equatable.dart';

// A null [value] marks a gap on the chart (sample exists, no reading).
class ScorePoint extends Equatable {
  const ScorePoint({required this.date, this.value});

  final DateTime date;
  final double? value;

  @override
  List<Object?> get props => [date, value];
}
