import 'package:flutter/material.dart';
import 'package:flutter_main/utils/log_util.dart';
import 'package:get/get.dart';

import 'chip_custom_controller.dart';
import 'numer_button.dart';

typedef OnSubmit = void Function(String text);

class ChipCustomPage extends StatelessWidget {
  ChipCustomPage({
    Key? key,
    this.parValue,
    this.onSubmit,
  }) : super(key: key);
  OnSubmit? onSubmit;
  int? parValue;

  final ChipCustomController ctl = Get.put(ChipCustomController());

  @override
  Widget build(BuildContext context) {
    var textEditingController = ctl.textEditingController;
    ctl.parValue = parValue;
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.close)),
              const Text(
                '自定义筹码金额',
                style: TextStyle(fontSize: 16, color: Color(0xff32435d)),
              ),
              SizedBox.square(
                dimension: 1,
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            // height: 50,
            child: Center(
              child: TextField(
                controller: ctl.textEditingController,
                textAlign: TextAlign.center,
                showCursor: false,
                style: TextStyle(fontSize: 15),
                // Disable the default soft keybaord
                keyboardType: TextInputType.none,

                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "请输入1~9999999",
                  hintStyle: TextStyle(fontSize: 15, color: Color(0xff999999)),
                  filled: true,
                  // border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color(0x55cccccc),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color(0x55cccccc),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color(0x55cccccc),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // implement the number keys (from 0 to 9) with the NumberButton widget
            // the NumberButton widget is defined in the bottom of this file
            children: [
              NumberButton(
                number: 1,
                controller: textEditingController,
              ),
              NumberButton(
                number: 2,
                controller: textEditingController,
              ),
              NumberButton(
                number: 3,
                controller: textEditingController,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 4,
                controller: textEditingController,
              ),
              NumberButton(
                number: 5,
                controller: textEditingController,
              ),
              NumberButton(
                number: 6,
                controller: textEditingController,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 7,
                controller: textEditingController,
              ),
              NumberButton(
                number: 8,
                controller: textEditingController,
              ),
              NumberButton(
                number: 9,
                controller: textEditingController,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // this button is used to delete the last number
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size.fromWidth(85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  delete();
                },
                child: Center(
                  child: Text(
                    "删除",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9ba5be),
                        fontSize: 15),
                  ),
                ),
              ),
              NumberButton(
                number: 0,
                controller: textEditingController,
              ),

              ElevatedButton(
                //icon_selected_chip_confrom
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff324d84),
                  fixedSize: Size.fromWidth(85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  onSubmitInto();
                },
                child: Center(
                  child: Text(
                    "确定",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  delete() {
    ctl.textEditingController.text = ctl.textEditingController.text
        .substring(0, ctl.textEditingController.text.length - 1);
  }

  onSubmitInto() {
    if (null != onSubmit) {
      onSubmit!(ctl.textEditingController.text);
    }
  }
}
