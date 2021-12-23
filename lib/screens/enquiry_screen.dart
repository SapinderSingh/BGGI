import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/services/cloud_firestore_service.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:form_field_validator/form_field_validator.dart';

class EnquiryScreen extends StatefulWidget {
  const EnquiryScreen({Key? key}) : super(key: key);

  @override
  State<EnquiryScreen> createState() => _EnquiryScreenState();
}

class _EnquiryScreenState extends State<EnquiryScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    String? _name, _email, _phone, _message;
    final GlobalKey<FormState> _formKey = GlobalKey();

    final _emailValidator = MultiValidator([
      RequiredValidator(errorText: 'Email is required'),
      EmailValidator(errorText: 'Enter a valid email'),
    ]);

    final _phoneNumberValidator = MultiValidator([
      RequiredValidator(errorText: 'Phone number is required'),
      MinLengthValidator(
        10,
        errorText: 'Minimum length of phone number should be 10',
      ),
      MaxLengthValidator(
        15,
        errorText: 'Phone number shouldn\'t be longer than 15',
      ),
    ]);

    return Scaffold(
      appBar: customAppBar(context, title: 'Write an Enquiry'),
      drawer: const MainDrawer(),
      body: pressBackAgainToClose(
        child: Stack(
          children: [
            if (_isLoading)
              Stack(
                children: [
                  Container(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  TextFormField(
                    enabled: !_isLoading,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                    validator: RequiredValidator(errorText: 'Name is required'),
                    onSaved: (value) => _name = value!,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    enabled: !_isLoading,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                    ),
                    validator: _phoneNumberValidator,
                    onSaved: (value) => _phone = value!,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    enabled: !_isLoading,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onSaved: (value) => _email = value!,
                    validator: _emailValidator,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    enabled: !_isLoading,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
                    onSaved: (value) => _message = value!,
                    validator:
                        RequiredValidator(errorText: 'Message is required'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Message',
                      alignLabelWithHint: true,
                    ),
                    maxLines: 10,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: !_isLoading
                        ? () async {
                            setState(() {
                              _isLoading = true;
                            });
                            String _deviceName = await getDeviceName();
                            _formKey.currentState!.save();
                            bool _isValid = _formKey.currentState!.validate();
                            if (_isValid) {
                              CloudFirestoreService().addEnquiry(
                                name: _name!,
                                email: _email!,
                                phoneNumber: _phone!,
                                message: _message!,
                                deviceName: _deviceName,
                              );

                              ScaffoldMessenger.of(context).showMaterialBanner(
                                MaterialBanner(
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      'Hey ${_name!.split(" ")[0]}, Your query submitted successfully! We will contact you soon.',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText1,
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () =>
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentMaterialBanner(),
                                      child: const Text('Okay'),
                                    ),
                                  ],
                                ),
                              );
                            }

                            setState(() {
                              _isLoading = false;
                            });
                          }
                        : null,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.model ?? '';
  }
}
