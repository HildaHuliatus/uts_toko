import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_toko/ui/screens/pesanan.dart';
import 'package:uts_toko/ui/screens/pembayaran.dart';
import 'package:uts_toko/ui/screens/home_screen.dart';
import 'package:uts_toko/ui/provider/product_provider.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  static const List<Widget> _screens = [
    HomeScreen(),
    PesananScreen(),
    PembayaranScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 🔹 Ambil total pesanan gabungan dari provider
    final provider = context.watch<ProductProvider>();

    int totalMinuman = provider.orderedMinuman.fold<int>(
      0,
      (sum, item) => sum + (item["quantity"] as int),
    );

    int totalMakanan = provider.orderedMakanan.fold<int>(
      0,
      (sum, item) => sum + (item["quantity"] as int),
    );

    int totalDessert = provider.orderedDessert.fold<int>(
      0,
      (sum, item) => sum + (item["quantity"] as int),
    );

    int totalPesanan = totalMinuman + totalMakanan + totalDessert;

    return Scaffold(
      body: _screens.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),

          // 🔹 Bottom nav item Pesanan dengan badge
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart),

                // 🔸 Badge jumlah pesanan gabungan
                if (totalPesanan > 0)
                  Positioned(
                    right: -6,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Text(
                        '$totalPesanan',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Pesanan',
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pembayaran',
          ),
        ],
        backgroundColor: Colors.green,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
