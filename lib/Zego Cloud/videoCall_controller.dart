import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:mindcare_app/Zego%20Cloud/constants.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class VideoCallController extends GetxController {
  List<QueryDocumentSnapshot> users = [];
  User? user = FirebaseAuth.instance.currentUser;

  Future<List<QueryDocumentSnapshot>> getUserData() async {
    users.clear();
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection("users").get();
    users.addAll(data.docs);
    return users;
  }

  /// on App's user login
  void onUserLogin(User user) {
    /// 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: appID /*input your AppID*/,
      appSign: appSign /*input your AppSign*/,
      userID: user.uid,
      userName: user.email!,
      plugins: [ZegoUIKitSignalingPlugin()],
      /* requireConfig: (ZegoCallInvitationData data) {
        var config = (data.invitees.length > 1)
            ? ZegoCallType.videoCall == data.type
                ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
                : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
            : ZegoCallType.videoCall == data.type
                ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
                : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

        // Modify your custom configurations here.
        config
          ..turnOnCameraWhenJoining = false
          ..turnOnMicrophoneWhenJoining = false
          ..useSpeakerWhenJoining = true;
        return config;
      }, */
    );
  }

  /// on App's user logout
  void onUserLogout() {
    /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged out
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }
}
