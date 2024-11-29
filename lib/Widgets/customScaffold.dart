
import 'package:task/Utils/allExports.dart';

class CustomScaffold extends StatefulWidget {
  final Widget? body;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final Color statusBarColor;
  final Color backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;

  const CustomScaffold({
    super.key,
    this.body,
    this.appBar,
    this.bottomSheet,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset = false,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
    this.extendBodyBehindAppBar = false,
    this.statusBarColor = AppColors.kWhite,
    this.backgroundColor = AppColors.kWhite,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  void initState() {
    super.initState();

    setStatusBarColorAndBrightness();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setStatusBarColorAndBrightness() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AppColors.kWhite,
          statusBarIconBrightness: Brightness.dark),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      bottomSheet: widget.bottomSheet,
      backgroundColor: widget.backgroundColor,
      appBar: widget.appBar ??
          AppBar(
            toolbarHeight: 0,
            backgroundColor: widget.statusBarColor,
            elevation: 0,
          ),
      body: widget.body,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
