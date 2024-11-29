import '../Utils/allExports.dart';

class CustomPadding extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const CustomPadding({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
