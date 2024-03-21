import 'package:flutter/material.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_colors/nubank_colors.dart';
import 'package:nubank_home_reproduction/nubank_theme/nunbank_spacing/nubank_spacing.dart';
import 'package:shimmer/shimmer.dart';

class NuBalanceShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: NubankColors.nuLightGrey,
      highlightColor: NubankColors.nuGrey,
      child: ListTile(
        contentPadding: EdgeInsets.only(
          left: NubankSpacing.sp24,
          top: NubankSpacing.sp16,
          right: NubankSpacing.sp24,
        ),
        title: Container(
          height: NubankSpacing.sp18,
          color: NubankColors.nuLightLight,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: NubankSpacing.sp8),
          child: Container(
            height: NubankSpacing.sp24,
            color: NubankColors.nuLightLight,
          ),
        ),
      ),
    );
  }
}
