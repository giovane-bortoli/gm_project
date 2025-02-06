import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gm_project/app/features/motels/presenter/bloc/motels_controller.dart';
import 'package:gm_project/app/features/motels/presenter/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider(
        create: (_) => MotelsController(),
        child: MyHomePage(title: ''),
      )),
    ),
  ],
);
