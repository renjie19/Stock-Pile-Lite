import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:stockpilelite/backend/item/item_service.dart';
import 'package:stockpilelite/shared/constants/app_color.dart';
import 'package:stockpilelite/shared/dtos/item_dto.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final ItemService service = GetIt.I<ItemService>();
  List<ItemDto> items = [];
  String filter = '';

  @override
  bool get mounted {
    this.items = service.findAll();
    return super.mounted;
  }

  @override
  void initState() {
    items.add(getItemDto());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  () => FocusScope.of(context).unfocus(),
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
                      width: (MediaQuery.of(context).size.width / 10) * 3,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {},
                        color: AppColor.error,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'ADD ITEM',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                    )
                  ],
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Brand')),
                      DataColumn(label: Text('Retail'), numeric: true),
                      DataColumn(label: Text('Wholesale'), numeric: true),
                      DataColumn(label: Text('Capital'), numeric: true),
                    ],
                    rows: List.generate(this.filteredItems(this.filter).length,
                        (index) {
                      ItemDto item = this.filteredItems(filter)[index];
                      return DataRow.byIndex(cells: [
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

  ItemDto getItemDto() {
    ItemDto item = ItemDto();
    item.id = '01-00001';
    item.name = 'Tinapa';
    item.brand = 'Ligo';
    item.retail = 15.0;
    item.wholeSale = 14.0;
    item.capital = 13.5;
    return item;
  }
}

class ItemListDataSource extends DataTableSource {
  List<ItemDto> _items = [];

  ItemListDataSource(List<ItemDto> items) {
    this._items = items;
  }

  @override
  DataRow getRow(int index) {
    ItemDto item = _items[index];
    if (_items.isEmpty) {
      return DataRow.byIndex(cells: [
        // TODO: add item code
        DataCell(Text('No Data Available'))
      ]);
    }
    return DataRow.byIndex(cells: [
      // TODO: add item code
      DataCell(Text(item.name)),
      DataCell(Text(item.brand)),
      DataCell(Text('${item.retail}')),
      DataCell(Text('${item.wholeSale}')),
      DataCell(Text('${item.capital}')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _items.length;

  @override
  int get selectedRowCount => 0;
}
