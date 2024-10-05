import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthTextField extends HookWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    this.title,
    this.required = false,
    this.validator,
    this.enabled = true,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? title;
  final bool required;
  final bool enabled;
  final String? Function(String)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final obscure = useState(keyboardType == TextInputType.visiblePassword);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(title!),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          cursorColor: theme.colorScheme.primary,
          validator: (value) {
            if (!required) return null;
            if (value case null || '') return 'Required';
            if (validator != null) return validator!(value);
            return null;
          },
          obscureText: obscure.value,
          obscuringCharacter: '*',
          enabled: enabled,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 1,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            isDense: true,
            hintText: 'hint',
            isCollapsed: false,
            suffixIcon: keyboardType == TextInputType.visiblePassword
                ? IconButton(
                    onPressed: () => obscure.value = !obscure.value,
                    icon: Icon(
                      obscure.value
                          ? Icons.panorama_fish_eye
                          : Icons.remove_red_eye_outlined,
                    ),
                  )
                : null,
            counterText: '',
          ),
        ),
      ],
    );
  }
}
