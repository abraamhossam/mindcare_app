import 'package:flutter/widgets.dart';
import 'package:mindcare_app/view/Doctors/widgets/notifications_view_iteam.dart';

class NotificationsViewListView extends StatelessWidget {
  const NotificationsViewListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return const NotificationsViewIteam();
          }),
    );
  }
}
