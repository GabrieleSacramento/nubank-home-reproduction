import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_icons/nubank_icons.dart';
import 'package:nubank_home_reproduction/src/modules/home/cubits/get_balance_cubit.dart';
import 'package:nubank_home_reproduction/src/modules/my_cards/presentation/widgets/balance_shimmer.dart';
import 'package:nubank_home_reproduction/src/modules/my_cards/presentation/widgets/my_cards_widget.dart';
import 'package:nubank_home_reproduction/src/setup/setup.dart';
import 'package:nubank_home_reproduction/src/shared/formatters/formatters.dart';
import 'package:nubank_home_reproduction/src/shared/widgets/base_bottom_sheet.dart';
import 'package:nubank_home_reproduction/src/utils/localizations.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_colors/nubank_colors.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_font_style/nubank_font_style.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_font_style/nubank_text_style.dart';
import 'package:nubank_home_reproduction/nubank_theme/nunbank_spacing/nubank_spacing.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NubankHomePage extends StatefulWidget {
  const NubankHomePage({super.key});

  @override
  State<NubankHomePage> createState() => _NubankHomePageState();
}

final ValueNotifier<bool> isBalanceVisible = ValueNotifier<bool>(true);

class _NubankHomePageState extends State<NubankHomePage> {
  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return BlocProvider(
      create: (context) => setup.get<GetBalanceCubit>()..getBalance(),
      child: Scaffold(
        appBar: _NuAppBar(
          balanceVisibleOnTap: () {
            isBalanceVisible.value = !isBalanceVisible.value;
            setState(() {});
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<GetBalanceCubit, GetBalanceState>(
                builder: (context, state) {
                  if (state is GetBalanceLoading) {
                    return NuBalanceShimmerWidget();
                  }

                  if (state is GetBalanceSuccess) {
                    return _NuBalanceWidget(
                      balance: isBalanceVisible.value
                          ? NubankText(
                              '${state.balance.availableAmount.toCurrency()}',
                              textStyle: NubankFontStyle.bodyLargerShort(),
                            )
                          : NubankText(
                              '....',
                              textStyle: NubankFontStyle.bodyLargerStandard(),
                            ),
                    );
                  }
                  if (state is GetBalanceError) {
                    return NubankText(
                      strings.appTitle,
                      textStyle: NubankFontStyle.bodyLargerShort(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              _NuTransactionsOptionsCarousel(),
              _NuMyCardsWidget(),
              _NuFinancialServicesCarousel(),
              _NuRequestCreditCardWidget(),
              Padding(
                padding: const EdgeInsets.only(
                  left: NubankSpacing.sp24,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: NubankText(
                    strings.discoverMore,
                    textStyle: NubankFontStyle.bodyLargerShort(),
                  ),
                ),
              ),
              _NuDiscoverMoreCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NuDiscoverMoreCarousel extends StatelessWidget {
  const _NuDiscoverMoreCarousel();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        _NuDiscoverMoreWidget(
          image:
              'https://images.unsplash.com/photo-1616077167599-cad3639f9cbd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Portabilidade de salário',
          subtitle: 'Sua liberdade financeira comeca com você escolhendo...',
          onTap: () {},
        ),
        _NuDiscoverMoreWidget(
          image:
              'https://images.unsplash.com/photo-1616077167599-cad3639f9cbd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Portabilidade de salário',
          subtitle: 'Sua liberdade financeira comeca com você escolhendo...',
          onTap: () {},
        ),
      ],
      options: CarouselOptions(
        scrollPhysics: BouncingScrollPhysics(),
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        viewportFraction: 0.7,
        padEnds: false,
        aspectRatio: 50 / 50,
        enableInfiniteScroll: false,
      ),
    );
  }
}

class _NuDiscoverMoreWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _NuDiscoverMoreWidget({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NubankSpacing.sp24,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.only(
            top: NubankSpacing.sp24,
            bottom: NubankSpacing.sp32,
          ),
          decoration: BoxDecoration(
            color: NubankColors.nuGrey,
            borderRadius: BorderRadius.circular(
              NubankSpacing.sp8,
            ),
          ),
          height: NubankSpacing.sp272,
          width: NubankSpacing.sp236,
          child: Column(
            children: [
              Container(
                height: NubankSpacing.sp120,
                width: NubankSpacing.sp236,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(NubankSpacing.sp8),
                    topRight: Radius.circular(NubankSpacing.sp8),
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: NubankSpacing.sp16,
                  left: NubankSpacing.sp16,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: NubankText(
                        title,
                        textStyle: NubankFontStyle.bodyMediumStandard(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: NubankSpacing.sp8,
                      ),
                      child: NubankText(
                        subtitle,
                        textStyle: NubankFontStyle.auxiliarMediumLight(),
                      ),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: NubankColors.nuPurple,
                            borderRadius: BorderRadius.circular(
                              NubankSpacing.sp50,
                            ),
                          ),
                          height: NubankSpacing.sp46,
                          width: NubankSpacing.sp128,
                          child: Center(
                            child: NubankText(
                              strings.know,
                              textStyle:
                                  NubankFontStyle.bodyMediumStandardLight(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NuRequestCreditCardWidget extends StatelessWidget {
  const _NuRequestCreditCardWidget();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: NubankSpacing.sp32,
          ),
          child: Divider(
            color: NubankColors.nuGrey,
            height: NubankSpacing.sp4,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: NubankSpacing.sp24,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: ColorFiltered(
              colorFilter:
                  ColorFilter.mode(NubankColors.nuBlack, BlendMode.srcIn),
              child: SvgPicture.asset(
                NubankIcons.card,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: NubankSpacing.sp16,
            left: NubankSpacing.sp24,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: NubankText(
              strings.creditCard,
              textStyle: NubankFontStyle.bodyLargerStandard(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: NubankSpacing.sp16,
            left: NubankSpacing.sp24,
            right: NubankSpacing.sp24,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: NubankText(
              strings.creditCardDescription,
              textStyle: NubankFontStyle.bodyMediumShort(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: NubankSpacing.sp16,
            left: NubankSpacing.sp24,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                color: NubankColors.nuPurple,
                borderRadius: BorderRadius.circular(
                  NubankSpacing.sp50,
                ),
              ),
              height: NubankSpacing.sp46,
              width: NubankSpacing.sp128,
              child: Center(
                child: NubankText(
                  strings.requestCard,
                  textStyle: NubankFontStyle.bodyMediumStandardLight(),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: NubankSpacing.sp32,
          ),
          child: Divider(
            color: NubankColors.nuGrey,
            height: NubankSpacing.sp4,
          ),
        ),
      ],
    );
  }
}

class _NuFinancialServicesCarousel extends StatelessWidget {
  const _NuFinancialServicesCarousel();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        _NuFinancialServicesWidget(
          text: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Seu',
                  style: TextStyle(
                    color: NubankColors.nuBlack,
                    fontSize: NubankSpacing.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' informe de rendimentos',
                  style: TextStyle(
                    color: NubankColors.nuPurple,
                    fontSize: NubankSpacing.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' 2021 já está disponível',
                  style: TextStyle(
                    color: NubankColors.nuBlack,
                    fontSize: NubankSpacing.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        _NuFinancialServicesWidget(
          text: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Seu',
                  style: TextStyle(
                    color: NubankColors.nuBlack,
                    fontSize: NubankSpacing.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' informe de rendimentos',
                  style: TextStyle(
                    color: NubankColors.nuPurple,
                    fontSize: NubankSpacing.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' 2021 já está disponível',
                  style: TextStyle(
                    color: NubankColors.nuBlack,
                    fontSize: NubankSpacing.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        _NuFinancialServicesWidget(
          text: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Seu',
                  style: TextStyle(
                    color: NubankColors.nuBlack,
                    fontSize: NubankSpacing.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' informe de rendimentos',
                  style: TextStyle(
                    color: NubankColors.nuPurple,
                    fontSize: NubankSpacing.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' 2021 já está disponível',
                  style: TextStyle(
                    color: NubankColors.nuBlack,
                    fontSize: NubankSpacing.sp14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        scrollPhysics: BouncingScrollPhysics(),
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        viewportFraction: 0.7,
        padEnds: false,
        aspectRatio: 50 / 15,
        enableInfiniteScroll: false,
      ),
    );
  }
}

class _NuFinancialServicesWidget extends StatelessWidget {
  final RichText text;
  const _NuFinancialServicesWidget({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(
            top: NubankSpacing.sp40,
            left: NubankSpacing.sp24,
          ),
          decoration: BoxDecoration(
            color: NubankColors.nuGrey,
            borderRadius: BorderRadius.circular(
              NubankSpacing.sp12,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: NubankSpacing.sp14,
              top: NubankSpacing.sp18,
              bottom: NubankSpacing.sp20,
              right: NubankSpacing.sp14,
            ),
            child: text,
          ),
          height: NubankSpacing.sp80,
          width: NubankSpacing.sp254,
        ),
      ),
    );
  }
}

class _NuMyCardsWidget extends StatelessWidget {
  const _NuMyCardsWidget();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return GestureDetector(
      onTap: () {
        BaseBottomSheet.showBottomSheet(
          context: context,
          child: MyCardsWidget(),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: NubankSpacing.sp24,
          right: NubankSpacing.sp24,
        ),
        decoration: BoxDecoration(
          color: NubankColors.nuGrey,
          borderRadius: BorderRadius.circular(
            NubankSpacing.sp12,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: NubankSpacing.sp16,
                top: NubankSpacing.sp16,
                bottom: NubankSpacing.sp16,
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  NubankColors.nuBlack,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  NubankIcons.card,
                  width: NubankSpacing.sp16,
                  height: NubankSpacing.sp22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: NubankSpacing.sp14,
                top: NubankSpacing.sp18,
                bottom: NubankSpacing.sp20,
              ),
              child: NubankText(
                strings.myCards,
                textStyle: NubankFontStyle.bodyMediumShort(),
              ),
            ),
          ],
        ),
        height: NubankSpacing.sp56,
      ),
    );
  }
}

class _NuTransactionsOptionsCarousel extends StatelessWidget {
  const _NuTransactionsOptionsCarousel();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return Padding(
      padding: const EdgeInsets.only(
          top: NubankSpacing.sp24, left: NubankSpacing.sp16),
      child: CarouselSlider(
        items: [
          _NuTransactionOption(
            title: strings.pixArea,
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                NubankColors.nuBlack,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                NubankIcons.pix,
              ),
            ),
            onTap: () {},
          ),
          _NuTransactionOption(
            title: strings.pay,
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                NubankColors.nuBlack,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                NubankIcons.pay,
              ),
            ),
            onTap: () {},
          ),
          _NuTransactionOption(
            title: strings.transfer,
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                NubankColors.nuBlack,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                NubankIcons.transfer,
              ),
            ),
            onTap: () {},
          ),
          _NuTransactionOption(
            title: strings.deposit,
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                NubankColors.nuBlack,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                NubankIcons.deposit,
              ),
            ),
            onTap: () {},
          ),
          _NuTransactionOption(
            title: strings.cellPhoneRecharge,
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                NubankColors.nuBlack,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                NubankIcons.phone,
              ),
            ),
            onTap: () {},
          ),
          _NuTransactionOption(
            title: strings.getALoan,
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                NubankColors.nuBlack,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                NubankIcons.money,
              ),
            ),
            onTap: () {},
          ),
          _NuTransactionOption(
            title: strings.charge,
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                NubankColors.nuBlack,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                NubankIcons.card,
              ),
            ),
            onTap: () {},
          ),
        ],
        options: CarouselOptions(
          scrollPhysics: BouncingScrollPhysics(),
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          viewportFraction: 0.22,
          padEnds: false,
          aspectRatio: 40 / 15,
          enableInfiniteScroll: false,
        ),
      ),
    );
  }
}

class _NuTransactionOption extends StatelessWidget {
  final ColorFiltered icon;
  final String title;
  final VoidCallback onTap;
  const _NuTransactionOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(NubankSpacing.sp24),
            decoration: BoxDecoration(
              color: NubankColors.nuGrey,
              borderRadius: BorderRadius.circular(NubankSpacing.sp50),
            ),
            width: NubankSpacing.sp72,
            height: NubankSpacing.sp72,
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.only(top: NubankSpacing.sp10),
            child: NubankText(
              title,
              textAlign: TextAlign.center,
              textStyle: NubankFontStyle.bodyMediumShort(),
            ),
          ),
        ],
      ),
    );
  }
}

class _NuBalanceWidget extends StatelessWidget {
  final Widget balance;
  const _NuBalanceWidget({required this.balance});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: NubankSpacing.sp24,
        top: NubankSpacing.sp16,
        right: NubankSpacing.sp24,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NubankText(
            strings.account,
            textStyle: NubankFontStyle.bodyLargerShort(),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: NubankColors.nuLightGrey,
            size: NubankSpacing.sp24,
          ),
        ],
      ),
      subtitle: balance,
    );
  }
}

