import 'package:task/Utils/allExports.dart';
import 'package:task/Widgets/DealCard.dart';

import '../Widgets/OfferCardWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(screenWidth * 0.03), // Responsive padding
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.01,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kWhite,
                        blurRadius: screenWidth * 0.01,
                        spreadRadius: screenWidth * 0.003,
                        offset: const Offset(0.3, 0.5),
                      ),
                    ],
                    color: AppColors.kGreyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(screenWidth * 0.1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.pin_drop_outlined,
                          color: AppColors.kGreyColor),
                      kWidthGap(10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            useGoogleFont: true,
                            text: "Delivery to",
                            color: AppColors.kGreyColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          TextWidget(
                            useGoogleFont: true,
                            text: "201301",
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kBlack,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.search, color: AppColors.kGreyColor),
                      const SizedBox(width: 10),
                      const Icon(Icons.favorite_border,
                          color: AppColors.kGreyColor),
                      const SizedBox(width: 10),
                      const Icon(Icons.shopping_cart_outlined,
                          color: AppColors.kGreyColor),
                    ],
                  ),
                ),
                kHeightGap(screenHeight * 0.02),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.25,
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              PageView.builder(
                                controller: homeProvider.pageController,
                                onPageChanged: homeProvider.setCurrentPage,
                                itemCount: homeProvider.banners.length,
                                itemBuilder: (context, index) {
                                  return buildBannerCard(
                                      homeProvider.banners[index], screenWidth);
                                },
                              ),
                              buildBannerIndicators(homeProvider, screenWidth),
                            ],
                          ),
                        ),
                        kHeightGap(screenHeight * 0.08),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: homeProvider.categories.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: screenWidth > 600 ? 6 : 4,
                            mainAxisSpacing: screenWidth * 0.02,
                            crossAxisSpacing: screenWidth * 0.02,
                            childAspectRatio: screenWidth > 600 ? 4 / 5 : 4 / 4,
                          ),
                          itemBuilder: (context, index) {
                            final category = homeProvider.categories[index];
                            return buildCategoryItem(category, screenWidth);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWidget(
                              text: 'Offers & Discounts',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              useGoogleFont: true,
                            ),
                            TextButton.icon(
                              icon: const Icon(Icons.arrow_forward, size: 15),
                              onPressed: () {},
                              label: const TextWidget(
                                text: 'See All',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                useGoogleFont: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.15,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: homeProvider.offers.length,
                            itemBuilder: (context, index) {
                              final offer = homeProvider.offers[index];
                              return OfferCard(offer: offer);
                            },
                          ),
                        ),
                        kHeightGap(screenHeight * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWidget(
                              text: 'Deals of the Day',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              useGoogleFont: true,
                            ),
                            TextButton.icon(
                              icon: const Icon(Icons.arrow_forward, size: 15),
                              onPressed: () {},
                              label: const TextWidget(
                                text: 'See All',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                useGoogleFont: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.35,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: homeProvider.deals.length,
                            itemBuilder: (context, index) {
                              final deal = homeProvider.deals[index];
                              return DealCard(deal: deal);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildBannerCard(String bannerImage, double screenWidth) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        image: DecorationImage(
          image: AssetImage(bannerImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildBannerIndicators(HomeProvider homeProvider, double screenWidth) {
    return Positioned(
      bottom: -screenWidth * 0.05,
      left: screenWidth * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          homeProvider.banners.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
            height: screenWidth * 0.02,
            width: homeProvider.currentPage == index
                ? screenWidth * 0.05
                : screenWidth * 0.02,
            decoration: BoxDecoration(
              color: homeProvider.currentPage == index
                  ? AppColors.kBlack.withOpacity(0.6)
                  : AppColors.kGreyColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(screenWidth * 0.01),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategoryItem(CategoryModel category, double screenWidth) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
                color: AppColors.kGreyColor.withOpacity(.3),
              ),
              child: Icon(category.icon, size: screenWidth * 0.08),
            ),
            if (category.label.isNotEmpty || category.isNew)
              Positioned(
                top: -screenWidth * 0.05,
                child: Container(
                  margin: EdgeInsets.only(bottom: screenWidth * 0.05),
                  padding: EdgeInsets.symmetric(
                      horizontal: category.isNew ? 12 : 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: category.isNew ? Colors.green : Colors.amber,
                    borderRadius: BorderRadius.circular(screenWidth * 0.01),
                  ),
                  child: TextWidget(
                    useGoogleFont: true,
                    text: category.isNew ? "NEW" : category.label,
                    color: Colors.white,
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: screenWidth * 0.02),
        TextWidget(
          useGoogleFont: true,
          text: category.name,
          fontSize: screenWidth * 0.03,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
