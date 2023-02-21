import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relax_button/navigation/navigator.dart';

class RelaxButtonAppBar extends AppBar {
  RelaxButtonAppBar({
    Key? key,
    Widget? title,
    TextStyle? titleTextStyle,
    IconThemeData? iconTheme,
  }) : super(
          key: key,
          iconTheme: iconTheme ?? const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: title,
          titleTextStyle: titleTextStyle,
          leading: IconButton(
            splashRadius: 20.w,
            onPressed: () => navigator.currentState?.pop(),
            icon: const Icon(Icons.arrow_back_ios_new),
            splashColor: iconTheme?.color?.withOpacity(0.4),
            highlightColor: iconTheme?.color?.withOpacity(0.2),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
        );
}
