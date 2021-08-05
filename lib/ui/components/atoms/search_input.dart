import 'package:flutter/material.dart';
import 'package:traveloka_clone/ui/components/bases/base_icon_button.dart';
import 'package:traveloka_clone/utils/project_theme.dart';

class SearchInput extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onClear;
  final TextEditingController? controller;
  final bool autofocus;

  final String placeholder;

  const SearchInput({
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.placeholder = "Cari",
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: controller == null,
      child: Container(
        height: 36,
        child: TextField(
          autofocus: autofocus,
          controller: controller,
          onChanged: (val) {
            if (onChanged != null) onChanged!(val);
          },
          onSubmitted: (val) {
            if (onSubmitted != null) onSubmitted!(val);
          },
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TypoStyle.mainGrey,
            prefixIcon: BaseIconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                (controller == null || controller!.text.isEmpty)
                    ? Icons.search
                    : Icons.close,
                color: ProjectColor.greyText,
                size: IconSize.s,
              ),
              onPressed: () {
                if (controller == null || controller!.text.isEmpty) {
                  onClear!();
                }
              },
            ),
            fillColor: ProjectColor.whiteOrigin,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(RadiusSize.m),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(RadiusSize.m),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }
}
