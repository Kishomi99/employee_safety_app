import '../core/app_export.dart';

class CustomDropdown extends StatelessWidget {
  final List<SelectionPopupModel>? items;
  final SelectionPopupModel? value;
  final Function(SelectionPopupModel)? onChanged;
  final FormFieldValidator<SelectionPopupModel>? validator;
  final bool isAsteriskRequired;
  final String? hintText;
  final Widget? icon;
  final Alignment? alignment;
  final DropDownVariant? variant;
  final FocusNode? focusNode;
  final String? lableText;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.value,
    required this.onChanged,
    this.validator,
    this.isAsteriskRequired = false,
    this.hintText,
    this.icon,
    this.alignment,
    this.variant,
    this.focusNode,
    this.lableText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildDropDownWidget(),
          )
        : _buildDropDownWidget();
  }

  _buildDropDownWidget() {
    int selectedID = 0;
    int i = 0;
    for (var ele in items!) {
      if (ele.isSelected) {
        selectedID = i;
      }
      i++;
    }
    return DropdownButtonFormField<SelectionPopupModel>(
      dropdownColor: AppColors.white,
      focusNode: focusNode,
      value: value ?? items?[selectedID],
      icon: icon ??
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.secondary,
            ),
            child: Icon(
              Icons.arrow_drop_down_sharp,
              size: 25,
              color: Colors.white,
            ),
          ),
      items: items?.map(
        (SelectionPopupModel item) {
          return DropdownMenuItem<SelectionPopupModel>(
            value: item,
            child: Text(item.title,
                style: items!.indexOf(item) == 0
                    ? GoogleFonts.poppins(color: Colors.grey)
                    : AppStyle.inputText),
          );
        },
      ).toList(),
      onChanged: onChanged != null
          ? (value) {
              if (onChanged != null) {
                onChanged!(value!);
              }
            }
          : null,
      validator: validator,
      decoration: InputDecoration(
        labelText: lableText,
        hintText: hintText,
        fillColor: _setFillColor(),
        filled: _setFilled(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 16.0,
        ),
      ),
    );
  }

  _setFillColor() {
    switch (variant) {
      default:
        return AppColors.white;
    }
  }

  _setFilled() {
    switch (variant) {
      case DropDownVariant.None:
        return false;
      default:
        return true;
    }
  }
}

enum DropDownVariant {
  None,
  OutlineBluegray100,
}
