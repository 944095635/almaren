// import 'package:imclient/model/channel_info.dart';
// import 'package:imclient/model/conversation.dart';
// import 'package:imclient/model/group_info.dart';
// import 'package:imclient/model/user_info.dart';

// class Cache {
//   static final Map<String, UserInfo> _userInfoCache = {};
//   static final Map<String, GroupInfo> _groupInfoCache = {};
//   static final Map<String, ChannelInfo> _channelInfoCache = {};
//   static final Map<Conversation, String> _convDigestCache = {};

//   static UserInfo? getUserInfo(String userId, {String? groupId}) {
//     if (groupId == null) {
//       return _userInfoCache[userId];
//     }
//     return _userInfoCache["$userId|$groupId"];
//   }

//   static void putUserInfo(UserInfo? userInfo, {String? groupId}) {
//     if (userInfo == null) {
//       return;
//     }

//     String userId = userInfo.userId;
//     if (groupId == null) {
//       _userInfoCache[userId] = userInfo;
//     } else {
//       _userInfoCache["$userId|$groupId"] = userInfo;
//     }
//   }

//   static GroupInfo? getGroupInfo(String groupId) {
//     return _groupInfoCache[groupId];
//   }

//   static void putGroupInfo(GroupInfo? groupInfo) {
//     if (groupInfo == null) {
//       return;
//     }
//     _groupInfoCache[groupInfo.target] = groupInfo;
//   }

//   static ChannelInfo? getChannelInfo(String channelId) {
//     return _channelInfoCache[channelId];
//   }

//   static void putChannelInfo(ChannelInfo? channelInfo) {
//     if (channelInfo == null) {
//       return;
//     }
//     _channelInfoCache[channelInfo.channelId] = channelInfo;
//   }

//   static String? getConversationDigest(Conversation conversation) {
//     return _convDigestCache[conversation];
//   }

//   static void putConversationDigest(Conversation conversation, String digest) {
//     _convDigestCache[conversation] = digest;
//   }
// }
