import 'package:flutter/material.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({super.key});

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  static const Color primaryColor = Color(0xFF252525);
  static const Color secondaryColor = Color(0xFF777777);
  static const Color backgroundColor = Color(0xFFF5F6F8);

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Pakaian Kalcer',
      'price': 99000,
      'discount': '58%',
      'description': 'Outfit casual kekinian',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYPoz5EABcmH9uSVRCFG3AxwKdeFEXJHwmY2v2RKUxwiGsOukw05Um35o&s=10',
    },
    {
      'name': 'Makanan TNI',
      'price': 45000,
      'discount': '20%',
      'description': 'Makanan praktis dan lezat',
      'image': 'https://awsimages.detik.net.id/community/media/visual/2017/10/05/6d9da663-d300-47d3-b53d-02627666821c.jpeg?w=600&q=90',
    },
    {
      'name': 'iPhone 15 Pro Max',
      'price': 15999000,
      'discount': '15%',
      'description': 'Smartphone premium',
      'image': 'https://www.digimap.co.id/cdn/shop/files/0788-APPMG2P4ID-A-1_e20cef0d-a91f-4ed6-87a5-af094565ef7a.jpg?v=1759804310&width=823',
    },
    {
      'name': 'Buku Sejarah Peradaban Jonggol',
      'price': 125000,
      'discount': '10%',
      'description': 'Buku untuk menambah wawasan',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVhvP4Bnhko7xCHqq3JyL15KF_CqH1I_s3Ck_etQpBtQ&s=10',
    },
    {
      'name': 'Skintific',
      'price': 89000,
      'discount': '25%',
      'description': 'Perawatan kulit harian',
      'image': 'https://www.google.com/imgres?q=skintific&imgurl=https%3A%2F%2Fmedias.watsons.co.id%2Fpublishing%2FWTCID-74594-extra1-zoom.jpg%3Fversion%3D1770132350&imgrefurl=https%3A%2F%2Fwww.watsons.co.id%2Fid%2Fskintific-glow-bright-day-cream-30g%2Fp%2FBP_74594&docid=uj3GJUBHHTEgbM&tbnid=mK0DjB2TWInfOM&vet=12ahUKEwilk6PgztmXAxV-zzgGHel3EoYQnPAOegQIWhAA..i&w=800&h=800&hcb=2&ved=2ahUKEwilk6PgztmXAxV-zzgGHel3EoYQnPAOegQIWhAA',
    },
    {
      'name': 'Pengharum Meja',
      'price': 35000,
      'discount': '30%',
      'description': 'Bikin meja lebih nyaman',
      'image': 'https://static.wixstatic.com/media/d674c5_12bb220b4c984be5b7f2fd0b7ef2b6c6~mv2.jpg/v1/fill/w_768,h_768,al_c,q_85,enc_avif,quality_auto/d674c5_12bb220b4c984be5b7f2fd0b7ef2b6c6~mv2.jpg',
    },
  ];

  final Set<int> favoriteProducts = {};

  String formatPrice(int price) {
    final formatted = price.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );

    return 'Rp$formatted';
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.62,
        crossAxisSpacing: 2,
        mainAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        final isFavorite = favoriteProducts.contains(index);

        return Container(
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0xFFEEEEEE),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label diskon dan tombol favorit
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '-${product['discount']}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (isFavorite) {
                          favoriteProducts.remove(index);
                        } else {
                          favoriteProducts.add(index);
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        size: 21,
                        color: isFavorite
                            ? Colors.redAccent
                            : secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              // Gambar produk berbeda-beda
              Expanded(
                child: Center(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      product['image'] as String,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 40,
                            color: secondaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // Nama produk
              Text(
                product['name'] as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                ),
              ),

              const SizedBox(height: 5),

              // Deskripsi produk
              Text(
                product['description'] as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  color: secondaryColor,
                ),
              ),

              const SizedBox(height: 10),

              // Harga dan tombol keranjang
              Row(
                children: [
                  Expanded(
                    child: Text(
                      formatPrice(product['price'] as int),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Material(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/cart_page');
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: const SizedBox(
                        width: 34,
                        height: 34,
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}