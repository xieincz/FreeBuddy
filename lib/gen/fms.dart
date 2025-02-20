import 'package:flutter/widgets.dart';

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: constant_identifier_names
@immutable
class _FmsData extends IconData {
  const _FmsData(int codePoint, this.name)
      : super(
          codePoint,
          fontFamily: 'Fms',
        );

  final String name;
}

@immutable
class Fms {
  const Fms._();

  static const noise_aware = _FmsData(0xf101, 'noise_aware');
  static const noise_control_off = _FmsData(0xf102, 'noise_control_off');
  static const noise_control_on = _FmsData(0xf103, 'noise_control_on');

  static const all = <String, _FmsData>{
    'noise_aware': noise_aware,
    'noise_control_off': noise_control_off,
    'noise_control_on': noise_control_on,
  };
}
