import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_toko/ui/provider/product_provider.dart';
import 'package:uts_toko/ui/widgets/detail_list.dart';
//import 'package:uts_toko/ui/screens/pesanan.dart'; 

class MinumanList extends StatelessWidget {
  const MinumanList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    final products = provider.minuman;

    return SingleChildScrollView(
      child: Column(
        children: [
          // 🔹 LIST HORIZONTAL
          Container(
            height: 150,
            color: Colors.white,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 10 : 0,
                  right: index == products.length - 1 ? 10 : 0,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailList(
                          imagePath: products[index]["image"]!,
                          name: products[index]["name"]!,
                          price: products[index]["price"]!,
                          description: products[index]["deskripsi"]!,
                          category: products[index]["category"]!,
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      products[index]["image"]!,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  'Pesan :',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 🔹 LIST PRODUK VERTICAL
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final product = products[index];
              final qty = product["quantity"];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        product["image"]!,
                        width: 100,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product["name"]!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(product["deskripsi"]!,
                              style: const TextStyle(fontSize: 12)),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product["price"]!,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),

                              // 🔹 tombol + dan -
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      provider.decrement(index);
                                    },
                                    icon: const Icon(Icons.remove_circle_outline),
                                  ),
                                  Text(
                                    '$qty',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      provider.increment(index);
                                    },
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          // 🔹 Tombol ke halaman Pesanan
          // ElevatedButton.icon(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const PesananScreen(),
          //       ),
          //     );
          //   },
          //   icon: const Icon(Icons.shopping_cart),
          //   label: const Text("Lihat Pesanan"),
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.green,
          //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          //   ),
          // ),
          // const SizedBox(height: 20),
        ],
      ),
    );
  }
}
