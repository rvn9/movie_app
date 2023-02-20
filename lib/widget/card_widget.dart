import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/widget/chip_widget.dart';

import '../model/movie.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    this.titleText,
    this.subtitleText,
    this.icon,
    this.leading,
    this.leadingBackgroundColor,
    this.onTap,
    required this.genres,
  }) : super(key: key);

  final String? titleText;
  final String? subtitleText;
  final Widget? icon;
  final Widget? leading;
  final Color? leadingBackgroundColor;
  final Function()? onTap;
  final List<Genres> genres;

  @override
  Widget build(BuildContext context) {
    final titleText = this.titleText;
    final subtitleText = this.subtitleText;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 2.0,
        shadowColor: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: Color(0xffe1e3e6), width: 1.0),
        ),
        child: ListTile(
            onTap: onTap,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 6.0,
            ),
            leading: AspectRatio(
              aspectRatio: 4 / 8,
              child: leading ??
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: ColoredBox(
                      color: leadingBackgroundColor ?? const Color(0xFFFFB74D),
                      child: icon ?? const SizedBox.shrink(),
                    ),
                  ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                titleText ?? '',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: const Color(0xff404d61),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  subtitleText ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xff757d8a),
                    fontSize: 16.sp,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                if (genres.isNotEmpty) ...[
                  SizedBox(
                    height: 50.sp,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: genres.length,
                      itemBuilder: (context, index) => IconChipWidget(
                        label: getGenres(genres[index]),
                      ),
                    ),
                  )
                ]
              ],
            )),
      ),
    );
  }
}
