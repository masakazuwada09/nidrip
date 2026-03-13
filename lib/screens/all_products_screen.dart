import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cart_screen.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  List categories = [];
  List products = [];
  String selectedCategoryId = "all"; // Default active
  String baseUrl = "https://nidrip.mraalionline.com/api";
  String imageBaseUrl = "https://nidrip.mraalionline.com/api/image/";
  int cartCount = 0;

  final ScrollController _tabController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchProducts(
      categoryId: selectedCategoryId,
    ); // Show all products initially
    fetchCartCount();
  }

  // ================= FETCH CATEGORIES =================
  fetchCategories() async {
    try {
      var res = await http.get(Uri.parse("$baseUrl/categories"));
      var data = json.decode(res.body);
      if (mounted) {
        setState(() {
          categories = data;
        });
      }
    } catch (e) {}
  }

  // ================= FETCH PRODUCTS =================
  fetchProducts({String categoryId = "all"}) async {
    try {
      String url = categoryId == "all"
          ? "$baseUrl/products?limit=50"
          : "$baseUrl/products?category_id=$categoryId";
      var res = await http.get(Uri.parse(url));
      var data = json.decode(res.body);
      if (mounted) {
        setState(() {
          products = data;
        });
      }
    } catch (e) {
      if (mounted) setState(() => products = []);
    }
  }

  // ================= CART COUNT =================
  fetchCartCount() async {
    try {
      var res = await http.get(Uri.parse("$baseUrl/cart_count"));
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        if (mounted) setState(() => cartCount = data["count"] ?? 0);
      }
    } catch (e) {
      if (mounted) setState(() => cartCount = 0);
    }
  }

  // ================= ADD TO CART =================
  addToCart(String productId) async {
    try {
      var res = await http.post(
        Uri.parse("$baseUrl/add_to_cart"),
        body: {"p_id": productId, "qty": "1"},
      );
      if (res.statusCode == 200) fetchCartCount();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  // ================= SCROLL TAB TO CENTER =================
  scrollToCategory(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scrollPos = index * 100 - (screenWidth / 2) + 50;
    if (scrollPos < 0) scrollPos = 0;
    _tabController.animateTo(
      scrollPos,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ================= Top Bar =================
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, size: 28),
                ),
                const Text(
                  "All Products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CartScreen()),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 28,
                        color: Color.fromARGB(255, 61, 61, 61),
                      ),
                    ),
                    if (cartCount > 0)
                      Positioned(
                        right: 4,
                        top: 4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            cartCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          // ================= Category Tabs =================
          SizedBox(
            height: 50,
            child: Scrollbar(
              thumbVisibility: true,
              child: ListView.builder(
                controller: _tabController,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 1,
                itemBuilder: (context, index) {
                  String tabName;
                  String tabId;
                  if (index == 0) {
                    tabName = "All Products";
                    tabId = "all";
                  } else {
                    tabName = categories[index - 1]["category_name"];
                    tabId = categories[index - 1]["category_id"].toString();
                  }

                  bool isSelected = selectedCategoryId == tabId;

                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedCategoryId = tabId);
                      fetchProducts(categoryId: tabId);
                      scrollToCategory(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          tabName,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ================= Products Grid =================
          Expanded(
            child: products.isEmpty
                ? const Center(child: Text("No products found"))
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemBuilder: (context, index) {
                      var product = products[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image.network(
                                Uri.encodeFull(
                                  imageBaseUrl + product["product_image"],
                                ),
                                height: 130,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product["product_name"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      product["category_name"] ?? "",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 14,
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          "4.3",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "${product["company_currency"]}${product["product_price"]}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 32,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          addToCart(
                                            product["product_id"].toString(),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                          textStyle: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        child: const Text("Add To Cart"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
