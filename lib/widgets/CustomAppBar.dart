import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? logoPath; // Path to the logo image (optional)
  final String? logoUrl; // URL for the logo image (optional)

  const CustomAppBar({
    super.key,
    required this.title,
    this.logoPath,
    this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0,
      title: Row(
        children: [
          if (logoUrl != null)
            Image.network(
              logoUrl!,
              height: 40,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported),
            )
          else if (logoPath != null)
            Image.asset(logoPath!, height: 40),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        IconButton(icon: const Icon(Icons.logout), onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
