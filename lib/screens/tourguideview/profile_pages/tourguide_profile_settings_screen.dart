import 'dart:io';
import 'package:final_project/widgets/custom_language.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TourguideProfileSettingsScreen extends StatefulWidget {
  const TourguideProfileSettingsScreen({super.key});

  @override
  State<TourguideProfileSettingsScreen> createState() => _PickImageState();
}

class _PickImageState extends State<TourguideProfileSettingsScreen> {
  Uint8List? _image;
  File? selectedImage;
  bool isEditingName = false;
  bool isEditingPassword = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 25),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: Theme.of(context).primaryColor,
              size: 32,
            ),
          ),
        ),
        title: Text('profile settings',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 66),
              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(radius: 65, backgroundImage: MemoryImage(_image!))
                        : const CircleAvatar(
                            radius: 65,
                            backgroundImage: AssetImage('assets/images/Dave-Dickinson-Headshot.jpg'),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 85,
                      child: IconButton(
                        onPressed: () {
                          showImagePickerOption(context);
                        },
                        icon: const Icon(Icons.add_a_photo),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Name',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              TextField(
                controller: nameController,
                enabled: isEditingName,
                style: TextStyle(color: Theme.of(context).primaryColor),
                decoration: InputDecoration(
                  hintText: 'User Name',
                  hintStyle: const TextStyle(color: Color(0XFFD8D8D8)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0XFFF5903F),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0XFFF5903F),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0XFFF5903F),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 27),
              Center(
                child: MaterialButton(
                  height: 42,
                  minWidth: 233,
                  onPressed: () {
                    setState(() {
                      isEditingName = !isEditingName;
                    });
                  },
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  color: const Color(0XFFF5903F),
                  child: Text(
                    isEditingName ? 'Done' : 'Edit Name',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 27),
              Text(
                'Add Language',
                style: TextStyle(
                    fontFamily: 'Inter',
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              Container(
                child: DropdownTextField(),
              ),
              /* TextField(
                  decoration: InputDecoration(
                    hintText: 'Add Language',
                    hintStyle: const TextStyle(color: Color(0XFFD8D8D8)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color(0XFFF5903F),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color(0XFFD8D8D8),
                        )),
                  ),
                ),*/
              const SizedBox(
                height: 27,
              ),
              Center(
                child: MaterialButton(
                  //minWidth: MediaQuery.of(context).size.width,
                  height: 42,
                  minWidth: 233,
                  onPressed: () {},
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  color: const Color(0XFFF5903F),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
