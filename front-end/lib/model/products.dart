import 'package:flutter/material.dart';

class Product {
  final String image, name;
  final int price, id, price_promo;

  Product({
    required this.name,
    required this.id,
    required this.image,
    required this.price,
    required this.price_promo,
  });
}

List<Product> products = [
  Product(
      id: 1,
      price: 234,
      image: "images/chevale.jpg",
      price_promo: -5,
      name: "Peluche chevale"),
  Product(
    id: 2,
    price: 234,
    image: "images/chemise.jpg",
    price_promo: -10,
    name: '',
  ),
  Product(
    id: 3,
    price: 234,
    image: "images/pantallon.jpg",
    price_promo: -2,
    name: '',
  ),
  Product(
    id: 4,
    price: 234,
    image: "images/tel.jpg",
    price_promo: -3,
    name: '',
  ),
];
