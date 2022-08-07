import 'package:device_preview/device_preview.dart';
import 'package:eco_getx_app/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/services/services_settings.dart';
import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) async => await initServices().then(
      (value) => runApp(DevicePreview(builder: (context) => const MyApp()))));
}

Future<void> initServices() async {
  // ignore: avoid_print
  print('starting services ...');

  await Get.putAsync(() => FirebaseInstance().firebaseInit());
  await Get.putAsync(() => CacheService().init());
  Get.put<GetCurrentUser>(GetCurrentUser().getUserInit());

  // ignore: avoid_print
  print('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'EcommerceApp',
      home: const ControlView(),
    );
  }
}
