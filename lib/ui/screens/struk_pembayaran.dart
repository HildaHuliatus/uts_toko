import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uts_toko/ui/provider/product_provider.dart';
import 'package:uts_toko/ui/screens/main_screen.dart';

class StrukPembayaranScreen extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final int total;
  final String metode;

  const StrukPembayaranScreen({
    super.key,
    required this.data,
    required this.total,
    required this.metode,
  });

  @override
  Widget build(BuildContext context) {
    String tanggal =
        DateFormat("dd MMM yyyy, HH:mm").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Struk Pembayaran",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "BORCELLE RESTO",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(tanggal, style: const TextStyle(color: Colors.grey)),

            const Divider(height: 30, thickness: 1),

            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${item['name']} (x${item['quantity']})",
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Rp ${item['price'] * item['quantity']}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const Divider(height: 30, thickness: 1),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Pembayaran:",
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rp ${_formatRupiah(total)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final provider = context.read<ProductProvider>();
                  provider.clearRiwayatPembayaran();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MainScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Kembali ke Home",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Format angka ke format rupiah
  String _formatRupiah(int number) {
    String numStr = number.toString();
    String result = '';
    int count = 0;

    for (int i = numStr.length - 1; i >= 0; i--) {
      result = numStr[i] + result;
      count++;
      if (count == 3 && i != 0) {
        result = '.$result';
        count = 0;
      }
    }
    return result;
  }
}
