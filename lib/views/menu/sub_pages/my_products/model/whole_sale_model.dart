// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WholeSaleModel {
  final String? country;
  final String? countryCode;
  final String? currency;
  final TextEditingController priceController;
  final TextEditingController quantityController;
  String type;

  WholeSaleModel({
    this.country,
    this.countryCode,
    this.currency,
    required this.priceController,
    required this.quantityController,
    required this.type,
  });

  WholeSaleModel copyWith({
    String? country,
    String? countryCode,
    String? currency,
    TextEditingController? priceController,
    TextEditingController? quantityController,
    String? type,
  }) {
    return WholeSaleModel(
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      currency: currency ?? this.currency,
      priceController: priceController ?? this.priceController,
      quantityController: quantityController ?? this.quantityController,
      type: type ?? this.type,
    );
  }
}
