import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_it/get_it.dart';
import 'package:stockpilelite/backend/item/item_service.dart';
import 'package:stockpilelite/shared/constants/app_color.dart';
import 'package:stockpilelite/shared/dtos/item_dto.dart';
import 'package:stockpilelite/shared/utils/size_util.dart';

class ItemCreateFormDialog extends StatefulWidget {
  final bool isView;
  final ItemDto item;

  ItemCreateFormDialog(this.isView, {this.item});

  @override
  _ItemCreateFormDialogState createState() => _ItemCreateFormDialogState(isView, item);
}

class _ItemCreateFormDialogState extends State<ItemCreateFormDialog> {
  _ItemCreateFormDialogState(this.isView, ItemDto dto) {
    if (dto != null) {
      this.item = dto;
    }
  }

  ItemDto item = ItemDto();
  bool isView;
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  double heightSeparation = 15;
  ItemService itemService = GetIt.I<ItemService>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Dialog(
          child: FormBuilder(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: SizeUtil.getWidthFromTotalAvailable(context, 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        'Item Information',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: heightSeparation + 5),
                    FormBuilderTextField(
                      initialValue: item.itemCode,
                      attribute: 'itemCode',
                      decoration: InputDecoration(labelText: 'Item Code'),
                    ),
                    SizedBox(height: heightSeparation),
                    FormBuilderTextField(
                      initialValue: item.name,
                      attribute: 'name',
                      decoration: InputDecoration(labelText: 'Name *'),
                      validators: [
                        FormBuilderValidators.required(
                            errorText: 'Item name is required')
                      ],
                    ),
                    SizedBox(height: heightSeparation),
                    FormBuilderTextField(
                      initialValue: item.brand,
                      attribute: 'brand',
                      decoration: InputDecoration(labelText: 'Brand'),
                    ),
                    SizedBox(height: heightSeparation),
                    FormBuilderTextField(
                      initialValue: '${item.capital ?? ''}',
                      attribute: 'capital',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Capital Price*'),
                      validators: [
                        FormBuilderValidators.required(
                            errorText: 'Capital price is required'),
                        FormBuilderValidators.min(0.1,
                            errorText: 'Value should not be zero')
                      ],
                    ),
                    SizedBox(height: heightSeparation),
                    FormBuilderTextField(
                      initialValue: '${item.retail ?? ''}',
                      attribute: 'retail',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Retail Price *'),
                      validators: [
                        FormBuilderValidators.required(
                            errorText: 'Retail price is required'),
                        FormBuilderValidators.min(0.1,
                            errorText: 'Value should not be zero')
                      ],
                    ),
                    SizedBox(height: heightSeparation),
                    FormBuilderTextField(
                      initialValue: '${item.wholeSale ?? ''}',
                      attribute: 'wholeSale',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Wholesale Price'),
                      validators: [
                        FormBuilderValidators.min(0.1,
                            errorText: 'Value should not be zero')
                      ],
                    ),
                    ButtonBar(
                      children: [
                        MaterialButton(
                            padding: EdgeInsets.all(15),
                            color: AppColor.error,
                            onPressed: close,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text('CANCEL')),
                        Visibility(
                          visible: !isView,
                          child: MaterialButton(
                              padding: EdgeInsets.all(15),
                              color: AppColor.secondary,
                              onPressed: saveAndContinue,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text('SAVE AND CONTINUE')),
                        ),
                        MaterialButton(
                            padding: EdgeInsets.all(15),
                            color: AppColor.primary,
                            onPressed: save,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text('SAVE')),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void close() {
    Navigator.pop(context);
  }

  void save() {
    if (formKey.currentState.saveAndValidate()) {
     var values = formKey.currentState.value;
     this.item.itemCode = values['itemCode'];
     this.item.name = values['name'];
     this.item.brand = values['brand'];
     this.item.retail = double.parse(values['retail']);
     this.item.capital = double.parse(values['capital']);
     this.item.wholeSale = double.parse(values['wholeSale']);
      if (item.id == null || item.id.isEmpty) {
        itemService.create(item);
      } else if (item.id.isNotEmpty) {
        itemService.update(item);
      }
      Navigator.pop(context);
      BotToast.showSimpleNotification(title: 'Success', backgroundColor: AppColor.primary);
    }

  }

  void saveAndContinue() {}
}
