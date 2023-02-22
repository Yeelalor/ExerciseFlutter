import 'package:flutterwidgets/services/homeservice/res_api.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerLazySingleton(() => CallAPI());
}
