import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _hidePassword = true;
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.centerLeft,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome Back!\n",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const Text(
                  "Please fill in your account details appropriately.",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black38),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "This field cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autocorrect: false,
                  obscureText: _hidePassword,
                  decoration: InputDecoration(
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        _hidePassword = !_hidePassword;
                        setState(() {});
                      },
                      icon: _hidePassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your password";
                    }

                    return null;
                  },
                  onSaved: (newValue) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _checkbox,
                      fillColor: MaterialStateProperty.all(Colors.black),
                      onChanged: (value) {
                        _checkbox = !_checkbox;
                        setState(() {});
                      },
                    ),
                    const Text("Remember me"),
                    const Expanded(
                      child: SizedBox(
                        width: 50,
                      ),
                    ),
                    InkWell(
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("This will go to reset password page"),
                        ));
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                                  Text("This will validate the form and send the data to the server"),
                            ));
                          },
                          color: Colors.black,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: const Text("Log in"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member ?"),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("This will go to sign up page"),
                        ));
                      },
                      child: const Text(
                        "Create account",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          height: 5,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("or"),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Divider(
                          height: 5,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("This will start the google login flow"),
                    ));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      width: 0.1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage("assets/google.png"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Sign in with Google"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("This will start the facebook login flow"),
                    ));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      width: 0.1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage("assets/facebook.png"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Sign in with Facebook"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
