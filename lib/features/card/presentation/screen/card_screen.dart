import 'package:flutter/material.dart';
import 'package:stroll_test/generated/assets.dart';
import 'package:stroll_test/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stroll_test/features/home_page/presentation/view_model/card_view_model.dart';
import 'package:stroll_test/shared/data/model/favorite_option_response_model.dart';
import 'package:stroll_test/shared/constants.dart';
import 'package:stroll_test/shared/extensions.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isFavoriteOptionLoading = context.select<CardViewModel, bool>(
            (CardViewModel vm) => vm.isFavoriteOptionLoading);
    var selectedFavoriteIndex = context.select<CardViewModel, int>(
            (CardViewModel vm) => vm.selectedFavoriteOption);
    var favoriteOptions =
    context.select<CardViewModel, List<FavoriteOptionModel>?>(
            (CardViewModel vm) => vm.favoriteOptions);
    if (favoriteOptions == null) {
      return SizedBox();
    }
    return Stack(children: [
      SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.63,
        width: double.infinity,
        child: favoriteOptions!.map((value) {
          if (value.image?.startsWith("http") == true) {
            return Image.network(value.image?.trimAssetPath ?? "",
                fit: BoxFit.cover);
          } else {
            return Image.asset(
              value.image?.trimAssetPath ?? "",
              fit: BoxFit.cover,
            );
          }
        }).toList()[selectedFavoriteIndex],
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Assets.pngFade.trimAssetPath))),
      ),
      PageTitleWidget(),
      ContentDetailsWidget(),
      if (isFavoriteOptionLoading)
        Center(
          child: CircularProgressIndicator(),
        )
      else
        SizedBox()
    ]);
  }
}

class ContentDetailsWidget extends StatelessWidget {
  const ContentDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var isFavoriteOptionLoading = context.select<CardViewModel, bool>(
            (CardViewModel vm) => vm.isFavoriteOptionLoading);
    var selectedFavoriteIndex = context.select<CardViewModel, int>(
            (CardViewModel vm) => vm.selectedFavoriteOption);
    var favoriteOptions =
    context.select<CardViewModel, List<FavoriteOptionModel>?>(
            (CardViewModel vm) => vm.favoriteOptions);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.3,
        ),
        Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.220,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 27, right: 32),
                  child: Stack(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 50, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 107,
                            height: 22,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                color: appColor.fadeBlack),
                            padding: EdgeInsets.only(
                                left: 23, top: 4, bottom: 4),
                            child: Text(
                              "Angelina, 28",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 10),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30, top: 9),
                            child: Text(
                              "What is your favorite time of the day?",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 9),
                            child: Text(
                              "\“Mine is definitely the peace in the morning.\”",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w200,
                                  color: appColor.primaryText,
                                  fontSize: 12.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 68,
                      height: 68,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: appColor.fadeBlack),
                      padding: EdgeInsets.all(4.15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Image.asset(Assets.pngPic.trimAssetPath),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 15,
                ),
                Wrap(
                  runSpacing: 15,
                  spacing: 13,
                  children: favoriteOptions
                      ?.asMap()
                      .entries
                      .map((entry) {
                    final item = entry.value;
                    return InkWell(
                      onTap: () {
                        context
                            .read<CardViewModel>()
                            .selectedFavoriteOption =
                            entry.key;
                      },
                      child: Container(
                        height: 60,
                        width: 170,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: appColor.fadeBlack,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: selectedFavoriteIndex == entry.key
                                    ? appColor.primary
                                    : Colors.transparent,
                                width: selectedFavoriteIndex == entry.key
                                    ? 1
                                    : 0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: selectedFavoriteIndex == entry.key
                                          ? Colors.transparent
                                          : appColor.greyText,
                                      width: selectedFavoriteIndex == entry.key
                                          ? 0
                                          : 0.4),
                                  color: selectedFavoriteIndex == entry.key
                                      ? appColor.primary
                                      : Colors.transparent),
                              padding: EdgeInsets.only(top: 1),
                              child: Text(
                                item.symbol ?? "",
                                textAlign: TextAlign.center,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                    color:
                                    selectedFavoriteIndex == entry.key
                                        ? appColor.whiteBoldText
                                        : appColor.greyText),
                              ),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    item.text ?? "",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                        color:
                                        selectedFavoriteIndex == entry.key
                                            ? appColor.whiteBoldText
                                            : appColor.greyText,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  }).toList() ??
                      [],
                ),
                SizedBox(height: 11),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Pick your option.\nSee who has a similar mind.",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                              color: appColor.greyText,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        InkWell(
                          onTap: () {
                            showSuccessDialog(context);
                          },
                          child: SvgPicture.asset(
                            Assets.svgIcMicButton.trimAssetPath,
                            width: 48,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        InkWell(
                          onTap: () {
                            showSuccessDialog(context);
                          },
                          child: SvgPicture.asset(
                            Assets.svgIcSendBtn.trimAssetPath,
                            width: 48,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 100,
                )
              ]),
            ))
      ],
    );
  }

  Future<dynamic> showSuccessDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: appColor.white,
            content: Text("Success!"),
            title: Text("Info"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Done"))
            ],
            alignment: Alignment.center,
          );
        });
  }
}

