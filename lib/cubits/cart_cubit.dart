import 'package:bloc/bloc.dart';
import 'package:cart_cubit_sat28/models/product_item.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());


  final List<ProductItem> productList = [
    ProductItem(

        id: 1,
        color: const Color(0xFF3498db),
        name: 'Blue Shirt',
        price: 29.99, isAdd: false),

    ProductItem(
        id: 2,
        color: const Color(0xFFe74c3c),
        name: 'Red Sneakers',
        price: 49.99, isAdd: false),
    ProductItem(
        id: 3,
        color: const Color(0xFF2ecc71),
        name: 'Green Backpack',
        price: 39.99, isAdd: false),

    ProductItem(
        id: 4,
        color: const Color(0xFFf39c12),
        name: 'Yellow Sunglasses',
        price: 19.99, isAdd: false),
    ProductItem(
        id: 5,
        color: const Color(0xFF8e44ad),
        name: 'Purple Dress',
        price: 59.99, isAdd: false),
    ProductItem(
        id: 6,
        color: const Color(0xFFc0392b),
        name: 'Brown Boots',
        price: 69.99, isAdd: false),
    ProductItem(
        id: 7,
        color: const Color(0xFF27ae60),
        name: 'Emerald Earrings',
        price: 29.99, isAdd: false),
    ProductItem(
        id: 8,
        color: const Color(0xFFd35400),
        name: 'Orange Hat',
        price: 14.99, isAdd: false),
    ProductItem(
        id: 9,
        color: const Color(0xFF34495e),
        name: 'Gray Gloves',
        price: 9.99, isAdd: false),
    ProductItem(
        id: 10,
        color: const Color(0xFF95a5a6),
        name: 'Silver Watch',
        price: 79.99, isAdd: false),

  ];

  final List<ProductItem> listOfCartItem = [];

  bool isAdd = false;
  double total = 0;

  void addToCart(ProductItem item) {

    if(listOfCartItem.contains(item)) return;

    listOfCartItem.add(item);
    total += item.price;


    if(listOfCartItem.contains(item)) {
      item.isAdd=true;
      emit(ItemIsAdded(
        productName: item.name,
        prodColor: item.color,
        prodPrice: item.price,
        isAdd: item.isAdd
      ));
    }
  }
  void deleteToCart(ProductItem item) {
    //if(listOfCartItem.contains(item)) return;
    total -= item.price;


    listOfCartItem.remove(item);


    emit(ItemIsDelete());
  }

}
