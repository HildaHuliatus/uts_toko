import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _minuman = [
    {
    "image": "assets/images/green_tea.jpg",
    "name": "Green Tea",
    "price": "Rp. 20.000",
    "deskripsi":
        "Teh hijau alami dengan aroma lembut dan rasa yang menyegarkan. Dibuat dari daun teh pilihan yang kaya akan antioksidan, cocok untuk dinikmati hangat atau dingin di waktu santai.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/rose_tea.jpg",
    "name": "Rose Tea",
    "price": "Rp. 30.000",
    "deskripsi":
        "Teh mawar premium dengan aroma bunga yang menenangkan dan rasa lembut yang khas. Cocok untuk relaksasi setelah aktivitas padat, memberikan sensasi tenang dan segar di setiap tegukan.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/jasmine_tea.jpg",
    "name": "Jasmine Tea",
    "price": "Rp. 15.000",
    "deskripsi":
        "Teh melati harum dengan cita rasa khas Nusantara. Dipadukan dengan aroma melati yang lembut, memberikan keseimbangan antara rasa pahit teh dan wangi alami bunga melati.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/americano.jpg",
    "name": "Americano",
    "price": "Rp. 25.000",
    "deskripsi":
        "Kopi hitam klasik hasil campuran espresso dan air panas dengan rasa yang kuat namun tetap halus di lidah. Cocok untuk penikmat kopi murni tanpa tambahan gula atau susu.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/cappuccino.jpg",
    "name": "Cappuccino",
    "price": "Rp. 25.000",
    "deskripsi":
        "Perpaduan sempurna antara espresso, susu panas, dan busa susu yang lembut di atasnya. Memiliki rasa seimbang antara pahit dan manis, ideal untuk dinikmati di pagi atau sore hari.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/latte.jpg",
    "name": "Caffe Latte",
    "price": "Rp. 32.000",
    "deskripsi":
        "Minuman espresso dengan campuran susu panas yang lembut dan creamy. Cocok bagi pecinta kopi dengan rasa ringan dan aroma susu yang menenangkan.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/mocha.jpg",
    "name": "Mocha",
    "price": "Rp. 30.000",
    "deskripsi":
        "Kombinasi sempurna antara espresso, cokelat premium, dan susu panas. Menawarkan rasa manis dan sedikit pahit yang membuat setiap tegukan terasa memanjakan.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/macha_latte.jpg",
    "name": "Matcha Latte",
    "price": "Rp. 38.000",
    "deskripsi":
        "Matcha Jepang asli yang dikombinasikan dengan susu segar, menghasilkan rasa manis lembut dan aroma khas teh hijau. Memberikan energi dan ketenangan dalam satu cangkir.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/caramel_macchiato.jpg",
    "name": "Caramel Macchiato",
    "price": "Rp. 40.000",
    "deskripsi":
        "Espresso dengan susu panas dan sirup karamel manis yang menggoda. Setiap tegukan menghadirkan keseimbangan sempurna antara rasa kopi yang kuat dan aroma karamel yang lembut.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/ice_chocolate.jpg",
    "name": "Iced Chocolate",
    "price": "Rp. 20.000",
    "deskripsi":
        "Minuman cokelat dingin dengan rasa creamy dan manis seimbang. Dihidangkan dengan es batu untuk sensasi menyegarkan, cocok untuk penggemar minuman non-kopi.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/vanilla_frappe.jpg",
    "name": "Vanilla Frappe",
    "price": "Rp. 32.000",
    "deskripsi":
        "Frappe lembut berbahan dasar susu dan es yang dicampur dengan aroma vanilla premium. Rasa manis dan teksturnya yang creamy menjadikannya minuman favorit di cuaca panas.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/espresso.jpg",
    "name": "Espresso",
    "price": "Rp. 22.000",
    "deskripsi":
        "Espresso murni hasil ekstraksi kopi terbaik dengan tekanan tinggi. Rasa pahit, pekat, dan aromanya yang kuat menjadikannya pilihan utama pecinta kopi sejati.",
    "quantity": 0,
    "category": "minuman",
  },
  {
    "image": "assets/images/lemon_tea.jpg",
    "name": "Lemon Tea",
    "price": "Rp. 18.000",
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
    "price": "Rp. 20.000",
    "deskripsi":
        "Ayam goreng dengan bumbu rempah khas yang meresap hingga ke dalam daging. Disajikan dengan sambal pedas dan lalapan segar, cocok sebagai makanan pendamping nasi hangat.",
    "quantity": 0,
    "category": "makanan",
  },
  {
    "image": "assets/images/spageti.jpg",
    "name": "Spaghetti",
    "price": "Rp. 30.000",
    "deskripsi":
        "Spaghetti dengan saus bolognese yang kaya rasa. Terbuat dari tomat segar, bawang, dan daging cincang yang dimasak perlahan sehingga menghasilkan cita rasa autentik.",
    "quantity": 0,
    "category": "makanan",
  },
  {
    "image": "assets/images/nasi_goreng.jpg",
    "name": "Nasi Goreng",
    "price": "Rp. 18.000",
    "deskripsi":
        "Nasi goreng spesial dengan campuran telur, sayuran, dan kecap manis. Aroma smokey dari proses penggorengan membuat hidangan ini semakin nikmat.",
    "quantity": 0,
    "category": "makanan",
  },
  {
    "image": "assets/images/mie_goreng.jpg",
    "name": "Mie Goreng",
    "price": "Rp. 15.000",
    "deskripsi":
        "Mie goreng dengan bumbu gurih manis, dilengkapi sayuran serta irisan ayam. Tekstur mie yang lembut membuatnya cocok dinikmati kapan pun.",
    "quantity": 0,
    "category": "makanan",
  },
  {
    "image": "assets/images/soto_ayam.jpg",
    "name": "Soto Ayam",
    "price": "Rp. 20.000",
    "deskripsi":
        "Soto ayam dengan kuah kuning yang hangat dan kaya rempah. Disajikan dengan suwiran ayam, telur rebus, serta taburan bawang goreng.",
    "quantity": 0,
    "category": "makanan",
  },
  {
    "image": "assets/images/bakso.jpg",
    "name": "Bakso",
    "price": "Rp. 17.000",
    "deskripsi":
        "Bakso sapi dengan tekstur kenyal, disajikan dengan kuah kaldu segar yang gurih. Lengkap dengan mie, sayuran, dan sambal pedas sesuai selera.",
    "quantity": 0,
    "category": "makanan",
  },
  {
    "image": "assets/images/pecel_lele.jpg",
    "name": "Pecel Lele",
    "price": "Rp. 22.000",
    "deskripsi":
        "Lele goreng garing yang dipadukan dengan sambal terasi pedas menggugah selera. Dilengkapi dengan lalapan segar sebagai pelengkap.",
    "quantity": 0,
    "category": "makanan",
  },
  {
    "image": "assets/images/bebek_goreng.jpg",
    "name": "Bebek Goreng",
    "price": "Rp. 28.000",
    "deskripsi":
        "Bebek goreng gurih dengan daging lembut dan kulit renyah. Menyajikan rasa otentik dengan sambal khas dan nasi hangat.",
    "quantity": 0,
    "category": "makanan",
  },
  {
    "image": "assets/images/ramen.jpg",
    "name": "Ramen",
    "price": "Rp. 35.000",
    "deskripsi":
        "Ramen dengan kuah kaldu yang kaya rasa, topping ayam, jamur, telur setengah matang, dan rumput laut. Cocok untuk dinikmati saat cuaca dingin.",
    "quantity": 0,
    "category": "makanan",
  },
  {
    "image": "assets/images/katsu.jpg",
    "name": "Chicken Katsu",
    "price": "Rp. 32.000",
    "deskripsi":
        "Chicken katsu dengan lapisan tepung renyah dan daging ayam yang juicy. Dihidangkan bersama saus katsu khas dan nasi putih hangat.",
    "quantity": 0,
    "category": "makanan",
  },
];

