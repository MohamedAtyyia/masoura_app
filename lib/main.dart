import 'package:certivicate/auth/data/model/user_adapter.dart';
import 'package:certivicate/auth/data/model/user_model.dart';
import 'package:certivicate/core/data/api/api_server.dart';
import 'package:certivicate/core/data/local_data/get_data_of_user.dart';
import 'package:certivicate/core/data/local_data/shared_prefrance.dart';
import 'package:certivicate/core/router/app_router.dart';
import 'package:certivicate/core/router/app_router_name.dart';
import 'package:certivicate/core/util/app_const.dart';
import 'package:certivicate/core/util/service_locator.dart';
import 'package:certivicate/payment/payment_with_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MySharedPrefrence.init();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<UserModel>(AppConst.userBox);

  ApiService.init();
  setup();
  GetUserFromLockel.init();

  runApp(const FreeLance());
}

class FreeLance extends StatelessWidget {
  const FreeLance({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRouterName.splashView,
      ),
    );
  }
}
