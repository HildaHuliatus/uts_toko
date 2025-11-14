import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_toko/ui/provider/product_provider.dart';
import 'package:uts_toko/ui/screens/main_screen.dart';
import 'package:uts_toko/ui/widgets/success_payment.dart';

class PembayaranScreen extends StatelessWidget {
  const PembayaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    // 🔹 Gabungkan pesanan makanan dan minuman
    
    final pesanan = provider.riwayatPembayaran;

    // 🔹 Hitung total harga semua pesanan
    int totalHarga = 0;
    for (var item in pesanan) {
      final harga = int.tryParse(item["price"]
              .toString()
              .replaceAll("Rp.", "")
              .replaceAll(".", "")
              .trim()) ??
          0;
      totalHarga += harga * ((item["quantity"] ?? 0) as int);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pembayaran",
          style: TextStyle(
            fontWeight: FontWeight.w700, // lebih bold
            fontSize: 22,                // ukuran lebih besar
            color: Colors.white,         // kontras dengan hijau
            letterSpacing: 1,            // spasi antar huruf sedikit
            shadows: [
              Shadow(
                color: Colors.black26,   // tipis, agar ada efek depth
                offset: Offset(1, 1),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        centerTitle: true,              
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green, // lebih elegan
        elevation: 4, // shadow bawah AppBar
      ),


      body: pesanan.isEmpty
          ? const Center(
              child: Text(
                "Tidak ada pesanan untuk dibayar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: pesanan.length,
                      itemBuilder: (context, index) {
                        final item = pesanan[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: Image.asset(
                              item['image'],
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(item['name']),
                            subtitle: Text("Qty: ${item['quantity']}"),
                            trailing: Text(
                              "Rp ${item['price'] * item['quantity']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Total Harga
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Pembayaran",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rp ${_formatRupiah(totalHarga)}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Tombol bayar sekarang
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _showMetodePembayaranDialog(context, totalHarga);
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        "Bayar Sekarang",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Tombol Pesan Lagi
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const MainScreen()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Colors.green),
                      ),
                      child: const Text(
                        "Pesan Lagi",
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // 🔹 Dialog pilih metode pembayaran
void _showMetodePembayaranDialog(BuildContext context, int totalPembayaran) {
  String selectedMethod = "Cash"; // default

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text(
              "Pilih Metode Pembayaran",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var method in [
                  "Cash",
                  "QRIS",
                  "Transfer Bank",
                  "Kartu Debit/Kredit",
                ])
                  RadioListTile<String>(
                    title: Text(method),
                    value: method,
                    // ignore: deprecated_member_use
                    groupValue: selectedMethod,
                    // ignore: deprecated_member_use
                    onChanged: (value) {
                      setState(() => selectedMethod = value!);
                    },
                  ),
              ],
            ),
            actions: [
              TextButton(
                child: const Text("Batal"),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text("Lanjut"),
                onPressed: () {
                  Navigator.pop(context);
                  _showPaymentConfirmationDialog(
                    context,
                    selectedMethod,
                    totalPembayaran,
                  );
                },
              ),
            ],
          );
        },
      );
    },
  );
}

// 🔹 Dialog konfirmasi pembayaran
void _showPaymentConfirmationDialog(
  BuildContext context,
  String metode,
  int totalPembayaran,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          "Konfirmasi Pembayaran",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 16),
            children: [
              const TextSpan(text: "Anda akan membayar sebesar "),
              TextSpan(
                text: "Rp ${_formatRupiah(totalPembayaran)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: " menggunakan metode $metode."),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Batal"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text("Bayar"),
            onPressed: () {

              final provider = Provider.of<ProductProvider>(context, listen: false);

              // AMBIL SNAPSHOT SEBELUM DI-REPLACE
              final snapshotData = List<Map<String, dynamic>>.from(provider.riwayatPembayaran);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => SuccessPaymentScreen(
                    dataPembayaran: snapshotData,
                    total: totalPembayaran,
                    metode: metode,
                  ),
                ),
              );
            }

          ),
        ],
      );
    },
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
