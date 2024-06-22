import 'package:certivicate/core/data/local_data/get_data_of_user.dart';
import 'package:certivicate/core/extention/extention.dart';
import 'package:certivicate/core/style/app_color.dart';
import 'package:certivicate/core/style/text_style.dart';
import 'package:certivicate/core/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SomeDataofUsre extends StatelessWidget {
  const SomeDataofUsre({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          12.hs,
          Image.asset(AppImageAssets.logo, width: 150.w, height: 150.h),
          Text(GetUserFromLockel.userModel!.userName,
              style: Style.textStyle20.copyWith(color: AppColor.black)),
          4.hs,
          Text(GetUserFromLockel.userModel!.email,
              style: Style.textStyle16
                  .copyWith(color: Colors.grey.withOpacity(.7))),
          12.hs,
        ],
      ),
    );
  }
}
