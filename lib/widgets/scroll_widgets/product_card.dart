import 'package:flutter/material.dart';

import '/models/product_interface.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.item});
  final Product item;

  // Логика для отображения цены или рейтинга
  String get _infoText {
    // Если платный и цена указана, показываем цену
    if (item.isPaid && item.price != null) {
      return item.price!;
    }
    // В противном случае показываем рейтинг
    return '${item.rating.toStringAsFixed(1)} ⭐';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(item.iconUrl), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),

          // Название
          Text(
            item.title,
            maxLines: 1, // Чтобы название не растягивало карточку
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14),
          ),
          
          // Рейтинг / Цена
          Text(
            _infoText,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}



// import '/widgets/widgets.dart';

// class ProductCard extends StatelessWidget {
//   final Product item;
//   late final rating = item.rating.toStringAsFixed(1) ;
//   ProductCard({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 10, right: 5),
//       width: 300,
//       height: 500,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.network(
//             'https://cdn-icons-png.flaticon.com/512/9029/9029931.png',
//             fit: BoxFit.cover,
//             width: 100,
//             height: 100,
//           ),
//           Text(
//             item.title,
//             style: TextStyle(fontWeight: FontWeight(600), fontSize: 12),
//           ),
//           SizedBox(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: Constants.ratingBackgroungColor,
//               ),
//               child: Text(rating)
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }