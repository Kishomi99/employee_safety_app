import 'package:application/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isAsteriskRequired;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.isAsteriskRequired = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label.tr, style: AppStyle.lableText),
            if (isAsteriskRequired) const SizedBox(width: 5),
            if (isAsteriskRequired)
              Text(
                '*',
                style: AppStyle.lableText.copyWith(color: Colors.red),
              ),
          ],
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          style: AppStyle.inputText,
          autofocus: false,
          decoration: InputDecoration(
            hintText: hintText.tr,
            hintStyle: AppStyle.inputText.copyWith(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 16.0,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            filled: true,
            fillColor: AppColors.white,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
