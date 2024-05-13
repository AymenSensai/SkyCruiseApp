import 'package:flutter/material.dart';
import '../helpers/extensions.dart';

class CloseCenteredTitleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CloseCenteredTitleAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(
          Icons.close_rounded,
        ),
      ),
    );
  }
}

class BackCenteredTitleAppBar extends StatelessWidget {
  const BackCenteredTitleAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(
          Icons.arrow_back_rounded,
        ),
      ),
    );
  }
}