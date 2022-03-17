import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

class TimeAgo {
  static String timeAgoSinceDate(Timestamp timestamp) {
    Duration diff = DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch));
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year_ago".tr() : "years_ago".tr()}";
    } else if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month_ago".tr() : "months_ago".tr()}";
    } else if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week_ago".tr() : "weeks_ago".tr()}";
    } else if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "day_ago".tr() : "days_ago".tr()}";
    } else if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "hour_ago".tr() : "hours_ago".tr()}";
    } else if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute_ago".tr() : "minutes_ago".tr()}";
    } else {
      return "just_now".tr();
    }
  }
}
