import 'package:flutter/cupertino.dart';

class ChipFlyTextWidget extends StatelessWidget {
  ChipFlyTextWidget({required this.maxWidth, this.parValue});

  int? parValue;
  double maxWidth = double.infinity;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Text(
        textAlign: TextAlign.center,
        (parValue ?? 0) > 0 ? "${parValue}" : "",
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
      d = 14.0;
    } else if (parValue <= 999) {
      d = 10.0;
    } else if (parValue <= 9999) {
      d = 8.0;
    } else {
      d = 6.0;
    }

    return d;
  }
}
