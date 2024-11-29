import 'package:task/Utils/allExports.dart';
import 'package:task/Utils/helper.dart';
import 'package:task/Widgets/CustomPadding.dart';
import 'package:task/Widgets/TextWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        body: CustomPadding(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kWhite,
                      blurRadius: 2.5,
                      spreadRadius: .3,
                      offset: Offset(.3, .5),
                    )
                  ],
                  color: AppColors.kGreyColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.pin_drop_outlined,
                      color: AppColors.kGreyColor,
                    ),
                    kWidthGap(10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Delivery to",
                          color: AppColors.kGreyColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        TextWidget(
                          text: "201301",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.kBlack,
                        ),
                      ],
                    ),
                    Spacer(),
                    const Icon(
                      Icons.search,
                      color: AppColors.kGreyColor,
                    ),
                    kWidthGap(10),
                    const Icon(
                      Icons.favorite_border,
                      color: AppColors.kGreyColor,
                    ),
                    kWidthGap(10),
                    const Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.kGreyColor,
                    ),
                    kWidthGap(10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
