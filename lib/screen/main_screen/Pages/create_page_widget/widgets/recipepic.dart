import 'dart:typed_data';

import 'package:flutter/material.dart';

class Recipepic extends StatelessWidget {
  final Uint8List? image;
  final VoidCallback onImageSelect;
  const Recipepic(
      {super.key, required this.image, required this.onImageSelect});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 64,
          backgroundImage: image != null
              ? MemoryImage(image!)
              : const NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfZbXR5XmpH1OOJhigJF4nWkJIITHis1Y4dA&s',
                ) as ImageProvider,
        ),
        Positioned(
          bottom: -10,
          left: 80,
          child: IconButton(
            onPressed: onImageSelect,
            icon: const Icon(Icons.add_a_photo),
          ),
        ),
      ],
    );
  }
}
