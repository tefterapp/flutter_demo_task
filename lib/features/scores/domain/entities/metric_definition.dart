import 'package:equatable/equatable.dart';

class MetricDefinition extends Equatable {
  const MetricDefinition({
    required this.key,
    required this.title,
    required this.description,
  });

  final String key;
  final String title;
  final String description;

  @override
  List<Object?> get props => [key, title, description];
}
