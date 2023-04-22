import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BatteryEvent extends Equatable {
  const BatteryEvent();
}

class LoadBatteryEvent extends BatteryEvent {
  @override
  List<Object?> get props => [];
}