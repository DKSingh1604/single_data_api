// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:single_data_api/21December2024/models/company.dart';
import 'package:single_data_api/21December2024/services/company_services.dart';

class CreateCompany extends StatefulWidget {
  final Company? company;
  const CreateCompany({super.key, this.company});

  @override
  State<CreateCompany> createState() => _CreateCompanyState();
}

class _CreateCompanyState extends State<CreateCompany> {
  //Text editing controllers
  // TextEditingController _idController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    if (widget.company != null) {
      _nameController.text = widget.company!.companyName ?? "";
      _addressController.text = widget.company!.companyAddress ?? "";
      _phoneController.text = widget.company!.companyNumber ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.company == null ? "Create company" : "Update Company",
        ),
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
                    widget.company == null
                        ? "Kindly fill the form to create a company"
                        : "Kindly fill the form to update the Company",
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
                    return null;
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
                    return null;
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
                    return null;
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

                    if (widget.company != null) {
                      await CompanyServices()
                          .updateCompany(newCompany, widget.company!.id!);
                    } else {
                      await CompanyServices().createCompany(newCompany);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          widget.company == null
                              ? "Company created successfully"
                              : "Company updated successfully",
                        ),
                      ),
                    );

                    Navigator.pop(context, true);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    widget.company == null
                        ? "Create company"
                        : "Update Company",
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
