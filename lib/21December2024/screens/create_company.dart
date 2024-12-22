// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:single_data_api/21December2024/models/company.dart';
import 'package:single_data_api/21December2024/services/company_services.dart';

class CreateCompany extends StatefulWidget {
  const CreateCompany({super.key});

  @override
  State<CreateCompany> createState() => _CreateCompanyState();
}

class _CreateCompanyState extends State<CreateCompany> {
  //Text editing controllers
  // TextEditingController _idController = TextEditingController();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Add Company"),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Kindly fill the form to add your Company",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //TEXTFIELDS

              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: TextFormField(
              //     validator: (value) {
              //       if (value!.length == 0) {
              //         return ("Please enter company id");
              //       }
              //     },
              //     controller: _idController,
              //     decoration: InputDecoration(
              //       label: Text("Company ID"),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length == 0) {
                      return ("Please enter company name");
                    }
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                    label: Text("Company Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length == 0) {
                      return ("Please enter company address");
                    }
                  },
                  controller: _addressController,
                  decoration: InputDecoration(
                    label: Text("Company Address"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length == 0) {
                      return ("Please enter company number");
                    }
                  },
                  controller: _phoneController,
                  decoration: InputDecoration(
                    label: Text("Company Phone Number"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(),
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    Company newCompany = Company(
                      // id: _idController.hashCode,
                      companyName: _nameController.text,
                      companyAddress: _addressController.text,
                      companyNumber: _phoneController.text,
                      companyLogo: "https://logo.clearbit.com/list-manage.com",
                    );
                    await CompanyServices().createCompany(newCompany);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Company Added Successfully"),
                      ),
                    );

                    Navigator.pop(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
