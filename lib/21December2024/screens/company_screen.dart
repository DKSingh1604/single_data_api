// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:single_data_api/21December2024/models/company.dart';
import 'package:single_data_api/21December2024/screens/create_company.dart';
import 'package:single_data_api/21December2024/services/company_services.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isCompanyAdded = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CreateCompany()),
          );

          if (isCompanyAdded == true) {
            setState(() {});
          }
        },
        backgroundColor: Colors.grey[400],
        child: Text("ADD"),
      ),
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("COMPANIES"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),

      //B O D Y
      body: FutureBuilder(
        future: CompanyServices().getAllCompanies(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child:
                  Text("Error receiving data from server: ${snapshot.error}"),
            );
          }
          if (snapshot.hasData && snapshot.data != null) {
            List<Company> data = snapshot.data as List<Company>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    tileColor: Colors.amber[300],
                    leading: Image.network(data[index].companyLogo ??
                        "https://logo.clearbit.com/cbsnews.com"),
                    title: Text(
                      data[index].companyName ?? "No Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      data[index].companyNumber! +
                          ", " +
                          (data[index].companyAddress ?? "No Address"),
                    ),
                    trailing: Wrap(
                      spacing: 8,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CreateCompany(
                                  company: data[index],
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Are you sure you want to delete the company?",
                                    ),
                                    content: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            "No",
                                            style: TextStyle(fontSize: 17),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);

                                            await CompanyServices()
                                                .deleteCompany(
                                              data[index].id!,
                                            );

                                            setState(() {
                                              data.removeAt(index);
                                            });
                                          },
                                          child: Text(
                                            "Yes",
                                            style: TextStyle(fontSize: 17),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () async {
                            await CompanyServices().updateCompanyPartially(
                                {'name': "Flutter Job"}, data[index].id!);
                            setState(() {});
                          },
                          icon: Icon(Icons.insert_comment),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
