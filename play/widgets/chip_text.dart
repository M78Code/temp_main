import 'package:flutter/cupertino.dart';

class ChipTextWidget extends StatelessWidget {
  ChipTextWidget({required this.maxWidth, this.parValue});

  int? parValue;
  double maxWidth = double.infinity;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Text(
        textAlign: TextAlign.center,
        (parValue ?? 0) > 0 ? "${parValue}" : "自定义",
        style: TextStyle(
          fontFamily: 'Besley',
          fontWeight: FontWeight.bold,
          height: 0.9,
          fontSize: _handleFontSize(parValue ?? 0),
          color: Color(
            0xff505050,
          ),
        ),
      ),
    );
  }

  _handleFontSize(int parValue) {
    var d = 10.0;
    if (0 == parValue) {
      d = 10.0;
    } else if (parValue <= 99) {
      d = 20.0;
    } else if (parValue <= 999) {
      d = 16.0;
    } else if (parValue <= 9999) {
      d = 12.0;
    } else {
      d = 12.0;
    }

    return d;
  }
}
