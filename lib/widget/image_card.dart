import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mappage/constant/constant.dart';

File? image1;
File? image2;

class ImageCard extends StatefulWidget {
  const ImageCard({super.key});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {

  Future<void> _pickImage(int imageNumber) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          image1 = File(pickedFile.path);
        } else {
          image2 = File(pickedFile.path);
        }
      });
    } else {
      print('No image selected.');
    }
  }

  Widget _buildImageCard(File? imageFile, String text, int imageNumber) {
    return GestureDetector(
      onTap: () => _pickImage(imageNumber),
      child: Card(
        child: Column(
          children: <Widget>[
            imageFile != null
                ? Image.file(
                    imageFile,
                    width: 150,
                    height: 120,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/gallery_image.png",
                    width: 150,
                    height: 120,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildImageCard(image1, Constants.image1, 1),
        _buildImageCard(image2, Constants.image2, 2),
      ],
    );
  }
}
