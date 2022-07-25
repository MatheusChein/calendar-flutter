import 'package:calendar_app/components/custom_text.dart';
import 'package:calendar_app/components/responsive.dart';
import 'package:flutter/material.dart';
import 'package:calendar_app/components/custom_button.dart';
import 'package:calendar_app/components/logo.dart';
import 'package:calendar_app/constants/colors.dart';
import 'package:url_launcher/link.dart';

class ConfirmationForm extends StatefulWidget {
  const ConfirmationForm({Key? key}) : super(key: key);

  @override
  State<ConfirmationForm> createState() => _ConfirmationFormState();
}

class _ConfirmationFormState extends State<ConfirmationForm> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Logo(
                  hasLabel: !ResponsiveWidget.isExtraSmallScreen(context),
                ),
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
          const SizedBox(height: 30),
          CustomText(
            label: 'Confirm your meeting',
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 30),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'John Doe',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'johndoe@email.com',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: primaryColor,
                  )
                : Column(
                    children: [
                      Link(
                        uri: Uri.parse('http://localhost:56793/#/'),
                        target: LinkTarget.blank,
                        builder: (context, followLink) => CustomButton(
                          label: 'Create meeting',
                          // onTap: followLink,
                          onTap: () {
                            followLink;
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
