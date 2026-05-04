import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';

class InitializationErrorScreen extends StatelessWidget {
  const InitializationErrorScreen({
    super.key,
    required this.onRetry,
    this.isRetrying = false,
  });

  final VoidCallback onRetry;
  final bool isRetrying;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final errorColor = theme.colorScheme.error;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: errorColor, size: 56),
                  const SizedBox(height: 20),
                  Text(
                    l10n.initializationLoadErrorTitle,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: isRetrying ? null : onRetry,
                    child: isRetrying
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(l10n.initializationRetryInProgress),
                            ],
                          )
                        : Text(l10n.initializationRetry),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
