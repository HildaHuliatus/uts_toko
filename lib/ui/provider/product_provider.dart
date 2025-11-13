import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _minuman = [
    {
    "image": "assets/images/green_tea.jpg",
    "name": "Green Tea",
    "price": "Rp. 20000",
    "deskripsi":
        "Teh hijau alami dengan aroma lembut dan rasa yang menyegarkan. Dibuat dari daun teh pilihan yang kaya akan antioksidan, cocok untuk dinikmati hangat atau dingin di waktu santai.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/rose_tea.jpg",
    "name": "Rose Tea",
    "price": "Rp. 30000",
    "deskripsi":
        "Teh mawar premium dengan aroma bunga yang menenangkan dan rasa lembut yang khas. Cocok untuk relaksasi setelah aktivitas padat, memberikan sensasi tenang dan segar di setiap tegukan.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/jasmine_tea.jpg",
    "name": "Jasmine Tea",
    "price": "Rp. 15000",
    "deskripsi":
        "Teh melati harum dengan cita rasa khas Nusantara. Dipadukan dengan aroma melati yang lembut, memberikan keseimbangan antara rasa pahit teh dan wangi alami bunga melati.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/americano.jpg",
    "name": "Americano",
    "price": "Rp. 25000",
    "deskripsi":
        "Kopi hitam klasik hasil campuran espresso dan air panas dengan rasa yang kuat namun tetap halus di lidah. Cocok untuk penikmat kopi murni tanpa tambahan gula atau susu.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/cappuccino.jpg",
    "name": "Cappuccino",
    "price": "Rp. 25000",
    "deskripsi":
        "Perpaduan sempurna antara espresso, susu panas, dan busa susu yang lembut di atasnya. Memiliki rasa seimbang antara pahit dan manis, ideal untuk dinikmati di pagi atau sore hari.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/latte.jpg",
    "name": "Caffe Latte",
    "price": "Rp. 32000",
    "deskripsi":
        "Minuman espresso dengan campuran susu panas yang lembut dan creamy. Cocok bagi pecinta kopi dengan rasa ringan dan aroma susu yang menenangkan.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/mocha.jpg",
    "name": "Mocha",
    "price": "Rp. 30000",
    "deskripsi":
        "Kombinasi sempurna antara espresso, cokelat premium, dan susu panas. Menawarkan rasa manis dan sedikit pahit yang membuat setiap tegukan terasa memanjakan.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/macha_latte.jpg",
    "name": "Matcha Latte",
    "price": "Rp. 38000",
    "deskripsi":
        "Matcha Jepang asli yang dikombinasikan dengan susu segar, menghasilkan rasa manis lembut dan aroma khas teh hijau. Memberikan energi dan ketenangan dalam satu cangkir.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/caramel_macchiato.jpg",
    "name": "Caramel Macchiato",
    "price": "Rp. 40000",
    "deskripsi":
        "Espresso dengan susu panas dan sirup karamel manis yang menggoda. Setiap tegukan menghadirkan keseimbangan sempurna antara rasa kopi yang kuat dan aroma karamel yang lembut.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/ice_chocolate.jpg",
    "name": "Iced Chocolate",
    "price": "Rp. 20000",
    "deskripsi":
        "Minuman cokelat dingin dengan rasa creamy dan manis seimbang. Dihidangkan dengan es batu untuk sensasi menyegarkan, cocok untuk penggemar minuman non-kopi.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/vanilla_frappe.jpg",
    "name": "Vanilla Frappe",
    "price": "Rp. 32000",
    "deskripsi":
        "Frappe lembut berbahan dasar susu dan es yang dicampur dengan aroma vanilla premium. Rasa manis dan teksturnya yang creamy menjadikannya minuman favorit di cuaca panas.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/espresso.jpg",
    "name": "Espresso",
    "price": "Rp. 22000",
    "deskripsi":
        "Espresso murni hasil ekstraksi kopi terbaik dengan tekanan tinggi. Rasa pahit, pekat, dan aromanya yang kuat menjadikannya pilihan utama pecinta kopi sejati.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/lemon_tea.jpg",
    "name": "Lemon Tea",
    "price": "Rp. 18000",
    "deskripsi":
        "Teh hitam segar yang dipadukan dengan perasan lemon alami. Memberikan kesejukan dan rasa segar yang khas, sangat cocok diminum saat bersantai di siang hari.",
    "quantity": 0,
    "category": "minuman",
  },
  ];

  final List<Map<String, dynamic>> _makanan = [
    {
    "image": "assets/images/ayam_goreng.jpg",
    "name": "Ayam Goreng",
    "price": "Rp. 10000",
    "deskripsi":
        "ayam goranng.",
    "quantity": 0,
    "category": "makanan",
  },
  {
    "image": "assets/images/spageti.jpg",
    "name": "Spagheti",
    "price": "Rp. 30000",
    "deskripsi":
        "spagheti.",
    "quantity": 0,
    "category": "makanan",
  },
  
  ];

  List<Map<String, dynamic>> get minuman => _minuman;
  List<Map<String, dynamic>> get makanan => _makanan;


  void increment(int index) {
    _minuman[index]["quantity"]++;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void increment_makanan(int index) {
    _makanan[index]["quantity"]++;
    notifyListeners();
  }

  void decrement(int index) {
    if (_minuman[index]["quantity"] > 0) {
      _minuman[index]["quantity"]--;
      notifyListeners();
    }
  }

  // ignore: non_constant_identifier_names
  void decrement_makanan(int index) {
    if (_makanan[index]["quantity"] > 0) {
      _makanan[index]["quantity"]--;
      notifyListeners();
    }
  }

  // 🔹 Produk yang sudah dipesan (quantity > 0)
  List<Map<String, dynamic>> get orderedMinuman =>
      _minuman.where((p) => p["quantity"] > 0).toList();

  // 🔹 Hapus semua pesanan
  void clearOrders() {
    for (var p in _minuman) {
      p["quantity"] = 0;
    }

    for (var p in _makanan) {
      p["quantity"] = 0;
    }
    notifyListeners();
  }

  // 🔹 Produk yang sudah dipesan (quantity > 0)
  List<Map<String, dynamic>> get orderedMakanan =>
      _makanan.where((p) => p["quantity"] > 0).toList();

  // 🔹 Hapus semua pesanan
  // ignore: non_constant_identifier_names
  void clearOrders_makanan() {
    for (var p in _makanan) {
      p["quantity"] = 0;
    }
    notifyListeners();
  }
}
