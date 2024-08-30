import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum BorderTypes { none, bottom, all }

class CustomTextField extends FormField<String> {
  final TextEditingController? controller; // Controls the text being edited.
  final Color? widgetColor; // Container color
  final double? radius; // Border radius
  final EdgeInsets? margin; // Margin text field
  final Decoration? widgetDecoration; // Container decoration
  final Function? onFocus; // On focus
  final Function? onUnFocus; // On focus
  final Widget? suffixIcon; // Suffix Icon
  final Function? onTapSuffix; // On tap suffix
  final GestureTapCallback? onTap; // On tap
  final int? maxLength; // Max length
  final int? maxLines; // Max lines
  final FocusNode? focusNode; //set event focus
  final BorderTypes? borderType; //set border type of widget
  late final Color? borderColor; //set color border when unfocused
  late final Color? focusBorderColor; //set color border when focused
  final bool openEyeIcon;
  final Color? openEyeIconColors;
  final bool openCloseIcon;
  final String?
      immobileLabelText; // set label text but it is immobile => label text don't use
  final TextStyle? labelStyle; //style of label text
  final bool? isVisible;
  final AppThemeCore theme;
  final bool visibleMaxLengthText;
  final bool hideText;
  final bool isRequired;
  final ValueChanged<String>? onChanged;
  final double? maxHeight;
  final FloatingLabelBehavior? floatingLabelBehavior;

  CustomTextField({
    GlobalKey? super.key,
    required this.controller,
    required this.theme,
    EdgeInsetsGeometry? padding,
    String? initialValue,
    InputDecoration? decoration,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    String obscuringCharacter = '•',
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    @Deprecated('Use autoValidateMode parameter which provide more specific '
        'behaviour related to auto validation. '
        'This feature was deprecated after v1.19.0.')
    bool autoValidDate = false,
    this.maxLines = 1,
    int? minLines,
    bool expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    super.onSaved,
    super.validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    EdgeInsets scrollPadding = const EdgeInsets.all(20),
    bool enableInteractiveSelection = true,
    ScrollPhysics? scrollPhysics,
    AutovalidateMode? autoValidateMode,
    this.widgetColor,
    this.margin = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 0,
    ),
    this.radius = 4,
    String? labelText,
    String? errorText,
    this.labelStyle,
    Widget? prefixIcon,
    Widget? prefixWidget,
    this.suffixIcon,
    this.onFocus,
    this.onUnFocus,
    String? hintText,
    TextStyle? hintStyle,
    Function? onTapPrefix,
    this.onTapSuffix,
    bool alignLabelWithHint = false,
    this.widgetDecoration,
    this.focusNode,
    this.borderType = BorderTypes.none,
    this.focusBorderColor,
    this.borderColor,
    this.openEyeIcon = false,
    this.openEyeIconColors,
    this.openCloseIcon = false,
    this.immobileLabelText,
    this.isVisible,
    this.visibleMaxLengthText = false,
    this.hideText = false,
    this.isRequired = false,
    this.maxHeight,
    this.floatingLabelBehavior,
  })  : assert(initialValue == null || controller == null),
        super(
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),

          ///(String? value) => validator!({key: value!}),
          enabled: enabled ?? decoration?.enabled ?? true,
          autovalidateMode: autoValidDate
              ? AutovalidateMode.always
              : (autoValidateMode ?? AutovalidateMode.disabled),
          builder: (FormFieldState<String> field) {
            final TextsFieldState state = field as TextsFieldState;
            final InputDecoration effectiveDecoration;
            if (decoration != null) {
              effectiveDecoration = decoration;
            } else {
              final TextStyle labelStyleError =
                  labelStyle ?? const TextStyle(fontSize: 16);
              final TextStyle hintStyleError =
                  hintStyle ?? const TextStyle(fontSize: 16);
              effectiveDecoration = InputDecoration(
                floatingLabelBehavior:
                    floatingLabelBehavior ?? FloatingLabelBehavior.auto,
                filled: true,
                fillColor: Colors.transparent,
                errorText: errorText,
                border: InputBorder.none,
                contentPadding: padding ??
                    EdgeInsets.only(
                      left: !StringUtilsCore.isNullOrEmpty(prefixIcon) ? 0 : 16,
                      top: state.focusNode.hasFocus ||
                              (!StringUtilsCore.isNullOrEmpty(
                                      state._effectiveController) &&
                                  state._effectiveController.text.isNotEmpty)
                          ? StringUtilsCore.isNullOrEmpty(immobileLabelText)
                              ? 12
                              : 0
                          : alignLabelWithHint
                              ? 0
                              : StringUtilsCore.isNullOrEmpty(immobileLabelText)
                                  ? 12
                                  : 0,
                      bottom: 12,
                    ),
                isDense: true,
                hintText: hintText ?? "",
                hintStyle: state._checkLabelError
                    ? hintStyleError.copyWith(color: theme.colors.itemRed)
                    : hintStyle ??
                        const TextStyle(fontSize: 16)
                            .copyWith(color: theme.colors.disableColor),
                prefixIcon: !StringUtilsCore.isNullOrEmpty(prefixIcon)
                    ? InkWell(
                        onTap: () {
                          state.focusNode.unfocus();
                          onTapPrefix!();
                        },
                        child: prefixIcon!,
                      )
                    : null,
                prefixIconConstraints:
                    const BoxConstraints(maxHeight: 36, minHeight: 28),
                prefix: prefixWidget,
                alignLabelWithHint: alignLabelWithHint,
                counterText: "",
                label: StringUtilsCore.isNullOrEmpty(immobileLabelText) &&
                        !StringUtilsCore.isNullOrEmpty(labelText)
                    ? Text.rich(
                        TextSpan(
                          text: labelText ?? '',
                          style: state._checkLabelError
                              ? labelStyleError.copyWith(
                                  color: theme.colors.itemRed)
                              : labelStyle ??
                                  const TextStyle(fontSize: 16).copyWith(
                                      color: theme.colors.mainGrey,
                                      fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            isRequired
                                ? TextSpan(
                                    text: ' *',
                                    style: labelStyleError.copyWith(
                                        color: theme.colors.itemRed,
                                        fontSize: 12),
                                  )
                                : const TextSpan(),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    : null,
              );
            }
            effectiveDecoration
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);

            void onChangedHandler(String value) {
              if (onChanged != null) {
                onChanged(value);
              }
              field.didChange(value);
            }

            final double customCursorHeight =
                style != null ? style.fontSize ?? 0 : 16;
            return TextField(
              controller: state._effectiveController,
              focusNode: state.focusNode,
              decoration: effectiveDecoration,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              style: style ??
                  TextStyle(fontSize: 16, color: theme.colors.mainGrey),
              textAlign: textAlign,
              textAlignVertical: textAlignVertical,
              textDirection: textDirection,
              textCapitalization: textCapitalization,
              autofocus: autofocus,
              readOnly: readOnly,
              obscuringCharacter: obscuringCharacter,
              obscureText: state._obscureText,
              smartDashesType: smartDashesType ??
                  (state._obscureText
                      ? SmartDashesType.disabled
                      : SmartDashesType.enabled),
              smartQuotesType: smartQuotesType ??
                  (state._obscureText
                      ? SmartQuotesType.disabled
                      : SmartQuotesType.enabled),
              maxLines: maxLines,
              minLines: minLines,
              expands: expands,
              maxLength: maxLength,
              onChanged: onChangedHandler,
              onEditingComplete: onEditingComplete,
              onSubmitted: onFieldSubmitted,
              inputFormatters: inputFormatters,
              enabled: enabled ?? decoration?.enabled ?? true,
              cursorHeight: customCursorHeight + 9,
              scrollPadding: scrollPadding,
              scrollPhysics: scrollPhysics,
              enableInteractiveSelection: enableInteractiveSelection,
            );
          },
        );

  @override
  TextsFieldState createState() => TextsFieldState();
}

