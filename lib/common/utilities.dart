// import 'package:intl/intl.dart';

// class Utilities {
//   static String formatTime(int timestamp) {
//     var now = DateTime.now();
//     var date = DateTime.fromMicrosecondsSinceEpoch(timestamp*1000);
//     var diff = now.difference(date);
//     var time = '';

//     if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
//       var format = DateFormat('HH:mm');
//       time = format.format(date);
//     } else {

//       if (diff.inDays == 1) {
//         time = '昨天';
//       } else {
//         var format = DateFormat('MM-dd');
//         time = format.format(date);
//       }
//     }

//     return time;
//   }
// }