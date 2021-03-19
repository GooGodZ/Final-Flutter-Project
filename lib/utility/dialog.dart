import 'package:flutter/material.dart';

Future<Null> normalDialog(
    BuildContext context, String string, String string2) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        title: Center(
          child: Text(
            '!!ຄຳເຕືອນ!!',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              color: Colors.red,
            ),
          ),
        ),
        subtitle: Center(
          child: Column(
            children: [
              Text(string),
              Text(string2),
            ],
          ),
        ),
      ),
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('ຕົກລົງ'),
        ),
      ],
    ),
  );
}
