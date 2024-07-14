import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provides locale after being overridden in [main.dart].
/// Immutable state (once overridden, cannot change).
/// In order for this value to change, an app restart is required, this is
/// mainly used for supplying the locale to the [dioProvider] for the language
/// param.
final localeProvider = Provider<Locale>((ref) => throw UnimplementedError());
