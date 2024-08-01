import 'package:color_extractor/app/modules/utils/constant.dart';
import 'package:color_extractor/constant/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CEKeepAliveWrapper extends StatefulWidget {
  const CEKeepAliveWrapper(
      {Key? key, @required this.child, this.keepAlive = true})
      : super(key: key);

  final Widget? child;
  final bool keepAlive;

  @override
  State<CEKeepAliveWrapper> createState() => _CEKeepAliveWrapperState();
}

class _CEKeepAliveWrapperState extends State<CEKeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant CEKeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }
}

Container ceContainer(
    {double? width,
    double? height,
    double radius = 0,
    Color color = Colors.white,
    double borderWidth = 0.0,
    Color borderColor = const Color(0x00000fff),
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    Widget? child,
    Gradient? gradient,
    List<BoxShadow>? shadow,
    ImageProvider? bgImg,
    BoxFit? fit,
    Clip? clipBehavior}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radius)),
        border: Border.all(color: borderColor, width: borderWidth),
        color: color,
        gradient: gradient,
        boxShadow: shadow,
        image: bgImg != null
            ? DecorationImage(
                image: bgImg,
                fit: fit ?? BoxFit.contain,
              )
            : null),
    alignment: alignment,
    padding: padding,
    margin: margin,
    clipBehavior: clipBehavior ?? Clip.antiAlias,
    child: child,
  );
}

Widget ceTextbold(String text,
    {double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
    Color? textColor}) {
  return Text(
    text,
    style: TextStyle(
        color: textColor ?? black_title_color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight),
  );
}

Widget cecustom_cell_view(
    {required String title,
    double fontSize = 14,
    double height = 58,
    Widget? icon,
    String? rightIconName,
    EdgeInsets? margin,
    Color? titleColor}) {
  return ceContainer(
      radius: 8.w,
      height: height,
      width: double.infinity,
      margin : margin,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon ?? const SizedBox.shrink(),
          icon != null ? 5.horizontalSpace : const SizedBox.shrink(),
          Text(
            title,
            style: TextStyle(
                fontSize: fontSize.sp,
                color:titleColor ?? black_title_color,
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Image.asset(
            rightIconName ?? Assets.arrowRight,
            height: 20.h,
            width: 20.w,
          )
        ],
      ));
}
