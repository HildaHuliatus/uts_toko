import 'package:flutter/material.dart';
import 'package:movie/ui/widgets/minuman_list.dart';
import 'package:movie/ui/widgets/makanan_list.dart';
// import 'package:movie/ui/widgets/baju_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<String> textItems = [
    "Minuman",
    "Makanan",
    "Dessert",
  ];

  Widget _buildSelectedList() {
    switch (selectedIndex) {
      case 0:
        return const MinumanList(); // Makanan
      case 1:
        return const MakananList(); // Minuman
      // case 2:
      //   return const BajuList(); // Dessert
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
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: textItems.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                      child: Column(
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
                  ),
                  separatorBuilder: (context, index) => const SizedBox(width: 5),
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