class TextsFieldState extends FormFieldState<String> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late bool _obscureText;
  late bool _checkLabelError = false;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller;

  FocusNode get focusNode => _focusNode;

  @override
  CustomTextField get widget => super.widget as CustomTextField;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.hideText;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
    _focusNode.addListener(_onOnUnFocusNodeEvent);
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller!.addListener(_handleControllerChanged);
    }
  }

  /// On focus node event
  void _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
      _checkLabelError = checkLabelError();
    });
    if (!StringUtilsCore.isNullOrEmpty(widget.onFocus) && _focusNode.hasFocus) {
      widget.onFocus!();
    }
  }

  /// On UnFocus node event
  void _onOnUnFocusNodeEvent() {
    if (!StringUtilsCore.isNullOrEmpty(widget.onUnFocus) &&
        !_focusNode.hasFocus) {
      widget.onUnFocus!();
    }
  }

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _controller =
            TextEditingController.fromValue(oldWidget.controller!.value);
      }
      if (widget.controller != null) {
        setValue(widget.controller!.text);
        if (oldWidget.controller == null) _controller = TextEditingController();
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void reset() {
    super.reset();
    setState(() {
      _effectiveController.text = widget.initialValue!;
    });
  }

  bool checkError() {
    if (!StringUtilsCore.isNullOrEmpty(errorText)) {
      return true;
    }
    return false;
  }

  bool checkLabelError() {
    if (!StringUtilsCore.isNullOrEmpty(errorText) && !_focusNode.hasFocus) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor = widget.borderColor ?? widget.theme.colors.black;
    final Color focusBorderColor =
        widget.borderColor ?? widget.theme.colors.mainDarkGreen;
    _checkLabelError = checkLabelError();
    final titleStyle = widget.labelStyle ??
        const TextStyle(fontSize: 16).copyWith(
            color: widget.theme.colors.mainGrey, fontWeight: FontWeight.w400);
    return Visibility(
      visible: widget.isVisible ?? true,
      child: Container(
        margin: !checkError()
            ? widget.margin
            //text widget has unwanted-padding => this help remove unwanted-padding in screen
            : EdgeInsets.only(
                top: widget.margin!.top,
                left: widget.margin!.left,
                right: widget.margin!.right,
                bottom:
                    (widget.margin!.top - 4 < 0) ? 0 : widget.margin!.top - 4,
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(focusNode);
              },
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: widget.maxHeight ?? double.infinity,
                ),
                padding: EdgeInsets.only(
                  bottom: !StringUtilsCore.isNullOrEmpty(widget.controller) &&
                          !StringUtilsCore.isNullOrEmpty(widget.maxLength) &&
                          widget.visibleMaxLengthText &&
                          widget.maxLines! > 1
                      ? 8
                      : 0,
                ),
                decoration: widget.widgetDecoration ??
                    BoxDecoration(
                      borderRadius: widget.borderType == BorderTypes.bottom
                          ? BorderRadius.circular(0)
                          : BorderRadius.circular(widget.radius!),
                      color: widget.widgetColor ?? Colors.white,
                      border: widget.borderType == BorderTypes.none
                          ? null
                          : widget.borderType == BorderTypes.all
                              ? Border.all(
                                  color: _focusNode.hasFocus
                                      ? focusBorderColor
                                      : checkError()
                                          ? widget.theme.colors.itemRed
                                          : borderColor)
                              : Border(
                                  bottom: BorderSide(
                                      color: _focusNode.hasFocus
                                          ? focusBorderColor
                                          : checkError()
                                              ? Colors.red
                                              : borderColor),
                                ),
                    ),
                child: Material(
                  color: widget.widgetColor ?? Colors.white,
                  borderRadius: BorderRadius.circular(widget.radius!),
                  child: InkWell(
                    onTap: widget.onTap,
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(widget.radius!),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StringUtilsCore.isNullOrEmpty(
                                      widget.immobileLabelText)
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                        top: 12,
                                        right: 16,
                                        left: 16,
                                      ),
                                      child: Text.rich(
                                        TextSpan(
                                          text: widget.immobileLabelText ?? '',
                                          style: titleStyle,
                                          children: <TextSpan>[
                                            widget.isRequired
                                                ? TextSpan(
                                                    text: ' *',
                                                    style: titleStyle.copyWith(
                                                      color: widget
                                                          .theme.colors.itemRed,
                                                    ))
                                                : const TextSpan(),
                                          ],
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                              super.build(context),
                              Visibility(
                                visible: widget.maxLines! > 1,
                                child: Container(
                                  child: renderCounterText(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        renderEyeIcon(),
                        renderCloseIcon(),
                        renderSuffixIcon(),
                        Visibility(
                          visible: widget.maxLines == 1,
                          child: renderCounterText(),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            checkError()
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      errorText!,
                      style: AppTextStyleCore.s14
                          .copyWith(color: widget.theme.colors.itemRed),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : const Offstage(),
          ],
        ),
      ),
    );
  }

  /// Render suffix icon
  Widget renderSuffixIcon() {
    if (!StringUtilsCore.isNullOrEmpty(widget.suffixIcon)) {
      return InkWell(
        onTap: () {
          _focusNode.unfocus();
          if (!StringUtilsCore.isNullOrEmpty(widget.onTapSuffix)) {
            widget.onTapSuffix!();
          } else {
            widget.onTap ?? () {};
          }
        },
        child: widget.suffixIcon!,
      );
    } else {
      return const Offstage();
    }
  }

  /// Render Eye Icon on texfield
  Widget renderEyeIcon() {
    if (widget.openEyeIcon) {
      return InkWell(
        onTap: () {
          _focusNode.unfocus();
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: const Padding(
          padding: EdgeInsets.zero,
          child: SizedBox.shrink(),
          //example
          // child: !_obscureText ? AppSvg.icEye : AppSvg.icEyeClosed,
        ),
      );
    } else {
      return const Offstage();
    }
  }

  /// Render Close Icon
  Widget renderCloseIcon() {
    if (widget.openCloseIcon &&
        !StringUtilsCore.isNullOrEmpty(_effectiveController.text)) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        child: InkWell(
          onTap: () {
            _focusNode.unfocus();
            setState(() {
              _effectiveController.text = '';
              _effectiveController.clear();
              if (widget.onChanged != null) {
                widget.onChanged!('');
              }
              if (widget.controller != null) {
                widget.controller!.clear();
              }
            });
          },
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.theme.colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.all(2),
              child: const SizedBox.shrink()
              //example
              // child: AppSvg.icEyeClosed,
              ),
        ),
      );
    } else {
      return const Offstage();
    }
  }

  /// Render counter text
  Widget renderCounterText() {
    if (!StringUtilsCore.isNullOrEmpty(widget.controller) &&
        !StringUtilsCore.isNullOrEmpty(widget.maxLength) &&
        widget.visibleMaxLengthText) {
      return Container(
        padding: const EdgeInsets.only(left: 8, right: 4),
        alignment: Alignment.centerRight,
        child: Text(
          '${widget.controller!.text.length}/${widget.maxLength}',
          style: AppTextStyleCore.s12
              .copyWith(color: widget.theme.colors.mainGrey),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  /// Suppress changes that originated from within this class.
  void _handleControllerChanged() {
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}
