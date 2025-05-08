import 'package:flutter/material.dart';
import '../models/product.dart';

class BeforeAfterGallery extends StatefulWidget {
  final Product product;

  const BeforeAfterGallery({super.key, required this.product});

  @override
  State<BeforeAfterGallery> createState() => _BeforeAfterGalleryState();
}

class _BeforeAfterGalleryState extends State<BeforeAfterGallery> {
  bool showBefore = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            showBefore ? widget.product.imageBefore : widget.product.imageAfter,
            height: 200,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showBefore = true;
                  });
                },
                child: const Text('Antes'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: showBefore ? Colors.blue : Colors.grey,
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showBefore = false;
                  });
                },
                child: const Text('Depois'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: !showBefore ? Colors.blue : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
