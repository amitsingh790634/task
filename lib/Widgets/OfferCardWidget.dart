import 'package:task/Utils/allExports.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;

  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.yellow[100],
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 16,
                    child: Image.asset(offer.iconPath, fit: BoxFit.contain),
                  ),
                  kWidthGap(10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        useGoogleFont: true,
                        text: offer.title,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      TextWidget(
                        useGoogleFont: true,
                        text: offer.description,
                        fontSize: 14,
                        color: Colors.black54,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      kHeightGap(8.0),
                      TextWidget(
                          useGoogleFont: true,
                          text: offer.footer,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            left: -5,
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                  color: AppColors.kWhite, shape: BoxShape.circle),
            )),
        Positioned(
          right: -5,
          child: Container(
            height: 25,
            width: 25,
            decoration: const BoxDecoration(
              color: AppColors.kWhite,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
