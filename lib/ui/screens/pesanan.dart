import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_toko/ui/provider/product_provider.dart';
import 'package:uts_toko/ui/screens/main_screen.dart';

class PesananScreen extends StatelessWidget {
  const PesananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    TextEditingController catatanController = TextEditingController();


    // 🔹 Gabungkan pesanan makanan dan minuman
    final allOrders = [
      ...provider.orderedMakanan,
      ...provider.orderedMinuman,
      ...provider.orderedDessert,
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
          "Pesanan",
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

                      bool isMinuman =
                          provider.orderedMinuman.contains(item);

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
                                    } else if(isMinuman) {
                                      final i = provider.minuman.indexOf(item);
                                      provider.decrement(i);
                                    } else {
                                      final i = provider.dessert.indexOf(item);
                                      provider.decrement_dessert(i);
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
                                    } else if(isMinuman){
                                      final i = provider.minuman.indexOf(item);
                                      provider.increment(i);
                                    } else{
                                      final i = provider.dessert.indexOf(item);
                                      provider.increment_dessert(i);
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

                      // 🔹 Tambahkan Catatan Pesanan
                      TextField(
                        controller: catatanController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Tambah catatan (opsional)...",
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                _showCancelConfirmation(context);
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
                                _showPesanConfirmation(context);
                              },
                              icon: const Icon(Icons.payment_outlined),
                              label: const Text("Pesan Sekarang"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 106, 203, 84),
                                padding: const EdgeInsets.symmetric(vertical: 14),
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

  void _showCancelConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Konfirmasi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Apakah Anda yakin ingin membatalkan semua pesanan?",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tidak"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              Navigator.pop(context);
              context.read<ProductProvider>().clearOrders();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Semua pesanan berhasil dibatalkan"),
                ),
              );

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MainScreen()),
              );
            },
            child: const Text("Ya, Batalkan"),
          ),
        ],
      ),
    );
  }

  void _showPesanConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Konfirmasi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Apakah pesanan anda sudah sesuai?",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tidak"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              final provider = context.read<ProductProvider>();

              final semuaPesanan = [
                ...provider.orderedMakanan,
                ...provider.orderedMinuman,
                ...provider.orderedDessert
              ];
              provider.tambahRiwayatPembayaran(semuaPesanan);

              provider.clearOrders();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Semua pesanan sudah dipesankan.")),
              );

              Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreen(initialIndex: 2),
                                    ),
                                  );
            },

            child: const Text("Ya"),
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
