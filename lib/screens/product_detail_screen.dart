import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/product.dart';
import '../services/cart_service.dart';
import '../theme/app_theme.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final CartService _cartService = CartService();
  int _selectedImageIndex = 0;
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.product.minimumOrderQuantity;
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final bool inCart = _cartService.isInCart(product.id);
    final allImages = product.images.isNotEmpty
        ? product.images
        : [product.thumbnail];

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _buildImageSection(allImages)),
              SliverToBoxAdapter(child: _buildContent(product, inCart)),
            ],
          ),

          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: _circleButton(Icons.arrow_back_ios_new),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            right: 16,
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              ).then((_) => setState(() {})),
              child: Container(
                width: 40,
                height: 40,
                decoration: _circleDecoration(),
                child: Stack(
                  children: [
                    const Center(
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 18,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    if (_cartService.totalItems > 0)
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: const BoxDecoration(
                            color: AppTheme.highlightColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${_cartService.totalItems}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(product, inCart),
    );
  }

  Widget _circleButton(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: _circleDecoration(),
      child: Icon(icon, size: 18, color: AppTheme.textPrimary),
    );
  }

  BoxDecoration _circleDecoration() {
    return BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
      ],
    );
  }

  Widget _buildImageSection(List<String> images) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 320,
            child: PageView.builder(
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() => _selectedImageIndex = index);
              },
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: images[index],
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.primaryColor,
                      strokeWidth: 2,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.image_not_supported_outlined,
                    size: 60,
                    color: AppTheme.textSecondary,
                  ),
                );
              },
            ),
          ),
          if (images.length > 1)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: _selectedImageIndex == index ? 20 : 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: _selectedImageIndex == index
                          ? AppTheme.primaryColor
                          : AppTheme.dividerColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            )
          else
            const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildContent(Product product, bool inCart) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    product.category.toUpperCase(),
                    style: const TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  product.brand,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              product.title,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${product.discountedPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (product.discountPercentage > 0)
                      Row(
                        children: [
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.highlightColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '%${product.discountPercentage.toStringAsFixed(0)} indirim',
                              style: const TextStyle(
                                color: AppTheme.highlightColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                _buildRatingBadge(product.rating),
              ],
            ),

            const SizedBox(height: 20),

            _buildInfoRow(
              Icons.inventory_2_outlined,
              'Stok',
              '${product.stock} adet',
              product.isInStock
                  ? AppTheme.successColor
                  : AppTheme.highlightColor,
            ),

            const SizedBox(height: 8),

            _buildInfoRow(
              Icons.local_shipping_outlined,
              'Durum',
              product.availabilityStatus,
              product.isInStock ? AppTheme.successColor : AppTheme.warningColor,
            ),

            const SizedBox(height: 20),

            const Text(
              'Açıklama',
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              product.description,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 20),

            _buildProductInfoCard(product),

            const SizedBox(height: 20),

            _buildReviewsSection(product),

            const SizedBox(height: 20),

            if (!inCart) ...[
              const Text(
                'Adet',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Minimum sipariş miktarı: ${product.minimumOrderQuantity} adet',
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
              _buildQuantitySelector(),
            ],

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBadge(double rating) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star_rounded,
            color: AppTheme.warningColor,
            size: 18,
          ),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductInfoCard(Product product) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ürün Bilgileri',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            Icons.verified_user_outlined,
            'Garanti',
            product.warrantyInformation,
            AppTheme.primaryColor,
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            Icons.local_shipping_outlined,
            'Kargo',
            product.shippingInformation,
            AppTheme.successColor,
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            Icons.assignment_return_outlined,
            'İade',
            product.returnPolicy,
            AppTheme.highlightColor,
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            Icons.shopping_cart_outlined,
            'Min. Sipariş',
            '${product.minimumOrderQuantity} adet',
            AppTheme.warningColor,
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsSection(Product product) {
    if (product.reviews.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Yorumlar',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        ...product.reviews.map((review) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppTheme.dividerColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        review.reviewerName,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < review.rating
                              ? Icons.star_rounded
                              : Icons.star_border_rounded,
                          color: AppTheme.warningColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  review.comment,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: AppTheme.textSecondary),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (_quantity > widget.product.minimumOrderQuantity) {
              setState(() => _quantity--);
            } else {
              _showMinimumQuantityWarning();
            }
          },
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.dividerColor),
            ),
            child: const Icon(Icons.remove, size: 18),
          ),
        ),

        const SizedBox(width: 16),

        Text(
          '$_quantity',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
          ),
        ),

        const SizedBox(width: 16),

        GestureDetector(
          onTap: () {
            if (_quantity < widget.product.stock) {
              setState(() => _quantity++);
            }
          },
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.add, size: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(Product product, bool inCart) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          if (inCart) ...[
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  setState(() => _cartService.removeFromCart(product.id));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Sepetten çıkarıldı'),
                      duration: const Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: AppTheme.highlightColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.delete_outline, size: 18),
                label: const Text('Kaldır'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                ).then((_) => setState(() {})),
                icon: const Icon(Icons.shopping_bag_outlined, size: 18),
                label: const Text('Sepete Git'),
              ),
            ),
          ] else ...[
            Expanded(
              child: ElevatedButton(
                onPressed: product.isInStock
                    ? () {
                        if (_quantity < product.minimumOrderQuantity) {
                          _showMinimumQuantityWarning();
                          return;
                        }

                        for (int i = 0; i < _quantity; i++) {
                          _cartService.addToCart(product);
                        }

                        setState(() {});

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$_quantity adet sepete eklendi'),
                            duration: const Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: AppTheme.successColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      }
                    : null,
                child: const Text('Sepete Ekle'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showMinimumQuantityWarning() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Bu ürün için minimum sipariş miktarı ${widget.product.minimumOrderQuantity} adettir.',
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppTheme.warningColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
