import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';

class WebRegistration extends StatefulWidget {
  const WebRegistration({Key? key}) : super(key: key);

  @override
  State<WebRegistration> createState() => _WebRegistrationState();
}

class _WebRegistrationState extends State<WebRegistration> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final mobile = TextEditingController();
  final id1 = TextEditingController();
  final id2 = TextEditingController();
  final income = TextEditingController();
  final expenses = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 100),
        child: Expanded(
          child: Card(
            color: const Color.fromARGB(255, 251, 252, 250),
            child: Row(
              children: [
                Container(
                  color: mainAppColor,
                  width: 1 / 6 * width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Lets Get you Started'.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Divider(
                          height: 1 / 8 * height,
                          color: Colors.transparent,
                        ),
                        const Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        const Divider(
                          color: Colors.transparent,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.yellow,
                          ),
                          onPressed: () {},
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    width: 1.6 / 3 * width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Align(
                                child: Text(
                                  'Fill In form to get registered',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                            ),
                            const Divider(
                              // height: 1 / 10 * height,
                              color: Colors.transparent,
                            ),
                            SizedBox(
                              width: 1.6 / 3 * width,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildTextField('First Name', false,
                                        firstName, 0.2 * width),
                                    buildTextField('Last Name', false, lastName,
                                        0.2 * width),
                                  ]),
                            ),
                            buildTextField('Physical Address', true, address,
                                1.6 / 3 * width),
                            buildTextField(
                                'Email Address', false, email, 1.6 / 3 * width),
                            buildTextField(
                                'Mobile Number', false, mobile, 0.2 * width),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildTextField(
                                      'ID 1', false, id1, 0.2 * width),
                                  buildTextField(
                                      'ID 2', false, id2, 0.2 * width),
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildTextField('Monthly Income', true, income,
                                      0.2 * width),
                                  buildTextField('Monthly Expenses', true,
                                      expenses, 0.2 * width),
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: mainAppColor),
                                  onPressed: () {},
                                  child: const Text('Cancel'),
                                ),
                                const VerticalDivider(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: mainAppColor,
                                  ),
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Processing'),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text('Register'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildTextField(
    String labelText,
    bool isNumber,
    TextEditingController controller,
    double width,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
        // left: 10,
      ),
      child: Container(
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), border: Border.all()),
        child: TextFormField(
          controller: controller,
          // obscureText: isPassword,
          keyboardType: isNumber
              ? const TextInputType.numberWithOptions()
              : TextInputType.text,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              // hintText: hintText,
              labelText: labelText,
              // prefixIcon: icon,
              border: InputBorder.none),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required';
            }
            return null;
          },
        ),
      ),
    );
  }
}