class _NuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function() balanceVisibleOnTap;
  const _NuAppBar({required this.balanceVisibleOnTap});

  Size get preferredSize => Size.fromHeight(_appBarHeight);
  static const double _appBarHeight = NubankSpacing.sp124;

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: NubankColors.nuPurple,
          expandedHeight: _appBarHeight,
          title: Container(
            padding: EdgeInsets.only(
              left: NubankSpacing.sp10,
              right: NubankSpacing.sp10,
            ),
            decoration: BoxDecoration(
              color: NubankColors.nuLightLight,
              borderRadius: BorderRadius.circular(NubankSpacing.sp24),
            ),
            width: NubankSpacing.sp46,
            height: NubankSpacing.sp46,
            child: SvgPicture.asset(
              NubankIcons.profile,
            ),
          ),
          titleSpacing: NubankSpacing.sp24,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: balanceVisibleOnTap,
                  child: SvgPicture.asset(
                    isBalanceVisible.value
                        ? NubankIcons.openEye
                        : NubankIcons.closedEye,
                    width: NubankSpacing.sp24,
                    height: NubankSpacing.sp24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: NubankSpacing.sp24, right: NubankSpacing.sp24),
                  child: Stack(
                    children: <Widget>[
                      SvgPicture.asset(
                        NubankIcons.message,
                        width: NubankSpacing.sp24,
                        height: NubankSpacing.sp24,
                      ),
                      Positioned(
                        right: 0,
                        bottom: -3,
                        child: Icon(
                          Icons.message,
                          size: NubankSpacing.sp10,
                          color: NubankColors.nuWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: NubankSpacing.sp24),
                  child: SvgPicture.asset(
                    NubankIcons.help,
                    width: NubankSpacing.sp24,
                    height: NubankSpacing.sp24,
                  ),
                ),
              ],
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(NubankSpacing.sp14),
            child: Padding(
              padding: const EdgeInsets.only(
                left: NubankSpacing.sp24,
                bottom: NubankSpacing.sp24,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: NubankText('${strings.hello}, Gabriele Sacramento',
                    textStyle: NubankFontStyle.bodyLargerShortLight()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
