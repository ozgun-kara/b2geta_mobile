import 'package:flutter/material.dart';

class RetailSaleModel {
  final String? country;
  final String? countryCode;
  final String? currency;
  final String quantity;
  final TextEditingController priceController;

  RetailSaleModel({
    this.country,
    this.countryCode,
    this.currency,
    required this.quantity,
    required this.priceController,
  });

  RetailSaleModel copyWith({
    String? country,
    String? countryCode,
    String? currency,
    String? quantity,
    TextEditingController? priceController,
  }) {
    return RetailSaleModel(
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      currency: currency ?? this.currency,
      quantity: quantity ?? this.quantity,
      priceController: priceController ?? this.priceController,
    );
  }
}
