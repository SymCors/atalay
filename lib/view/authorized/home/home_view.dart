import 'home_viewmodel.dart';
import '../pages/dashboard/dashboard_view.dart';
import '../pages/finance/finance_view.dart';
import '../pages/groups/groups_view.dart';
import '../pages/meetups/meetups_view.dart';
import '../pages/profile/profile_view.dart';
import '../pages/projects/projects_view.dart';
import '../pages/references/references_view.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/assets.dart';
import '../../../core/constant/sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/constant/styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = context.watch<HomeViewModel>();
    return BaseView(
      onPageBuilder: (context, value) => ZoomDrawer(
        controller: viewModel.zoomDrawerController,
        borderRadius: 24,
        style: DrawerStyle.Style1,
        openCurve: Curves.fastOutSlowIn,
        disableGesture: false,
        mainScreenTapClose: false,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        duration: const Duration(milliseconds: 500),
        backgroundColor: Colors.white,
        showShadow: true,
        angle: 0.0,
        clipMainScreen: true,
        mainScreen: viewModel.selectedWidget,
        menuScreen: const _Menu(),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(Assets.drawerMenuBackground),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Consumer(
                builder: (context, HomeViewModel viewModel, child) => Text(
                  'v' + viewModel.version,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const _MenuItems(),
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Sizes.height_15percent(context),
      left: 10,
      child: SizedBox(
        width: Sizes.width_50percent(context),
        child: Consumer(
          builder: (context, HomeViewModel viewModel, child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Item(
                viewModel: viewModel,
                assetName: Assets.dashboard,
                title: 'dashboard'.tr(),
                widget: DashboardView(
                    zoomDrawerController: viewModel.zoomDrawerController),
              ),
              _Item(
                viewModel: viewModel,
                assetName: Assets.projects,
                title: 'projects'.tr(),
                widget: ProjectsView(
                    zoomDrawerController: viewModel.zoomDrawerController),
              ),
              _Item(
                viewModel: viewModel,
                assetName: Assets.groups,
                title: 'groups'.tr(),
                widget: GroupsView(
                    zoomDrawerController: viewModel.zoomDrawerController),
              ),
              _Item(
                viewModel: viewModel,
                assetName: Assets.references,
                title: 'references'.tr(),
                widget: ReferencesView(
                    zoomDrawerController: viewModel.zoomDrawerController),
              ),
              _Item(
                viewModel: viewModel,
                assetName: Assets.finance,
                title: 'finance'.tr(),
                widget: FinanceView(
                    zoomDrawerController: viewModel.zoomDrawerController),
              ),
              _Item(
                viewModel: viewModel,
                assetName: Assets.meetups,
                title: 'meetups'.tr(),
                widget: MeetupsView(
                    zoomDrawerController: viewModel.zoomDrawerController),
              ),
              _Item(
                viewModel: viewModel,
                assetName: Assets.profile,
                title: 'profile'.tr(),
                widget: ProfileView(
                    zoomDrawerController: viewModel.zoomDrawerController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(
      {Key? key,
      required this.viewModel,
      required this.assetName,
      required this.title,
      required this.widget})
      : super(key: key);
  final HomeViewModel viewModel;
  final String assetName;
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        viewModel.setPage(widget);
        viewModel.zoomDrawerController.toggle!();
      },
      child: Row(
        children: [
          CircleAvatar(radius: 10, child: Image.asset(assetName)),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: zoomMenuTextStyle(),
          ),
        ],
      ),
    );
  }
}