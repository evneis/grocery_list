import 'package:flutter/material.dart';

class BuildRowWidget extends StatelessWidget {
  const BuildRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("test"),
      trailing: Icon(
        true ? Icons.favorite : Icons.favorite_border,
        color: true ? Colors.pink[300] : null,
      ),
      onTap: () {},
    );
  }
}
