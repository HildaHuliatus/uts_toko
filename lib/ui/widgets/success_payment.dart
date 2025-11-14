import 'package:flutter/material.dart';
import 'package:uts_toko/ui/screens/struk_pembayaran.dart';

class SuccessPaymentScreen extends StatelessWidget {
  final List<Map<String, dynamic>> dataPembayaran;
  final int total;
  final String metode;

  const SuccessPaymentScreen({
    super.key,
    required this.dataPembayaran,
    required this.total,
    required this.metode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle,
                  color: Colors.white, size: 120),

              const SizedBox(height: 20),

              const Text(
                "Pembayaran Berhasil!",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),

              const SizedBox(height: 10),

              Text(
                "Metode: $metode",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),

              const SizedBox(height: 5),

              Text(
                "Total: Rp ${_formatRupiah(total)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => StrukPembayaranScreen(
                        data: dataPembayaran,
                        total: total,
                        metode: metode,
                      ),
                    ),
                  );
                },
                child: const Text("Lihat Struk"),
              ),
            ],
          ),
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
