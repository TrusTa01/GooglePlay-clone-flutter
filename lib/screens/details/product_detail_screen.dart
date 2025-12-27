// import 'package:flutter/material.dart';

// import '/models/product_interface.dart';
// import '/widgets/widgets.dart';
// import '/screens/screens.dart';
// import '/models/product_models/game_model.dart';
// import '/models/product_models/app_model.dart';
// import '/models/product_models/book_model.dart';

// class ProductDetailScreen extends StatelessWidget {
//   const ProductDetailScreen({super.key, required this.product});

//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:flutter/material.dart';
import '../../models/product_models/product_interface.dart';
import '../../widgets/widgets.dart';
import '../../models/product_models/game_model.dart'; // Импортируем, чтобы проверить тип

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        type: AppBarType.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: const Color.fromARGB(255, 68, 68, 68),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Секция 1: основная информация (Main Data)
            _buildMainHeader(product),

            // Секция 2: специфические данные (Secondary/Typed Data) 
            if (product is Game) _buildGameDetails(product as Game),

            // Секция 3: описание (у всех разное)
            _buildDescription(product),
          ],
        ),
      ),
    );
  }

  Widget _buildMainHeader(Product p) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(p.iconUrl, width: 80, height: 80),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  p.creator,
                  style: const TextStyle(color: Colors.green, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameDetails(Game game) {
    // Здесь мы выводим данные, которые есть только у игр
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatColumn(
            "${game.rating} ★",
            "${game.downloadCount} скачиваний",
          ),
          _buildStatColumn("${game.ageRating}+", "Возраст"),
          _buildStatColumn(game.size, "Размер"),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String top, String bottom) {
    return Column(
      children: [
        Text(top, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(bottom, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildDescription(Product p) {
    // В интерфейсе Product нет поля description, но оно есть в реализациях.
    // Можно привести тип или добавить description в сам интерфейс Product.
    String desc = "";
    if (p is Game) desc = p.description;

    return Padding(padding: const EdgeInsets.all(16.0), child: Text(desc));
  }
}
