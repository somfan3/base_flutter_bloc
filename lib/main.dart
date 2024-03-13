import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/common/global_loading/global_loading.dart';
import 'package:flutter_app_architecture/core/local_storage/local_storage.dart';
import 'package:flutter_app_architecture/core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GlobalLoadingOverlay(
      child: MaterialApp.router(
        routerConfig: appRouter,
      ),
    );
  }
}

