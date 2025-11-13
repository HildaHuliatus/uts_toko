import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie/ui/provider/product_provider.dart';
import 'package:movie/ui/screens/main_screen.dart';

class PesananScreen extends StatelessWidget {
  const PesananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    // 🔹 Gabungkan pesanan makanan dan minuman
    final allOrders = [
      ...provider.orderedMakanan,
      ...provider.orderedMinuman,
    ];

    // 🔹 Hitung total harga semua pesanan
    int totalHargaSemua = 0;
    for (var item in allOrders) {
      final harga = int.tryParse(item["price"]
              .toString()
              .replaceAll("Rp.", "")
              .replaceAll(".", "")
              .trim()) ??
          0;
      totalHargaSemua += harga * ((item["quantity"] ?? 0) as int);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Pesanan Saya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: 20,
            letterSpacing: 0.8,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 106, 203, 84),
        elevation: 3,
      ),
      body: allOrders.isEmpty
          ? const Center(
              child: Text(
                "Belum ada pesanan",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: allOrders.length,
                    itemBuilder: (context, index) {
                      final item = allOrders[index];
                      final hargaSatuan = int.tryParse(item["price"]
                              .toString()
                              .replaceAll("Rp.", "")
                              .replaceAll(".", "")
                              .trim()) ??
                          0;
                      final totalHarga =
                          hargaSatuan * (item["quantity"] as int);

                      // 🔹 Tentukan apakah item dari makanan atau minuman
                      bool isMakanan =
                          provider.orderedMakanan.contains(item);

                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item["image"]!,
                            width: 60,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          item["name"]!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Harga Satuan: ${item["price"]}"),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                IconButton(
                                  icon:
                                      const Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    if (isMakanan) {
                                      final i = provider.makanan.indexOf(item);
                                      provider.decrement_makanan(i);
                                    } else {
                                      final i = provider.minuman.indexOf(item);
                                      provider.decrement(i);
                                    }
                                  },
                                ),
                                Text(
                                  "${item["quantity"]}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon:
                                      const Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    if (isMakanan) {
                                      final i = provider.makanan.indexOf(item);
                                      provider.increment_makanan(i);
                                    } else {
                                      final i = provider.minuman.indexOf(item);
                                      provider.increment(i);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Text(
                          "Rp. ${_formatRupiah(totalHarga)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.green,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // 🔹 Bagian bawah: total + tombol aksi
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Pembayaran:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Rp. ${_formatRupiah(totalHargaSemua)}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                provider.clearOrders();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Semua pesanan berhasil dibatalkan")),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const MainScreen()),
                                );
                              },
                              icon: const Icon(Icons.delete_outline),
                              label: const Text("Batal Pesanan"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 230, 83, 83),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                _showMetodePembayaranDialog(
                                    context, totalHargaSemua);
                              },
                              icon: const Icon(Icons.payment_outlined),
                              label: const Text("Bayar Sekarang"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 106, 203, 84),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  // 🔹 Dialog pilih metode pembayaran
  void _showMetodePembayaranDialog(BuildContext context, int totalPembayaran) {
    String selectedMethod = "Cash"; // default cash

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
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
                  "Kartu Debit/Kredit"
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
                    backgroundColor:
                        const Color.fromARGB(255, 106, 203, 84)),
                onPressed: () {
                  Navigator.pop(context);
                  _showPaymentConfirmationDialog(
                      context, selectedMethod, totalPembayaran);
                },
                child: const Text("Lanjut"),
              ),
            ],
          );
        });
      },
    );
  }

  // 🔹 Dialog konfirmasi pembayaran
  void _showPaymentConfirmationDialog(
      BuildContext context, String metode, int totalPembayaran) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Konfirmasi Pembayaran",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black87, fontSize: 16),
            children: [
              const TextSpan(text: "Anda akan membayar sebesar "),
              TextSpan(
                text: "Rp. ${_formatRupiah(totalPembayaran)}",
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
                backgroundColor:
                    const Color.fromARGB(255, 106, 203, 84)),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        "Pembayaran berhasil menggunakan $metode. Terima kasih!")),
              );
              context.read<ProductProvider>().clearOrders();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MainScreen()),
              );
            },
            child: const Text("Bayar"),
          ),
        ],
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
