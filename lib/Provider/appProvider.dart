import 'package:task/Utils/allExports.dart';

class AppProvider {
  static final List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
  ];
}
