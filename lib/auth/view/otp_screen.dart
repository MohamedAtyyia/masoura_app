import 'package:certivicate/auth/data/repo/home_repo_impl.dart';
import 'package:certivicate/auth/manager/cubit/authentication_cubit.dart';
import 'package:certivicate/auth/view/widget/form_to_otp_screen.dart';
import 'package:certivicate/core/util/service_locator.dart';
import 'package:certivicate/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(
        getIt.get<HomeRepoAuthImple>(),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(),
          body: FormToOtbScreen(email: email),
        ),
      ),
    );
  }
}
