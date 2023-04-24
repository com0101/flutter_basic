import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BatteryState extends Equatable {}

class BatteryLoadingState extends BatteryState {
  @override
  List<Object?> get props => [];
}

class BatterySuccessState extends BatteryState {
  final String level;
  BatterySuccessState(this.level);
  @override
  List<Object?> get props => [level];
}

class BatteryErrorState extends BatteryState {
  final String error;
  BatteryErrorState(this.error);
  @override
  List<Object?> get props => [error];
}