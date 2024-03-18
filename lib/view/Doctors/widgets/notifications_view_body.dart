import 'package:flutter/material.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/notifications_viewL_lst_view.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const NotificationsViewListView();
  }
}
