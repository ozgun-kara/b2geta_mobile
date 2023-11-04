// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RetailSaleModel {
  final String? country;
  final String? countryCode;
  final String? currency;
  final String quantity;
  final String type;
  final TextEditingController priceController;

  RetailSaleModel({
    this.country,
    this.countryCode,
    this.currency,
    required this.quantity,
    required this.type,
    required this.priceController,
  });

  RetailSaleModel copyWith({
    String? country,
    String? countryCode,
    String? currency,
    String? quantity,
    TextEditingController? priceController,
    String? type,
  }) {
    return RetailSaleModel(
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      currency: currency ?? this.currency,
      quantity: quantity ?? this.quantity,
      priceController: priceController ?? this.priceController,
      type: type ?? this.type,
    );
  }

  @override
  String toString() {
    return 'RetailSaleModel(country: $country, countryCode: $countryCode, currency: $currency, quantity: $quantity, type: $type, priceController: ${priceController.text})';
  }
}
