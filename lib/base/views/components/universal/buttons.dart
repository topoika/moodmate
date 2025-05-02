// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "../components.dart";

class PrimaryButton extends StatelessWidget {
  final String text;
  final double? padding;
  final double? radius;
  final bool? loading;
  final bool? isActive;
  final bool? isOutline;
  final Color? bgColor;
  final Color? textColor;
  final Function? onPressed;

  const PrimaryButton({
    super.key,

    required this.text,
    this.padding = 13,
    this.radius = 5,
    this.loading = false,
    this.isActive = true,
    this.isOutline = false,
    this.bgColor = Colors.white,
    this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool active = isActive ?? true;
    final bool outlined = isOutline ?? false;
    final Color defaultBgColor =
        active ? (bgColor ?? Theme.of(context).primaryColor) : Colors.grey;
    final Color defaultTextColor =
        textColor ?? (outlined ? Theme.of(context).primaryColor : Colors.white);
    final BorderSide borderSide =
        outlined
            ? BorderSide(color: bgColor ?? Colors.white, width: 1.5)
            : BorderSide(color: bgColor ?? Colors.white, width: 1.5);

    return GestureDetector(
      onTap: active ? onPressed as void Function()? : null,
      child: Container(
        decoration: BoxDecoration(
          color: outlined ? Colors.transparent : defaultBgColor,
          borderRadius: BorderRadius.circular(radius!),
          border: Border.fromBorderSide(borderSide),
        ),
        padding: EdgeInsets.symmetric(vertical: padding!),
        child: Center(
          child:
              loading!
                  ? const CupertinoActivityIndicator(
                    radius: 10,
                    color: Colors.white,
                  )
                  : Text(
                    text,
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                      color: defaultTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
        ),
      ),
    );
  }
}

// image button
class ImageButton extends StatelessWidget {
  final String image;
  final double? padding;
  final Function? onPressed;
  final bool? isActive;
  final bool? loading;
  final Color? bgColor;
  final Color? imageColor;
  const ImageButton({
    super.key,
    required this.image,
    this.onPressed,
    this.padding = 10,
    this.isActive = true,
    this.loading = false,
    this.bgColor,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive! ? onPressed as void Function()? : null,
      child: Container(
        padding: EdgeInsets.all(padding!),
        decoration: BoxDecoration(
          color: bgColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child:
              loading!
                  ? const CupertinoActivityIndicator(
                    color: Colors.white,
                    radius: 10,
                  )
                  : Image.asset(
                    image,
                    height: 30,
                    width: 30,
                    color: imageColor ?? Colors.white,
                  ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final Color? textColor;
  final double? fontSize;
  final bool? isActive;
  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.fontSize,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isActive! && onPressed != null) {
          onPressed!();
        }
      },
      child: Text(
        text,
        textScaler: TextScaler.noScaling,
        style: TextStyle(
          color: textColor ?? context.primaryColor,
          fontSize: fontSize ?? 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  final Function? onPressed;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  const BackButtonWidget({super.key, this.onPressed, this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.pop(context);
        }
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: padding ?? EdgeInsets.only(left: hPadding, top: 5),
          child: Image.asset(
            AppIcons.backIcon,
            width: 25,
            height: 25,
            color: color ?? context.primaryColor,
          ),
        ),
      ),
    );
  }
}

class SmallButtonWidget extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final bool? isActive;
  final bool? loading;
  final Color? bgColor;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;

  const SmallButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.isActive = true,
    this.loading = false,
    this.bgColor,
    this.textColor,
    this.fontSize,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive! ? onPressed as void Function()? : null,
      child: Container(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 40, vertical: 5),
        decoration: BoxDecoration(
          color: bgColor ?? context.primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child:
            loading!
                ? const CupertinoActivityIndicator(
                  color: Colors.white,
                  radius: 8,
                )
                : Text(
                  text,
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      ),
    );
  }
}
