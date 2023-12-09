part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class ItemIsAdded extends CartState {
  final String productName;
  final double prodPrice;
  final Color prodColor;
  final bool isAdd;

  ItemIsAdded({required this.productName, required this.prodPrice, required this.prodColor
  , required this.isAdd});


}
class ItemIsDelete extends CartState {

}
