import 'package:flutter_repository/src/app/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_repository/src/app/util/theme_variabel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_repository/src/app/view/widget/product_list_tile_copy.dart';

class ButtonRounded extends StatelessWidget {
  const ButtonRounded({
    super.key,
    required this.onPressed,
    required this.child,
    this.isInProgress = false,
    this.isExpanded = false,
  });
  final void Function() onPressed;
  final Widget child;
  final bool isInProgress;
  final bool isExpanded;
  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 18, horizontal: 36),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      onPressed: !isInProgress ? onPressed : null,
      child: !isInProgress
          ? child
          : const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
    );
    return !isExpanded
        ? button
        : Row(
            children: [
              Expanded(child: button),
            ],
          );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onPressed,
    required this.child,
    this.color,
    this.isInProgress = false,
    this.isExpanded = false,
    this.mini = false,
  });
  final Color? color;
  final void Function()? onPressed;
  final Widget child;
  final bool isInProgress;
  final bool isExpanded;
  final bool mini;
  @override
  Widget build(BuildContext context) {
    var buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color),
      foregroundColor: MaterialStateProperty.all(
        color == Colors.white ? Colors.grey[700] : null,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      overlayColor: MaterialStateProperty.all(primaryColor),
    );

    if (mini) {
      buttonStyle = buttonStyle.copyWith(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      );
    }

    final button = ElevatedButton(
      style: buttonStyle,
      onPressed: !isInProgress ? onPressed : null,
      child: SizedBox(
        height: 19,
        width: isInProgress ? 20 : null,
        child: isInProgress
            ? const CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Center(child: child),
      ),
    );
    return !isExpanded
        ? button
        : Row(
            children: [
              Expanded(child: button),
            ],
          );
  }
}

class BackButtonTitled extends StatelessWidget {
  const BackButtonTitled({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            const Icon(FontAwesomeIcons.chevronLeft),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(fontFamily: 'Montserrat', fontSize: 25)),
          ],
        ),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: const Padding(
        padding: EdgeInsets.only(
          right: 10,
        ),
        child: Icon(
          FontAwesomeIcons.edit,
          color: colorEditButton,
          size: 15,
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: const Padding(
        padding: EdgeInsets.only(
          right: 10,
        ),
        child: Icon(
          FontAwesomeIcons.trashAlt,
          color: colorDeleteButton,
          size: 15,
        ),
      ),
    );
  }
}

enum Menu { itemUpdate, itemDelete }

class DotsButton extends StatelessWidget {
  const DotsButton({
    super.key,
    required this.onDelete,
    required this.onUpdate,
  });
  final void Function() onDelete;
  final void Function() onUpdate;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      onSelected: (Menu item) {
        switch (item) {
          case Menu.itemUpdate:
            onUpdate();
            break;
          case Menu.itemDelete:
            onDelete();
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        const PopupMenuItem<Menu>(
          value: Menu.itemDelete,
          child: Icon(Icons.delete),
        ),
        const PopupMenuItem<Menu>(
          value: Menu.itemUpdate,
          child: Icon(Icons.edit),
        ),
      ],
      icon: const Icon(Icons.more_horiz),
    );
  }
}
