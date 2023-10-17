import 'package:bprcf/pages/dashboard/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(GetProductEvent()),
      child: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('product'),
        backgroundColor: Colors.indigo.shade800,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductSuccess) {
          return Center(
            child: Text('success'),
          );
        }
        return const Center(
          child: Text('No data'),
        );
      }),
    );
  }
}
