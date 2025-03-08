
import 'package:ecommerce_app/providers/routers/routerchange.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider(create: (_) => RouterProvider()),
  ];
}
