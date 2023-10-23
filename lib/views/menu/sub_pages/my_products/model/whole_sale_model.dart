import 'package:flutter/material.dart';

class WholeSaleModel {
  final String? country;
  final String? countryCode;
  final String? currency;
  final TextEditingController priceController;
  final TextEditingController quantityController;

  WholeSaleModel({
    this.country,
    this.countryCode,
    this.currency,
    required this.priceController,
    required this.quantityController,
  });

  WholeSaleModel copyWith({
    String? country,
    String? countryCode,
    String? currency,
    TextEditingController? priceController,
    TextEditingController? quantityController,
  }) {
    return WholeSaleModel(
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      currency: currency ?? this.currency,
      priceController: priceController ?? this.priceController,
      quantityController: quantityController ?? this.quantityController,
    );
  }
}
