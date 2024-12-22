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
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CreateCompany()),
        ),
        child: Text("ADD"),
        backgroundColor: Colors.grey[400],
      ),
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("COMPANIES"),
        centerTitle: true,
      ),
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
                    leading: Image.network(data[index].companyLogo!),
                    title: Text(
                      data[index].companyName ?? "No Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      data[index].companyNumber! +
                          ", " +
                          data[index].companyAddress!,
                    ),
                    trailing: Wrap(
                      spacing: 8,
                      children: [
                        Icon(Icons.edit),
                        Icon(Icons.delete),
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
