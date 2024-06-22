import 'package:certivicate/auth/data/repo/home_repo_impl.dart';
import 'package:certivicate/auth/manager/cubit/authentication_cubit.dart';
import 'package:certivicate/auth/view/widget/form_to_login.dart';
import 'package:certivicate/core/util/service_locator.dart';
import 'package:certivicate/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(
        getIt.get<HomeRepoAuthImple>(),
      )..inilize(),
      child: const SafeArea(
          child: Scaffold(
              appBar: CustomAppBar(),
              body: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: FormToLogin(),
                  )
                ],
              ))),
    );
  }
}
