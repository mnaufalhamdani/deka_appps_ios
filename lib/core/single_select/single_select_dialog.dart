
// ignore_for_file: prefer_const_constructors

import 'package:deka_appps_ios/core/single_select/item_single_select.dart';
import 'package:deka_appps_ios/core/single_select/single_select_domain.dart';
import 'package:flutter/material.dart';

import '../../resource/colors.dart';

dialogSingleSelect(
    BuildContext context,
    List<SingleSelectDomain> listItem,
    final void Function(int idIndex, SingleSelectDomain model) onPressed) {
  return showModalBottomSheet(
      context: context,
      isDismissible: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => SizedBox(
          height: double.infinity,
          child: Column(
              children: [
                Padding(padding: EdgeInsets.all(20),
                    child: Text("Pilih Salah Satu Item",
                        style: TextStyle(
                            color: colorText,
                            fontWeight: FontWeight.w800,
                            fontSize: 16)
                    )
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder:  (context, index){
                    return ItemSingleSelect(
                      position: index,
                      model: listItem[index],
                      onPressed: (position, model) {
                        onPressed(position, model);
                        Navigator.pop(context);
                      },
                    );
                  },
                  itemCount: listItem.length,
                )
              ]
          )
      )
  );
}