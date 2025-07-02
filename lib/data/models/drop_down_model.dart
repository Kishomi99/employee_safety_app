import 'package:application/data/models/selection_popup_model/selection_popup_model.dart';
import 'package:get/get.dart';

class DropDownModel {
  Rx<List<SelectionPopupModel>> genderItemList = Rx([
    SelectionPopupModel(
      id: 0,
      title: "Select a Gender",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 1,
      title: "Male",
    ),
    SelectionPopupModel(
      id: 2,
      title: "Female",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Other",
    )
  ]);

  Rx<List<SelectionPopupModel>> roleItemList = Rx([
    SelectionPopupModel(
      id: 0,
      title: "Select a Role",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 1,
      title: "Manager",
    ),
    SelectionPopupModel(
      id: 2,
      title: "Employee",
    ),
  ]);
}
