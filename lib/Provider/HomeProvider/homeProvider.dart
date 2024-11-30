import 'dart:async';

import '../../Utils/allExports.dart';

class HomeProvider extends ChangeNotifier {
  // Todo create banner List
  final List<String> _banners = [
    AppImages.banner1,
    AppImages.banner2,
    AppImages.banner3,
    AppImages.banner4,
    AppImages.banner5,
  ];

  List<String> get banners => _banners;

  final PageController pageController = PageController();

  int currentPage = 0;
  Timer? _autoScrollTimer;

  HomeProvider() {
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        final nextPage = (currentPage + 1) % banners.length;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        setCurrentPage(nextPage);
      }
    });
  }

  void setCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  // Todo

  // Categories
  final List<CategoryModel> _categories = [
    CategoryModel('Living Room', Icons.chair, label: 'PRICE DROP'),
    CategoryModel('Bedroom', Icons.bed, label: 'PRICE DROP'),
    CategoryModel('Storage', Icons.kitchen),
    CategoryModel('Study', Icons.desk),
    CategoryModel('Dining', Icons.table_bar),
    CategoryModel('Tables', Icons.table_rows),
    CategoryModel('Chairs', Icons.chair_alt, isNew: true),
    CategoryModel('Z Rated', Icons.star, isNew: true),
    CategoryModel('Best Deals', Icons.local_offer_outlined),
  ];

  List<CategoryModel> get categories => _categories;

  // Todo

  final List<Offer> _offers = [
    Offer(
      iconPath: AppImages.kSbi,
      title: 'Extra ₹100 off on SBI',
      description: 'Applicable on SBI Credit cards',
      footer: 'No code required',
    ),
    Offer(
      iconPath: AppImages.kSbi,
      title: 'Get flat 15% off',
      description: 'Get flat 15% off on all items',
      footer: 'Use Coupon XYZ',
    ),
    Offer(
      iconPath: AppImages.kSbi,
      title: 'Extra ₹100 off on SBI',
      description: 'Applicable on SBI Credit cards',
      footer: 'No code required',
    ),
    Offer(
      iconPath: AppImages.kSbi,
      title: 'Get flat 15% off',
      description: 'Get flat 15% off on all items',
      footer: 'Use Coupon XYZ',
    ),
  ];

  List<Offer> get offers => _offers;

  // Todo
  final List<Deal> _deals = [
    Deal(
        title: "Flex 3 Seater Magic B...",
        discountPercentage: 72,
        price: 10499,
        imageUrl: AppImages.SOFA1),
    Deal(
        title: "Flex Fabric 3 Seater...",
        discountPercentage: 74,
        price: 9449,
        imageUrl: AppImages.SOFA2),
    Deal(
        title: "Flex Fabric 3 Seater...",
        discountPercentage: 74,
        price: 9449,
        imageUrl: AppImages.SOFA3),
  ];

  List<Deal> get deals => _deals;
}

class CategoryModel {
  final String name;
  final IconData icon;
  final String label;
  final bool isNew;

  CategoryModel(this.name, this.icon, {this.label = '', this.isNew = false});
}

class Offer {
  final String iconPath;
  final String title;
  final String description;
  final String footer;

  Offer({
    required this.iconPath,
    required this.title,
    required this.description,
    required this.footer,
  });
}

class Deal {
  final String title;
  final double discountPercentage;
  final double price;
  final String imageUrl;

  Deal({
    required this.title,
    required this.discountPercentage,
    required this.price,
    required this.imageUrl,
  });
}
