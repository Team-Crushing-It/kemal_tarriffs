import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable

/// our tariff model
class Tariff extends Equatable {
  /// {@macro todo}
  Tariff({
    String? id,
    required this.ageCondition,
    required this.additionalInfo,
    required this.price,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  /// The unique identifier of the todo.
  ///
  /// Cannot be empty.
  final String id;

  /// The age condition for the tariff
  ///
  /// Cannot be empty
  final String ageCondition;

  /// Additional info for the tariff
  ///
  /// Can be empty
  final String additionalInfo;

  /// The associated cost
  ///
  final int price;

  /// fromJson method
  static Tariff fromJson(Map<String, dynamic> json) => Tariff(
        id: json['id'] as String?,
        ageCondition: json['ageCondition'] as String,
        additionalInfo: json['additionalInfo'] as String,
        price: json['price'] as int,
      );

  /// toJson Method
  Map<String, dynamic> toJson() => <String, dynamic>{
        'ageCondition': ageCondition,
        'additionalInfo': additionalInfo,
        'price': price,
      };

  @override
  List<Object> get props => [id, ageCondition, additionalInfo, price];

  ///copy with method
  Tariff copyWith({
    String? id,
    String? ageCondition,
    String? additionalInfo,
    int? price,
  }) {
    return Tariff(
      id: id ?? this.id,
      ageCondition: ageCondition ?? this.ageCondition,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      price: price ?? this.price,
    );
  }
}
