import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? timestamp;

  const MyListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 10.w),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: ListTile(
            isThreeLine: true,
            title: Text(title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                timestamp == null
                    ? const Text('')
                    : Text("${formatDistanceToNowStrict(timestamp!)} ago")
              ],
            )),
      ),
    );
  }
}



String formatDistanceToNowStrict(String dateString) {
  DateTime now = DateTime.now();
  DateTime date = DateTime.parse(dateString);
  Duration difference = now.difference(date);
  if (difference.inSeconds < 60) {
    int seconds = difference.inSeconds;
    if (difference.inSeconds.isNegative) {
      return '0 seconds';
    } else {
      return '$seconds seconds';
    }
  } else if (difference.inMinutes < 60) {
    int minutes = difference.inMinutes;
    return '$minutes minutes';
  } else if (difference.inHours < 24) {
    int hours = difference.inHours;
    return '$hours hours';
  } else if (difference.inDays < 30) {
    int days = difference.inDays;
    return '$days days';
  } else if (difference.inDays < 365) {
    int months = difference.inDays ~/ 30;
    return '$months months';
  } else {
    int years = difference.inDays ~/ 365;
    return '$years years';
  }
}
