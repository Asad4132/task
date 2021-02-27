import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/TaskApp.dart';
import 'package:task/Utilities.dart';
import 'package:task/login/model/User.dart';
import 'package:task/login/presenter/LoginManager.dart';
import 'package:task/login/view/LoginPageMVPView.dart';
import 'package:task/tasks/view/TasksPage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginPageMVPView {
  TextEditingController _userEmailController, _userPasswordController;
  bool _passwordVisible;
  int showLoader = 0;
  final _formKey = new GlobalKey<FormState>();
  LoginManager _loginManager;

  @override
  void initState() {
    super.initState();
    _loginManager = LoginManager();
    _loginManager.attachView(this);

    _userEmailController = TextEditingController();
    _userPasswordController = TextEditingController();
    _passwordVisible = false;
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image(
                    fit: BoxFit.fill,
                    height: height * 0.28,
                    width: width,
                    image: AssetImage('assets/images/todo_logo.gif'),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(32, height * 0.07, 32, 8),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _userEmailController,
                        validator: (val) {
                          bool valid = !RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val);
                          return valid ? 'Please enter a valid email' : null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _userPasswordController,
                      validator: (val) =>
                          val.length < 6 ? 'Password too short.' : null,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Colors.blueAccent.shade700,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.blue.shade300, fontSize: 16),
                              ),
                            ),
                            onPressed: () async {
                              _formKey.currentState.validate();

                              if (_userPasswordController.text.isNotEmpty &&
                                  _userEmailController.text.isNotEmpty) {
                                String email = _userEmailController.text;
                                if (RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(email)) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());

                                  setState(() {
                                    showLoader++;
                                  });
                                  _loginManager.login(_userEmailController.text,
                                      _userPasswordController.text);
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.blue.shade700,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        32.0, height * 0.065, 32, height * 0.06),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,
                          ),
                        ),
                        Text(
                          ' OR ',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 56, vertical: 0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Colors.green.shade600,
                            padding: EdgeInsets.zero,
                            child: Text(
                              'Create New Account',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Visibility(
                visible: showLoader == 0 ? false : true,
                child: Theme(
                    data: ThemeData(
                        cupertinoOverrideTheme:
                            CupertinoThemeData(brightness: Brightness.light)),
                    child: CupertinoActivityIndicator(
                      radius: 30,
                    ))),
          )
        ],
      ),
    );
  }

  @override
  onLoadUserInfo(UserClass user) async {
    await TaskApp.getPreferenceManager().saveUser(user);
    setState(() {
      showLoader--;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TasksPage()));
  }

  @override
  void showError(String desc) {
    setState(() {
      showLoader--;
    });
    desc != null
        ? Utilities.showRedToast(desc)
        : Utilities.showRedToast('Unknown Error');
  }
}
