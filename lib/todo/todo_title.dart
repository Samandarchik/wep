import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TitleList extends StatelessWidget {
  final String title;
  final bool chekbox;
  final void Function(bool?)? value;
  final Function(BuildContext)? deleteFunction;

  const TitleList(
      {super.key,
      required this.title,
      required this.chekbox,
      required this.value,
      required this.deleteFunction});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15)),
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15))),
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              Checkbox(
                  activeColor: Colors.black87,
                  value: chekbox,
                  onChanged: value),
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decorationThickness: 4,
                    decoration: chekbox
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )
            ],
          ),
        ),
      ),
    );
  }
}
