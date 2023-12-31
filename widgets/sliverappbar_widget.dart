// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import '../constant/assest_images.dart';
// import '../constant/dimens.dart';
//
// class SliverAppBarWidget extends StatelessWidget {
//   const SliverAppBarWidget(
//       {Key? key, required this.body, required this.expandedHeight, required this.title, this.titlePadding, required this.imageUrl, this.child, required this.centerTitle})
//       : super(key: key);
//   final Widget body;
//   final double expandedHeight;
//   final Widget title;
//   final EdgeInsetsGeometry? titlePadding;
//   final String imageUrl;
//   final Widget? child;
//   final bool centerTitle;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return NestedScrollView(
//       floatHeaderSlivers: true,
//       headerSliverBuilder: (context, innerBoxIsScrolled) =>
//       [
//         SliverAppBar(
//             floating: true,
//             automaticallyImplyLeading: false,
//             pinned: true,
//             backgroundColor: Colors.black,
//             expandedHeight: expandedHeight,
//             flexibleSpace: FlexibleSpaceBar(
//               centerTitle:  centerTitle,
//               title: title,
//               titlePadding:titlePadding ,
//               collapseMode: CollapseMode.pin,
//               background: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                     CachedNetworkImage(
//                       imageUrl: imageUrl,
//                       fit: BoxFit.cover,
//                       placeholder: (context, url) =>
//                           Image.asset(kPlaceHoderImage, fit: BoxFit.cover,),
//                       errorWidget: (context, url, error) =>
//                       const Center(
//                         child: CircularProgressIndicator(color: Colors.red,),
//                       ),
//                     ),
//                   Positioned(
//                     top: kPS50px,
//                     left: kPS10px,
//                     child: CircleAvatar(
//                         backgroundColor: Colors.redAccent,
//                         child: InkWell(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: const Icon(Icons.arrow_back))),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: child,
//                   ),
//                 ],
//               ),
//             ),
//         ),
//       ], body: body,);
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/assest_images.dart';
import '../constant/dimens.dart';

class SliverAppBarWidget<T> extends StatelessWidget {
  const SliverAppBarWidget({
    Key? key,
    required this.expandedHeight,
    this.titlePadding,
    this.child,
    required this.centerTitle,
    this.title,required this.imageUrl, required this.body,
  }) : super(key: key);

  final double expandedHeight;
  final EdgeInsetsGeometry? titlePadding;
  final Widget? child;
  final bool centerTitle;
  final Widget? title;
  final String imageUrl;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          floating: true,
          automaticallyImplyLeading: false,
          pinned: true,
          backgroundColor: Colors.black,
          expandedHeight: expandedHeight,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: centerTitle,
            title: title,
            titlePadding: titlePadding,
            collapseMode: CollapseMode.pin,
            background: Stack(
              fit: StackFit.expand,
              children: [
            CachedNetworkImage(imageUrl:imageUrl,
            fit: BoxFit.cover,
            placeholder: (context,url)=>Center(child: Image.asset(kPlaceHoderImage),),
              errorWidget: (context,url,error)=>const Center(child: Icon(Icons.error),),
            ),
                Positioned(
                  top: kPS50px,
                  left: kPS10px,
                  child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ],
      body: body ,
    );
  }
}
