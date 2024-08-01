
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppUtil {
  static keyboardDismiss(
    BuildContext context,
  ) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static copyToClipboard({
    required String text,
    Function? copyBlock,
  }) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (copyBlock != null) {
      copyBlock();
    }
  }

  static getCopyFromClipboard() {
    return Clipboard.getData(Clipboard.kTextPlain);
  }
}





