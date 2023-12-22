// // ignore_for_file: avoid_print

// import 'package:almaren/config/config.dart';
// import 'package:flutter/material.dart';
// import 'package:imclient/imclient.dart';
// import 'package:imclient/message/message.dart';
// import 'package:imclient/model/channel_info.dart';
// import 'package:imclient/model/group_info.dart';
// import 'package:imclient/model/group_member.dart';
// import 'package:imclient/model/read_report.dart';
// import 'package:imclient/model/user_info.dart';
// import 'package:imclient/model/user_online_state.dart';
// import 'package:rtckit/rtckit.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// //IM服务
// class IMService {
//   static bool isLogin = false;

//   //登入账号回调
//   static Function? loginCallback;

//   //退出账号回调
//   static Function? logoutCallback;

//   //初始化IM服务
//   static Future<void> initIMClient() async {
//     Rtckit.init();
//     //if (Config.iceSERVERS != null) {
//     for (int i = 0; i < Config.iceSERVERS.length; i++) {
//       var iceServer = Config.iceSERVERS[i];
//       Rtckit.addICEServer(iceServer[0], iceServer[1], iceServer[2]);
//     }
//     //}
//     Imclient.init((int status) async {
//       debugPrint("status$status");
//       if (status == kConnectionStatusSecretKeyMismatch ||
//           status == kConnectionStatusTokenIncorrect ||
//           status == kConnectionStatusRejected ||
//           status == kConnectionStatusLogout) {
//         if (status != kConnectionStatusLogout) {
//           Imclient.isLogined.then((value) {
//             if (value) {
//               Imclient.disconnect();
//             }
//           });
//         }
//         //移除缓存的登录信息
//         SharedPreferences shared = await SharedPreferences.getInstance();
//         shared.remove('userId');
//         shared.remove('token');
//         isLogin = false;
//         logoutCallback?.call();
//       }
//     }, (List<Message> messages, bool hasMore) {
//       print(messages);
//     }, (messageUid) {
//       print('recall message $messageUid');
//     }, (messageUid) {
//       print('delete message $messageUid');
//     }, messageDeliveriedCallback: (Map<String, int> deliveryMap) {
//       print('on message deliveried $deliveryMap');
//     }, messageReadedCallback: (List<ReadReport> readReports) {
//       print("on message readed $readReports");
//     }, groupInfoUpdatedCallback: (List<GroupInfo> groupInfos) {
//       print("on groupInfo updated $groupInfos");
//     }, groupMemberUpdatedCallback: (String groupId, List<GroupMember> members) {
//       print("on group $groupId member updated $members");
//     }, userInfoUpdatedCallback: (List<UserInfo> userInfos) {
//       print("on UserInfo updated $userInfos");
//     }, channelInfoUpdatedCallback: (List<ChannelInfo> channelInfos) {
//       print("on ChannelInfo updated $channelInfos");
//     }, userSettingsUpdatedCallback: () {
//       print("on user settings updated");
//     }, friendListUpdatedCallback: (List<String> newFriendIds) {
//       print("on friend list updated $newFriendIds");
//     }, friendRequestListUpdatedCallback: (List<String> newFriendRequests) {
//       print("on friend request updated $newFriendRequests");
//     }, onlineEventCallback: (List<UserOnlineState> onlineInfos) {
//       print(onlineInfos);
//     });
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.getString("userId") != null && prefs.getString("token") != null) {
//       //开始连接服务
//       String userId = prefs.getString("userId")!;
//       //userId = "9r6qmws2k";
//       String token = prefs.getString("token")!;
//       // token =
//       //     "dscNfnleFKVdl4iUt6EGcXjiH3yiUScUe5biSfhBGBVlMHsdJwFXgdfVRdsl0gGXCxZpSC27q+ap9eHC2pOHg2zuU9doAZeRtp5njGaxFh25FTYLicRuMqVsuOFOdlP2qBgrjaXv9/QKydJ7KQFYIwIMtSIxRFDcZpuVSVaKEPo=";
//       await Imclient.connect(Config.imHost, userId, token);
//       loginCallback?.call();
//     } else {
//       logoutCallback?.call();
//     }
//   }

//   //连接服务器
//   static void connect(String userId, String token) {
//     Imclient.connect(Config.imHost, userId, token);
//     SharedPreferences.getInstance().then((value) {
//       value.setString("userId", userId); //9r6qmws2k
//       value.setString("token",
//           token); //Nslf6beHA3SIvj96NjXR7jGdmNVLoK3GYnY5fH9jQIBh7HX/gmKo21z4vvoxWEkz7xQ6zhebdLRoaLVBrkrWFksC7dNP4/VG9glpurgaVBJ6x8q659lIha/afhEIg3SVwaQBZGx2a6RibDHBpTCsJ7/iOt7KaYG3+Ke0RUciziQ=
//     });
//   }
// }
