import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_toko/ui/provider/product_provider.dart';
import 'package:uts_toko/ui/widgets/dessert_list.dart';
import 'package:uts_toko/ui/widgets/minuman_list.dart';
import 'package:uts_toko/ui/widgets/makanan_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  TextEditingController searchController = TextEditingController();
  String keyword = "";

  void _autoSwitchCategory(String keyword) {
    final lower = keyword.toLowerCase();

    // Panggil provider
    final provider = context.read<ProductProvider>();

    // Cek kategori Minuman
    bool matchMinuman = provider.minuman.any((item) =>
        item["name"].toLowerCase().contains(lower) ||
        item["deskripsi"].toLowerCase().contains(lower));

    // Cek kategori Makanan
    bool matchMakanan = provider.makanan.any((item) =>
        item["name"].toLowerCase().contains(lower) ||
        item["deskripsi"].toLowerCase().contains(lower));

    // Cek kategori Dessert
    bool matchDessert = provider.dessert.any((item) =>
        item["name"].toLowerCase().contains(lower) ||
        item["deskripsi"].toLowerCase().contains(lower));

    // Jika keyword cocok kategori beda → pindah tab
    if (matchMinuman && selectedIndex != 0) {
      setState(() => selectedIndex = 0);
    } else if (matchMakanan && selectedIndex != 1) {
      setState(() => selectedIndex = 1);
    } else if (matchDessert && selectedIndex != 2) {
      setState(() => selectedIndex = 2);
    }
  }


  final List<String> textItems = [
    "Minuman",
    "Makanan",
    "Dessert",
  ];

  Widget _buildSelectedList() {
    switch (selectedIndex) {
      case 0:
        return MinumanList(keyword: keyword); // Makanan
      case 1:
        return MakananList(keyword: keyword); // Minuman
      case 2:
        return DessertList(keyword: keyword); // Dessert
      default:
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Belum ada data untuk kategori ini",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/borcelle.jpg',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'BORCELLE',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.call, size: 26, color: Colors.green),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                    ],
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        keyword = value.toLowerCase();
                      });

                      _autoSwitchCategory(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search, size: 20, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(top: 12),
                    ),
                  ),


                ),
              ),  

              Container(
                height: 80,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double itemWidth = constraints.maxWidth / textItems.length;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: textItems.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: itemWidth,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  textItems[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: selectedIndex == index ? Colors.green : Colors.black,
                                  ),
                                ),
                                if (selectedIndex == index)
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    height: 3,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              _buildSelectedList(),
            ],
          ),
        ),
      ),
    );
  }
}
