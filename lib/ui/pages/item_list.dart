import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:stockpilelite/backend/item/item_service.dart';
import 'package:stockpilelite/shared/constants/app_color.dart';
import 'package:stockpilelite/shared/dtos/item_dto.dart';
import 'package:stockpilelite/shared/utils/size_util.dart';
import 'package:stockpilelite/ui/forms/item_create_form_dialog.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final ItemService service = GetIt.I<ItemService>();
  List<ItemDto> items = [];
  String filter = '';

  @override
  void initState() {
    this.items = service.findAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: SizeUtil.getWidthFromTotalAvailable(context, 30),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Search Item...',
                                  prefixIcon: Icon(LineAwesomeIcons.search)),
                              onChanged: (value) =>
                                  setState(() => this.filter = value)),
                        ),
                      ),
                      ButtonBar(children: [
                        MaterialButton(
                          padding: EdgeInsets.all(15),
                          color: AppColor.secondary,
                          onPressed: () => showItemCreateFormDialog(false),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Row(children: [
                            Icon(LineAwesomeIcons.plus),
                            SizedBox(width: 10),
                            Text(
                              'ADD ITEM',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                        ),
                      ])
                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: DataTable(
                      showCheckboxColumn: false,
                      columns: [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Brand')),
                        DataColumn(label: Text('Retail'), numeric: true),
                        DataColumn(label: Text('Wholesale'), numeric: true),
                        DataColumn(label: Text('Capital'), numeric: true),
                      ],
                      rows: List.generate(
                          this.filteredItems(this.filter).length, (index) {
                        ItemDto item = this.filteredItems(filter)[index];
                        return DataRow(
                            onSelectChanged: (selected) => showItemCreateFormDialog(true, dto: item),
                            cells: [
                              // TODO: add item code
                              DataCell(Text(item.name)),
                              DataCell(Text(item.brand)),
                              DataCell(Text('${item.retail}')),
                              DataCell(Text('${item.wholeSale}')),
                              DataCell(Text('${item.capital}')),
                            ]);
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  filteredItems(String filter) {
    if (filter.trim().isEmpty) {
      return this.items;
    }
    return items.where((item) {
      return item.name.contains(filter) ||
          item.brand.contains(filter) ||
          item.retail.toString().contains(filter) ||
          item.wholeSale.toString().contains(filter) ||
          item.capital.toString().contains(filter);
    }).toList();
  }

  showItemCreateFormDialog(bool isView, {ItemDto dto}) async {
    await showDialog<Dialog>(
        barrierDismissible: false,
        context: context,
        builder: (context) => ItemCreateFormDialog(isView, item: dto));
    setState(() => this.items = service.findAll());
  }
}
