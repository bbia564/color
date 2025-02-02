import 'package:flutter/material.dart';


class CEColorUtil {



  static Color ceColorWithHex(String hex, {double alpha = 1}) {
    int? val;
    if (hex.toUpperCase().contains("#")) {
      hex = hex.substring(1);
    }
    if (hex.toUpperCase().contains("0X")) {
      String desString = hex.substring(2);
      val = int.tryParse("0x$desString");
    } else {
      val = int.tryParse("0x$hex");
    }

    if (alpha > 1) {
      alpha = 1;
    } else if (alpha < 0) {
      alpha = 0;
    }

    return Color.fromRGBO((val! & 0xFF0000) >> 16, (val & 0x00FF00) >> 8,
        (val & 0x0000FF) >> 0, alpha);
  }


}
