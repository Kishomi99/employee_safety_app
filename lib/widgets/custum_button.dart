import 'package:application/core/app_export.dart';

class CustumButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final bool? isOutlined;

  const CustumButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.height,
    this.width,
    this.isOutlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double buttonWidth = screenSize.width * 0.9;
    final double buttonHeight = screenSize.height * 0.08;

    final ButtonStyle buttonStyle = ButtonStyle(
      minimumSize: MaterialStateProperty.all(
        Size(
          width ?? buttonWidth,
          height ?? buttonHeight,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      backgroundColor: (isOutlined ?? false)
          ? MaterialStateProperty.all(backgroundColor ?? AppColors.white)
          : MaterialStateProperty.all(backgroundColor ?? AppColors.primary),
      side: (isOutlined ?? false)
          ? MaterialStateProperty.all(
              BorderSide(color: backgroundColor ?? AppColors.primary, width: 2),
            )
          : null,
      elevation: MaterialStateProperty.all((isOutlined ?? false) ? 0 : 10),
    );

    final Widget buttonChild = Text(
      text,
      style: AppStyle.homeWhite.copyWith(
        color: (isOutlined ?? false)
            ? (backgroundColor ?? AppColors.primary)
            : Colors.white,
      ),
    );

    return (isOutlined ?? false)
        ? OutlinedButton(
            style: buttonStyle,
            onPressed: onPressed,
            child: buttonChild,
          )
        : ElevatedButton(
            style: buttonStyle,
            onPressed: onPressed,
            child: buttonChild,
          );
  }
}
