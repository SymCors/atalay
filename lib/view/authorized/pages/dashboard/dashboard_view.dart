import '../../../../core/base/view/base_view.dart';
import '../../../../core/widgets/base_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key, required this.zoomDrawerController})
      : super(key: key);

  final ZoomDrawerController zoomDrawerController;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: BaseAppBar(
        zoomDrawerController: zoomDrawerController,
        title: 'dashboard'.tr(),
      ),
      onPageBuilder: (context, value) => Container(),
    );
  }
}