class PageTitleWidget extends StatelessWidget {
  const PageTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.1,
        ),
        SizedBox(
          height: 44,
          width: double.infinity,
          child: InkWell(
              onTap: () {
                final RenderBox renderBox =
                context.findRenderObject() as RenderBox;
                final size = renderBox.size;
                final position = renderBox.localToGlobal(
                    Offset.zero); // Get the position of the button.

                // Calculate the top-right corner's position.
                final offset = Offset(
                  position.dx + size.width - 200,
                  // 200 is the width of the menu
                  position.dy - 150, // 150 is the height of the menu
                );

                Logger().d("pressed");
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      offset.dx, // Left
                      offset.dy, // Top
                      0.0, // Right
                      0.0, // Bottom
                    ),
                    items: [
                      "option 1",
                      "option 2",
                      "option 3",
                    ]
                        .map((value) =>
                        PopupMenuItem<String>(
                          child: Text(value),
                          value: value,
                        ))
                        .toList());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Stroll Bonfire",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(
                      color: appColor.primaryBoldText,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 1.0),
                          blurRadius: 13.0,
                          color: appColor.fadeBlack.withOpacity(0.35),
                        ),
                        Shadow(
                          offset: Offset(2.0, 1.0),
                          blurRadius: 18.0,
                          color: appColor.fadeBlack.withOpacity(0.35),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: SvgPicture.asset(
                      Assets.svgIcDownArrow.trimAssetPath,
                      height: 12,
                      width: 12,
                    ),
                  )
                ],
              )),
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: appColor.fadeBlack.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: SvgPicture.asset(
                Assets.svgIcTime.trimAssetPath,
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Text("22h 00m",
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(
                  color: appColor.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 1.0),
                      blurRadius: 13.0,
                      color: appColor.fadeBlack.withOpacity(0.4),
                    ),
                    Shadow(
                      offset: Offset(2.0, 1.0),
                      blurRadius: 18.0,
                      color: appColor.fadeBlack.withOpacity(0.4),
                    ),
                  ],
                )),
            SizedBox(
              width: 9,
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: appColor.fadeBlack.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child:
              SvgPicture.asset(Assets.svgIcPerson.trimAssetPath),
            ),
            SizedBox(
              width: 3,
            ),
            Text("103",
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(
                  color: appColor.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 1.0),
                      blurRadius: 13.0,
                      color: appColor.fadeBlack.withOpacity(0.4),
                    ),
                    Shadow(
                      offset: Offset(2.0, 1.0),
                      blurRadius: 18.0,
                      color: appColor.fadeBlack.withOpacity(0.4),
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
