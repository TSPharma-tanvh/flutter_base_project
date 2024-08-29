import 'package:core/core.dart';
import 'package:core/locales/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/widgets/base_widget.dart';
import 'package:flutter_base_project/presentation/widgets/card_view.dart';

class CustomDialog extends BaseWidget {
  const CustomDialog({
    super.key,
    required this.onPressBtnAccept,
    required this.onPressBtnCancel,
    this.title = '',
    this.colorTitle = const Color(0xff39A07C),
    this.colorButtonAccept = const Color(0xff39A07C),
    this.content = '',
    this.showBtnAccept = true,
    this.showBtnCancel = false,
    this.textBtnAccept = '',
    this.textBtnCancel = '',
    this.onTapClose,
    this.isTitleVisible = true,
    this.errorImage = const SizedBox.shrink(),
  });

  final String title;
  final Color? colorTitle;
  final Color? colorButtonAccept;
  final String content;
  final bool showBtnAccept;
  final bool showBtnCancel;
  final String textBtnAccept;
  final String textBtnCancel;
  final GestureTapCallback onPressBtnAccept;
  final GestureTapCallback onPressBtnCancel;
  final Function()? onTapClose;
  final bool isTitleVisible;
  final Widget errorImage;

  @override
  Widget build(BuildContext context, AppThemeCore theme, AppLocalizations tr) {
    final colors = theme.colors;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                //show error image
                errorImage,
                Visibility(
                  visible: isTitleVisible,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)
                            .copyWith(color: colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  // alignment: contentAlignment,
                  child: Center(
                    child: Text(
                      content,
                      style: const TextStyle(fontSize: 14)
                          .copyWith(color: colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Visibility(
                  visible: showBtnAccept,
                  child: CardView(
                    color: colorButtonAccept,
                    radius: 8,
                    onTap: onPressBtnAccept,
                    title: textBtnAccept,
                    margin: const EdgeInsets.only(
                      top: 24,
                      left: 16,
                      right: 16,
                    ),
                  ),
                ),
                Visibility(
                  visible: showBtnCancel,
                  child: CardView(
                    onTap: onPressBtnCancel,
                    title: textBtnCancel,
                    radius: 8,
                    margin: const EdgeInsets.only(
                      top: 8,
                      left: 16,
                      right: 16,
                    ),
                    titleStyle: const TextStyle(fontSize: 16)
                        .copyWith(color: colors.mainGreen),
                    color: Colors.white,
                    border: Border.all(color: colors.mainGreen),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