final List<Map<String, dynamic>> _dessert = [
  {
    "image": "assets/images/brownies.jpg",
    "name": "Chocolate Brownies",
    "price": "Rp. 18.000",
    "deskripsi":
        "Brownies cokelat dengan tekstur fudgy di bagian dalam dan sedikit crust di bagian luar. Aroma cokelatnya kuat dan cocok dinikmati dengan teh atau kopi.",
    "quantity": 0,
    "category": "dessert",
  },
  {
    "image": "assets/images/cheesecake.jpg",
    "name": "Cheesecake",
    "price": "Rp. 25.000",
    "deskripsi":
        "Cheesecake lembut dengan rasa keju yang creamy dan sedikit asam yang seimbang. Disajikan dengan topping saus stroberi segar.",
    "quantity": 0,
    "category": "dessert",
  },
  {
    "image": "assets/images/tiramisu.jpg",
    "name": "Tiramisu",
    "price": "Rp. 28.000",
    "deskripsi":
        "Tiramisu klasik Italia dengan lapisan krim mascarpone dan ladyfinger yang direndam kopi. Lembut, manis, dan kaya aroma kopi.",
    "quantity": 0,
    "category": "dessert",
  },
  {
    "image": "assets/images/pudding_coklat.jpg",
    "name": "Pudding Coklat",
    "price": "Rp. 12.000",
    "deskripsi":
        "Pudding cokelat lembut dengan rasa manis yang pas, disajikan dengan saus cokelat pekat untuk menambah sensasi nikmat.",
    "quantity": 0,
    "category": "dessert",
  },
  {
    "image": "assets/images/ice_cream.jpg",
    "name": "Ice Cream Coklat",
    "price": "Rp. 15.000",
    "deskripsi":
        "Es krim coklat dengan tekstur creamy dan rasa manis lembut. Cocok disajikan sebagai penutup atau camilan segar di siang hari.",
    "quantity": 0,
    "category": "dessert",
  },
  {
    "image": "assets/images/crepes.jpg",
    "name": "Banana Crepes",
    "price": "Rp. 20.000",
    "deskripsi":
        "Crepes tipis berisi pisang manis dan cokelat leleh. Teksturnya lembut dan aromanya harum, cocok untuk pencuci mulut ringan.",
    "quantity": 0,
    "category": "dessert",
  },
  {
    "image": "assets/images/donut.jpg",
    "name": "Donut Coklat",
    "price": "Rp. 10.000",
    "deskripsi":
        "Donat empuk yang dilapisi cokelat glaze di bagian atas. Manisnya pas dan cocok untuk cemilan kapan saja.",
    "quantity": 0,
    "category": "dessert",
  },
  {
    "image": "assets/images/macaron.jpg",
    "name": "French Macaron",
    "price": "Rp. 22.000",
    "deskripsi":
        "Macaron khas Prancis dengan tekstur renyah di luar dan lembut di dalam. Dilengkapi berbagai rasa seperti stroberi, lemon, dan cokelat.",
    "quantity": 0,
    "category": "dessert",
  },
 
  {
    "image": "assets/images/waffle.jpg",
    "name": "Honey Waffle",
    "price": "Rp. 23.000",
    "deskripsi":
        "Waffle lembut dengan pinggiran renyah, disiram madu dan mentega. Aroma wafflenya menggugah selera, cocok untuk penutup hidangan.",
    "quantity": 0,
    "category": "dessert",
  },
];


  List<Map<String, dynamic>> get minuman => _minuman;
  List<Map<String, dynamic>> get makanan => _makanan;
  List<Map<String, dynamic>> get dessert => _dessert;


  void increment(int index) {
    _minuman[index]["quantity"]++;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void increment_makanan(int index) {
    _makanan[index]["quantity"]++;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void increment_dessert(int index) {
    _dessert[index]["quantity"]++;
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

  // ignore: non_constant_identifier_names
  void decrement_dessert(int index) {
    if (_dessert[index]["quantity"] > 0) {
      _dessert[index]["quantity"]--;
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

    for (var p in _dessert) {
      p["quantity"] = 0;
    }
    notifyListeners();
  }

  // 🔹 Produk yang sudah dipesan (quantity > 0)
  List<Map<String, dynamic>> get orderedMakanan =>
      _makanan.where((p) => p["quantity"] > 0).toList();


  // 🔹 Produk yang sudah dipesan (quantity > 0)
  List<Map<String, dynamic>> get orderedDessert =>
      _dessert.where((p) => p["quantity"] > 0).toList();

}
