import '../Utils/allExports.dart';

class DealCard extends StatelessWidget {
  final Deal deal;

  const DealCard({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.kGreyColor.withOpacity(.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenWidth * 0.5,
            width: screenWidth * 0.5,
            child: Image.asset(
              deal.imageUrl,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, size: screenWidth * 0.5);
              },
            ),
          ),
          kWidthGap(12),
          Text(
            deal.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeightGap(4),
          Container(
            height: screenWidth * 0.16,
            width: screenWidth * 0.5,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.kYellow,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichTextWidget(
                  firstText: "-${deal.discountPercentage.toInt()}",
                  secondText: "% off  ",
                  thirdText: "₹${deal.price.toInt()}",
                  firstStyle: GoogleFonts.lato(
                    color: AppColors.kBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  secondStyle: GoogleFonts.lato(
                    color: AppColors.kBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  thirdStyle: GoogleFonts.lato(
                    color: AppColors.kBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
