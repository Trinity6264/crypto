import 'package:crypto/helper/color_pallet.dart';
import 'package:crypto/widgets/card_wrapper.dart';
import 'package:flutter/material.dart';

class ChooseToken extends StatelessWidget {
  const ChooseToken({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: ColorPallet.darkColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: size.width * .25,
            height: size.height * .004,
            decoration: BoxDecoration(
              color: ColorPallet.lightGrayColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: size.height * .03),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Choose a token',
              style: TextStyle(
                color: ColorPallet.textColor,
                fontWeight: FontWeight.w600,
                fontSize: size.width * .05,
              ),
            ),
          ),
          SizedBox(height: size.height * .04),
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorPallet.lightGrayColor,
            ),
            width: double.infinity,
            height: size.height * .04,
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.search,
                    style: TextStyle(
                      color: ColorPallet.whiteColor,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: ColorPallet.textColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  width: size.width * .09,
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorPallet.primaryColor,
                  ),
                  child: const Icon(
                    Icons.search,
                    color: ColorPallet.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * .02),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: ColorPallet.primaryColor,
                    radius: 20,
                  ),
                  title: const Text(
                    'Ether',
                    style: TextStyle(
                      color: ColorPallet.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    'ETH',
                    style: TextStyle(
                      color: ColorPallet.textColor,
                    ),
                  ),
                  trailing: SizedBox(
                    width: size.width * .2,
                    height: size.height * .05,
                    child: const CardWrapper(
                      child: Text(
                        'Ethereum',
                        style: TextStyle(
                          color: ColorPallet.textColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
