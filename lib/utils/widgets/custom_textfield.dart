import 'package:flutter/services.dart';
import 'package:pretium_app/utils/exports.dart';

class CustomRoundedInputField extends StatefulWidget {
  final String label;
  final String title;
  final Color titleColor;
  final int maxLines;
  final TextAlign textAlign;
  final List<TextInputFormatter>? formatter;
  final TextEditingController? controller;
  final Color color;
  final Color labelColor;
  final Color fillColor;
  final Color cursorColor;
  final Color textColor;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final String? regex;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool obscureText;
  final Function(dynamic)? onChanged;
  final bool isRequired;
  final bool isNumber;
  final bool filled;
  final bool isSearch;
  final String? prefixAsset;
  final String? Function(String?)? validator;
  final bool useCustomValidator;
  final bool isPhone;
  final bool readOnly;
  final bool showLabel;
  final bool hasDropdown;
  final bool hasTitle;
  final double fontSize;
  final double labelFontSize;
  final EdgeInsets edgeInsets;

  const CustomRoundedInputField({
    Key? key,
    this.label = "",
    this.controller,
    this.focusNode,
    this.hasDropdown = false,
    this.filled = true,
    this.title = "",
    this.isPhone = false,
    this.showLabel = false,
    this.isSearch = false,
    this.useCustomValidator = false,
    this.validator,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.keyboardType = TextInputType.text,
    this.cursorColor = AppColors.primaryColor,
    this.fillColor = AppColors.transparent,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.blackColor,
    this.titleColor = AppColors.blackColor,
    this.labelColor = AppColors.obscureTextColor,
    this.obscureText = false,
    this.hasTitle = false,
    this.formatter,
    this.prefixWidget,
    this.prefixAsset,
    this.onChanged,
    this.regex,
    this.suffixWidget = const SizedBox.shrink(),
    this.fontSize = 16,
    this.labelFontSize = 14,
    this.isRequired = true,
    this.isNumber = false,
    this.readOnly = false,
    this.edgeInsets = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  State<CustomRoundedInputField> createState() =>
      _CustomRoundedInputFieldState();
}

class _CustomRoundedInputFieldState extends State<CustomRoundedInputField> {
  bool _hasFocus = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.edgeInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.hasTitle
              ? customText(
                  widget.title,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                  fontSize: widget.labelFontSize.sp,
                  color: widget.titleColor,
                )
              : const SizedBox.shrink(),
          SizedBox(height: widget.hasTitle ? 5.sp : 0.sp),
          Focus(
            onFocusChange: (hasFocus) {
              _hasFocus = hasFocus;
              setState(() {});
            },
            child: TextFormField(
              readOnly: widget.readOnly,
              textAlign: widget.isNumber ? TextAlign.center : widget.textAlign,
              cursorColor: widget.cursorColor,
              obscureText: widget.obscureText,
              maxLines: widget.maxLines,
              minLines: widget.maxLines,
              keyboardType: widget.keyboardType,
              inputFormatters: widget.formatter,
              onChanged: widget.onChanged,
              validator: !widget.isRequired
                  ? null
                  : widget.useCustomValidator
                      ? widget.validator
                      : (value) {
                          if (widget.regex != null) {
                            RegExp regExp = RegExp(
                              widget.regex!,
                              caseSensitive: false,
                              multiLine: false,
                            );
                            if (!regExp.hasMatch(value!)) {
                              return "Invalid ${widget.label}";
                            }
                          }
                          if (value!.isEmpty) {
                            return "${widget.label} field is required";
                          }
                          return null;
                        },
              focusNode: widget.focusNode,
              controller: widget.controller,
              style: widget.isNumber
                  ? TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: GoogleFonts.albertSans().fontFamily,
                      fontFamilyFallback: [
                        GoogleFonts.montserrat().fontFamily!,
                      ],
                      fontSize: widget.fontSize.sp * 2,
                      fontWeight: FontWeight.bold)
                  : TextStyle(
                      color: widget.textColor,
                      fontFamily: GoogleFonts.albertSans().fontFamily,
                      fontSize: widget.fontSize.sp),
              decoration: InputDecoration(
                prefixIcon: widget.prefixAsset != null
                    ? SizedBox(
                        width: 40.sp,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              widget.prefixAsset!,
                              height: 20.sp,
                              width: 20.sp,
                              color: _hasFocus
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                            )
                          ],
                        ),
                      )
                    : widget.prefixWidget,
                suffixIcon: widget.hasDropdown || widget.suffixWidget != null
                    ? IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [widget.suffixWidget!],
                            ),
                            // VerticalDivider(
                            //     color: _hasFocus
                            //         ? AppColors.primary
                            //         : Colors.grey,
                            //     thickness: 1)
                          ],
                        ),
                      )
                    : widget.suffixWidget,

                floatingLabelBehavior: FloatingLabelBehavior.never,
                isDense: true,
                filled: widget.filled,
                fillColor: widget.fillColor,
                contentPadding: EdgeInsets.symmetric(
                    vertical: widget.isSearch ? 10.sp : 15.sp,
                    horizontal: widget.isSearch ? 10.sp : 12.sp),
                floatingLabelStyle: TextStyle(
                  color: widget.labelColor,
                  fontSize: widget.labelFontSize.sp,
                  fontFamily: GoogleFonts.albertSans().fontFamily,
                ),
                // labelText: widget.showLabel ? widget.label : '',
                // labelStyle: widget.isNumber
                //     ? TextStyle(
                //         color: widget.labelColor,
                //         fontFamily: GoogleFonts.albertSans().fontFamily,
                //         fontFamilyFallback: [
                //           GoogleFonts.montserrat().fontFamily!,
                //         ],
                //         fontSize: widget.fontSize.sp * 2,
                //         fontWeight: FontWeight.bold)
                //     : TextStyle(
                //         color: widget.labelColor,
                //         fontSize: widget.labelFontSize.sp,
                //         fontFamily: GoogleFonts.albertSans().fontFamily,
                //       ),
                label: Align(
                  alignment:
                      widget.isNumber ? Alignment.center : Alignment.centerLeft,
                  child: Text(
                    widget.showLabel ? widget.label : '',
                    style: widget.isNumber
                        ? TextStyle(
                            color: widget.labelColor,
                            fontFamily: GoogleFonts.albertSans().fontFamily,
                            fontFamilyFallback: [
                              GoogleFonts.montserrat().fontFamily!,
                            ],
                            fontSize: widget.fontSize.sp * 2,
                            fontWeight: FontWeight.bold)
                        : TextStyle(
                            color: widget.labelColor,
                            fontSize: widget.labelFontSize.sp,
                            fontFamily: GoogleFonts.albertSans().fontFamily,
                          ),
                  ),
                ),
                focusedBorder: widget.isNumber
                    ? const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 0.5,
                        ),
                      )
                    : OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.isSearch ? 12.r : 8.r),
                        borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                          width: 0.5,
                        ),
                      ),
                enabledBorder: widget.isNumber
                    ? const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.obscureTextColor,
                          width: 0.5,
                        ),
                      )
                    : OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.isSearch ? 12.r : 8.r),
                        borderSide: const BorderSide(
                          color: AppColors.obscureTextColor,
                          width: 0,
                        ),
                      ),
                border: widget.isNumber
                    ? const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.obscureTextColor,
                          width: 0.5,
                        ),
                      )
                    : OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.isSearch ? 12.r : 8.r),
                        borderSide: BorderSide(
                          color: widget.isSearch
                              ? widget.color
                              : AppColors.obscureTextColor,
                          width: widget.isSearch ? 0.5 : 0,
                        ),
                      ),
                errorBorder: widget.isNumber
                    ? const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 0.5,
                        ),
                      )
                    : OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.isSearch ? 12.r : 8.r),
                        borderSide: BorderSide(
                          color: widget.isSearch
                              ? widget.color
                              : AppColors.obscureTextColor,
                          width: widget.isSearch ? 0.5 : 0,
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
        ],
      ),
    );
  }
}
