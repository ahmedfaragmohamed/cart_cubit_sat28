import 'package:cart_cubit_sat28/cubits/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: BlocBuilder<CartCubit, CartState>(
  builder: (context, state) {

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*.80,
          child: ListView.builder(
              itemCount: context.watch<CartCubit>().listOfCartItem.length,
              itemBuilder: (context, index) {
                final productItem = context.watch<CartCubit>().listOfCartItem[index];
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: productItem.color,
                    ),
                    height: 40,
                    width: 40,
                  ),
                  title: Text(productItem.name),
                  subtitle: Text('\$${productItem.price}'),
                  trailing: TextButton(
                    child: Icon(Icons.delete),
                    onPressed: () {
                      context.read<CartCubit>().deleteToCart(productItem);
                      productItem.isAdd=false;
                      // setState(() {
                      //
                      // });
                    },
                  ),
                );
              },
            ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey,

                  borderRadius: BorderRadius.circular(20)),

              width: double.infinity,
              child: Center(child: Text("Total Price  :   ${context.watch<CartCubit>().total}",style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
                color: Colors.white

              ),)),
            ),
          ),
        ),
      ],
    );
  },
),
    );
  }
}
