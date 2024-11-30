import 'package:task/Utils/allExports.dart';

class BuyOptionsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color startColor;

  final Color endColor;

  const BuyOptionsCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.startColor,
    required this.endColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: const Color(0xFF222454),
          ),
          const SizedBox(height: 10),
          TextWidget(
            useGoogleFont: true,
            text: subtitle,
            color: Color(0xFF222454),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          kHeightGap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                useGoogleFont: true,
                text: title,
                color: Color(0xFF222454),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              kWidthGap(10),
              const Icon(
                Icons.arrow_forward,
                color: Color(0xFF222454),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
