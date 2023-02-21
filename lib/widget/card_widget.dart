import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/widget/chip_widget.dart';
import 'package:movie_app/widget/shimmer_widget.dart';

import '../model/movie.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    this.title,
    this.director,
    this.icon,
    this.leading,
    this.leadingBackgroundColor,
    this.onTap,
    this.summary,
    required this.genres,
  }) : super(key: key);

  final String? title;
  final String? director;
  final String? summary;
  final Widget? icon;
  final Widget? leading;
  final Color? leadingBackgroundColor;
  final Function()? onTap;
  final List<Genres> genres;

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    final director = this.director;
    final summary = this.summary;
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
          child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: 'https://picsum.photos/120/200',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const ShimmerWidget(
                          child: ColoredBox(
                            color: Color(0xfff8f8f8),
                          ),
                        ),
                        errorWidget: (context, url, error) => const ColoredBox(
                          color: Color(0xfff8f8f8),
                          child: Center(
                            child: Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: const Color(0xff404d61),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (genres.isNotEmpty) ...[
                          SizedBox(
                            height: 50.h,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: genres.length,
                              itemBuilder: (context, index) => IconChipWidget(
                                label: getGenres(genres[index]),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                        Text(
                          director ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: const Color(0xff757d8a),
                            fontSize: 12.sp,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 150.w),
                          child: Text(
                            summary ?? '',
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xff757d8a),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
