import '../../Utils/allExports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    routeCall();
    super.initState();
  }

  routeCall() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: TextWidget(
          fontSize: 24,
          color: AppColors.kBlack.withOpacity(.6),
          text: "WelCome to Furniture Home",
          useGoogleFont: true,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
