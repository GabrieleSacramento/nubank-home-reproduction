import 'package:flutter/material.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_colors/nubank_colors.dart';
import 'package:nubank_home_reproduction/nubank_theme/nunbank_spacing/nubank_spacing.dart';

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({super.key});

  static Future<T?> showBottomSheet<T>({
    required Widget child,
    required BuildContext context,
    bool isDismissible = true,
    bool enableDrag = true,
    bool showCloseButton = true,
    VoidCallback? onPop,
    IconData? closeButtonIcon,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      builder: (context) {
        return showCloseButton
            ? PopScope(
                canPop: true,
                onPopInvoked: (_) {
                  onPop?.call();
                },
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: NubankSpacing.sp24,
                          right: NubankSpacing.sp24,
                          top: NubankSpacing.sp60,
                          bottom: NubankSpacing.sp24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                onPop?.call();
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                closeButtonIcon ?? Icons.close,
                                color: NubankColors.nuLightGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      child,
                    ],
                  ),
                ),
              )
            : SafeArea(child: child);
      },
      backgroundColor: NubankColors.nuWhite,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20.0,
          ),
        ),
      ),
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
