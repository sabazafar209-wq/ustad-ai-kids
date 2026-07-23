import 'package:flutter/material.dart';

class GreetingHeader extends StatelessWidget {
  final String childName;
  final String avatar;

  const GreetingHeader({
    super.key,
    required this.childName,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        CircleAvatar(
          radius: 34,
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Text(
            avatar,
            style: const TextStyle(fontSize: 34),
          ),
        ),

        const SizedBox(width: 18),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back 👋",
                style: theme.textTheme.bodyLarge,
              ),

              const SizedBox(height: 6),

              Text(
                childName,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }
}