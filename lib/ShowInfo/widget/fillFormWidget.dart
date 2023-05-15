// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:exam_flutter/Data/data.dart';
import 'package:exam_flutter/ShowInfo/widget/bloc/show_info_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String tmpList = provinceList[0];

class FillFormWidget extends StatelessWidget {
  const FillFormWidget(
      {super.key,
      this.title,
      this.items,
      this.valueDropdown,
      this.isDropdown = false,
      this.maxLength,
      this.onChangeTextFormField,
      this.controller,
      this.globalKey});
  final String? title;
  final List<String>? items;
  final String? valueDropdown;
  final bool isDropdown;
  final int? maxLength;
  final void Function(String)? onChangeTextFormField;
  final TextEditingController? controller;
  final Key? globalKey;

  @override
  Widget build(BuildContext context) {
    if (valueDropdown != null) {
      tmpList = valueDropdown!;
    } else {
      tmpList = provinceList[0];
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title!),
        isDropdown
            ? DropDown(
                items: items,
              )
            : formBox(
                title: title,
                maxLength: maxLength,
                onChangeTextFormField: onChangeTextFormField,
                controller: controller,
                key: globalKey,
              ),
      ],
    );
  }
}

Container formBox(
    {String? title,
    int? maxLength,
    void Function(String)? onChangeTextFormField,
    TextEditingController? controller,
    Key? key}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 15, 0, 40),
    child: Form(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 253, 249, 237),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              controller: controller,
              maxLength: maxLength,
              maxLines: null,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'กรุณากรอก$titleของคุณ';
                }
                return null;
              },
              decoration: InputDecoration.collapsed(
                hintText: 'กรุณากรอก$titleของคุณ',
              ),
              onChanged: onChangeTextFormField,
            ),
          ),
        ],
      ),
    ),
  );
}

class DropDown extends StatelessWidget {
  const DropDown({super.key, this.items});

  final List<String>? items;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowInfoBlocBloc(),
      child: BlocBuilder<ShowInfoBlocBloc, DropdownProvinceState>(
        buildWhen: (previous, current) => previous.province != current.province,
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 0, bottom: 0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 253, 249, 237),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton(
                      value: tmpList,
                      isExpanded: true,
                      isDense: true,
                      items: [
                        for (int i = 0; i <= items!.length - 1; i++) items![i]
                      ]
                          .map(
                            (String value) => DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                      onChanged: (String? tmp) {
                        tmpList = tmp!;
                        BlocProvider.of<ShowInfoBlocBloc>(context)
                            .add(DropdownProvinceEvent(province: tmpList));
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
