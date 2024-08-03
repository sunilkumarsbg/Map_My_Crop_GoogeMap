import 'package:flutter/material.dart';
import 'package:mappage/constant/colors.dart';
import 'package:mappage/constant/style.dart';
import 'package:mappage/screen/map_screen.dart';
import 'package:mappage/widget/common_widget.dart';
import 'package:mappage/widget/image_card.dart';
import '../constant/constant.dart';

class SellProduceScreen extends StatefulWidget {
  const SellProduceScreen({super.key});
  @override
  State<SellProduceScreen> createState() => _SellProduceScreenState();
}

class _SellProduceScreenState extends State<SellProduceScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController varietyController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  void dispose() {
    varietyController.dispose();
    quantityController.dispose();
    priceController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    selectedQuantity = quantity[0]; // Set default value
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAapBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                labelText(Constants.typeOfCrop),
                const SizedBox(height: 8.0),
                cropDropDown(),
                const SizedBox(height: 8.0),
                labelText(Constants.variety),
                const SizedBox(height: 8.0),
                varietyTextField(),
                const SizedBox(height: 8.0),
                labelText(Constants.expectedQuantity),
                const SizedBox(height: 8.0),
                quantityWidget(),
                const SizedBox(height: 8.0),
                labelText(Constants.price),
                const SizedBox(height: 8.0),
                priceTextField(),
                const SizedBox(height: 8.0),
                labelText(Constants.note),
                const SizedBox(height: 8.0),
                noteTextField(),
                const SizedBox(height: 8.0),
                labelText(Constants.images),
                const SizedBox(height: 8.0),
                const ImageCard(),
                const SizedBox(height: 32.0),
                save(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  cropDropDown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCrop,
          hint: const Text(Constants.selectCrop),
          isExpanded: true,
          onChanged: (String? newValue) {
            setState(() {
              selectedCrop = newValue;
            });
          },
          items: crops.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: AppStyles.helpTitleStyle),
            );
          }).toList(),
        ),
      ),
    );
  }

  varietyTextField() {
    return TextFormField(
      controller: varietyController,
      decoration: InputDecoration(
        hintText: Constants.varietyOfProduct,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the variety';
        }
        return null;
      },
    );
  }

  quantityWidget() {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextFormField(
            controller: quantityController,
            decoration: InputDecoration(
              hintText: Constants.quantity,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the quantity';
              }
              return null;
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedQuantity,
                  hint: const Text(Constants.kg),
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedQuantity = newValue;
                    });
                  },
                  items: quantity.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: AppStyles.helpTitleStyle),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  priceTextField() {
    return TextFormField(
      controller: priceController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: Constants.typeYourPrice,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the price';
        }
        return null;
      },
    );
  }

  noteTextField() {
    return TextFormField(
      controller: noteController,
      decoration: InputDecoration(
        hintText: Constants.writeSomething,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a note';
        }
        return null;
      },
    );
  }

  save() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              print("********************** console ***************************");
              if (selectedCrop != null) {
                print("SelectedCrop:${selectedCrop!}");
              }
              if (varietyController.text.isNotEmpty) {
                print("variety:${varietyController.text}");
              }
              if (quantityController.text.isNotEmpty) {
                print("selectedQuantity:${quantityController.text}");
              }
              if (selectedQuantity != null) {
                print("kg:${selectedQuantity!}");
              }
              if (priceController.text.isNotEmpty) {
                print("Price:${priceController.text}");
              }
              if (noteController.text.isNotEmpty) {
                print("Note:${noteController.text}");
              }
              if (image1 != null) {
                print("Selected First Image Path:$image1");
              }
              if (image2 != null) {
                print("Selected second Image path:$image2");
              }

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PolygoneScreen()),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.btnColor, // Background color
            foregroundColor: AppColors.white, // Text color
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
          child: const Text(
            Constants.addMyProduce,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

