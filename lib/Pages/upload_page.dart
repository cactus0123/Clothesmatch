import 'dart:io';
import 'package:clothesmatch/Services/database_service.dart';
import 'package:clothesmatch/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import '../Model/listing.dart';

class UploadPage extends StatefulWidget {
  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
  String selectedSize = 'S';
  late String name;
  late String color;
  late double priceInput;
  late String description;
  late String imagePath;
  late String cloudUrl;
  bool isImageSelected = false;
  final username = 'user1';
  final sold = false;
  final storage = FirebaseStorage.instance.ref();
  final DatabaseService databaseService = DatabaseService();

  Future<void> pickImage() async {
    final status = await Permission.photos.request();
    if (status.isGranted) {
      final imagePicker = ImagePicker();
      final XFile? pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          imagePath = pickedImage.path;
          isImageSelected = true;
        });
        print('Image selected: ${pickedImage.path}');
      } else {
        print('No image selected.');
      }
    } else {
      print('Permission denied');
    }
  }

  Future<void> uploadImage() async {
    // Upload image to Firebase
    final itemImgRef = storage.child(basename(imagePath));
    File imageFile = File(imagePath);
    await itemImgRef.putFile(imageFile);
    await itemImgRef.getDownloadURL().then((value) {
      cloudUrl = value;
      print('Image uploaded: $cloudUrl');
    });
  }

  Future<void> uploadItem() async {
    // Upload item to Firebase
    Listing item = Listing(
        color: color,
        description: description,
        image: cloudUrl,
        name: name,
        price: priceInput,
        size: selectedSize,
        username: username,
        sold: sold);

    databaseService.addListing(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Page',
            style: GoogleFonts.josefinSans(
                textStyle: TextStyle(
              color: Colors.black,
            ))),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: pickImage,
                  child: isImageSelected
                      ? Image.file(File(imagePath))
                      : ImagePickerWidget()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 56),
                  Text("Name",
                      style: GoogleFonts.josefinSans(
                          textStyle: TextStyle(fontSize: 22)),
                      textAlign: TextAlign.left),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Name'),
                    onChanged: (value) {
                      name = value;
                      print(name);
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Size",
                                style: GoogleFonts.josefinSans(
                                    textStyle: TextStyle(fontSize: 22)),
                                textAlign: TextAlign.left),
                            DropdownMenu<String>(
                              initialSelection: sizes.first,
                              onSelected: (String? value) {
                                setState(() {
                                  selectedSize = value!;
                                });
                              },
                              dropdownMenuEntries: sizes
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                    value: value, label: value);
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Price",
                                style: GoogleFonts.josefinSans(
                                    textStyle: TextStyle(fontSize: 22)),
                                textAlign: TextAlign.left),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixText: '\$',
                                    labelText: "Price"),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    final newValue = double.tryParse(value);
                                    if (newValue != null) {
                                      setState(() {
                                        priceInput = newValue;
                                      });
                                    } else {
                                      priceInput = 0;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Invalid price'),
                                        duration: Duration(milliseconds: 500),
                                      ));
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Color",
                              style: GoogleFonts.josefinSans(
                                  textStyle: TextStyle(fontSize: 22)),
                              textAlign: TextAlign.left),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Color"),
                                  onChanged: (value) {
                                    color = value;
                                  }))
                        ],
                      )),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description",
                      style: GoogleFonts.josefinSans(
                          textStyle: TextStyle(fontSize: 22)),
                      textAlign: TextAlign.left),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                      hintText: 'Enter a description for the item',
                    ),
                    onChanged: (value) {
                      description = value;
                    },
                    maxLines: 5,
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await uploadImage();
                  await uploadItem().then((value) => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp())));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Color.fromARGB(255, 175, 162, 204),
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.upload,
          size: 100,
        ),
        Text('Upload Image'),
      ]),
    ));
  }
}
