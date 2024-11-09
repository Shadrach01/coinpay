import 'package:coin_pay/core/common/widgets/app_container.dart';
import 'package:coin_pay/core/common/widgets/app_text_field.dart';
import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/core/utils/image_res.dart';
import 'package:flutter/material.dart';

class HomePageWidgets extends StatelessWidget {
  const HomePageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 15,
          left: 15,
          top: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.emoji_events,
                  color: ColorRes.bgLightColor,
                ),
                SearchTextFormWidget(),
                Icon(
                  Icons.notifications,
                  color: ColorRes.bgLightColor,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageRes.US,
                  height: 15,
                  width: 15,
                ),
                const SizedBox(width: 5),
                const AppText(
                  text: "US Dollar",
                  size: 13,
                  color: ColorRes.bgLightColor,
                ),
                const SizedBox(width: 3),
                const Icon(
                  Icons.arrow_drop_down,
                  color: ColorRes.bgLightColor,
                  size: 13,
                )
              ],
            ),
            const SizedBox(height: 10),
            const AppText(
              text: "\$20,000",
              size: 33,
              color: ColorRes.bgLightColor,
              weight: FontWeight.bold,
            ),
            const SizedBox(height: 5),
            AppText(
              text: "Available Balance",
              size: 12,
              color: ColorRes.bgLightColor.withOpacity(.6),
            ),
            const SizedBox(height: 20),
            const AppContainer(
              width: 130,
              height: 47,
              borderRadius: 60,
              borderWidth: 1.5,
              borderColor: ColorRes.bgLightColor,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.wallet,
                      size: 20,
                      color: ColorRes.bgLightColor,
                    ),
                    SizedBox(width: 5),
                    AppText(
                      text: "Add Money",
                      size: 12,
                      color: ColorRes.bgLightColor,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const SendRow(),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: "Transaction",
                  size: 17,
                ),
                Icon(
                  Icons.arrow_forward,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 25,
              ),
              decoration: BoxDecoration(
                color: ColorRes.bgLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TransactionTile(
                    leadingIcon: Icons.credit_card,
                    iconColor: ColorRes.primaryColor,
                    circleColor: ColorRes.primaryColor.withOpacity(.15),
                    text: "Spending",
                    price: "-\$500",
                    priceColor: Colors.red,
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  const SizedBox(height: 10),
                  TransactionTile(
                    leadingIcon: Icons.credit_card,
                    iconColor: ColorRes.primaryColor,
                    circleColor: ColorRes.primaryColor.withOpacity(.15),
                    text: "Income",
                    price: "\$3000",
                    priceColor: ColorRes.contentPrimary,
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  const SizedBox(height: 10),
                  TransactionTile(
                    leadingIcon: Icons.credit_card,
                    iconColor: ColorRes.primaryColor,
                    circleColor: ColorRes.primaryColor.withOpacity(.15),
                    text: "Bills",
                    price: "-\$800",
                    priceColor: Colors.red,
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  const SizedBox(height: 10),
                  TransactionTile(
                    leadingIcon: Icons.credit_card,
                    iconColor: ColorRes.primaryColor,
                    circleColor: ColorRes.primaryColor.withOpacity(.15),
                    text: "Savings",
                    price: "\$1000",
                    priceColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchTextFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const SearchTextFormWidget({
    super.key,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      width: 250,
      containerColor: ColorRes.bgLightColor.withOpacity(.3),
      borderColor: Colors.transparent,
      borderRadius: 50,
      height: 40,
      child: Center(
        child: appTextField(
          controller: controller,
          verticalPadding: 8,
          hintText: "Search \"Payments\"",
          width: double.infinity,
          borderColor: Colors.transparent,
          prefixIcon: Icons.search,
          prefixIconColor: ColorRes.bgLightColor,
          textColor: ColorRes.bgLightColor,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class SendRow extends StatelessWidget {
  const SendRow({super.key});

  // For each transactions action buttons
  Widget actionButtons(
    Color backgroundColor,
    String text,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Badge(
          backgroundColor: Colors.green,
          textColor: backgroundColor,
          largeSize: 20,
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 12,
            child: const AppText(
              text: "\$",
              size: 15,
              color: ColorRes.bgLightColor,
            ),
          ),
        ),
        AppText(
          text: text,
          size: 12,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: 80,
      containerColor: ColorRes.bgLightColor,
      borderColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          actionButtons(
            ColorRes.primaryColor,
            "Send",
          ),
          const VerticalDivider(
            color: ColorRes.lightGrey,
            thickness: .7,
            indent: 20,
            endIndent: 20,
          ),
          actionButtons(
            Colors.pink.withOpacity(.5),
            "Request",
          ),
          const VerticalDivider(
            color: ColorRes.lightGrey,
            thickness: .7,
            indent: 20,
            endIndent: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.account_balance,
                color: Colors.pink.withOpacity(.5),
              ),
              const AppText(
                text: "Bank",
                size: 12,
              ),
            ],
          )
        ],
      ),
    );
  }
}

// EACH TRANSACTION TILE
class TransactionTile extends StatelessWidget {
  final IconData leadingIcon;
  final Color? iconColor;
  final Color? circleColor;
  final Color? priceColor;
  final String text;
  final String price;
  const TransactionTile({
    super.key,
    required this.leadingIcon,
    this.iconColor,
    this.circleColor,
    this.priceColor,
    required this.text,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: circleColor,
                  child: Icon(
                    leadingIcon,
                    color: iconColor,
                    size: 23,
                  ),
                ),
                const SizedBox(width: 8),
                AppText(
                  text: text,
                  size: 15,
                ),
              ],
            ),
            Row(
              children: [
                AppText(
                  text: price,
                  size: 15,
                  color: priceColor!,
                ),
                const SizedBox(width: 12),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

Widget bottomNavBar() {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 33),
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    height: 55,
    decoration: BoxDecoration(
      color: ColorRes.bgLightColor,
      borderRadius: BorderRadius.circular(13),
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.home,
          color: ColorRes.primaryColor,
        ),
        Icon(Icons.settings),
        Icon(Icons.wallet),
        Icon(Icons.person_2_outlined),
      ],
    ),
  );
}
