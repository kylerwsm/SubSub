import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
// import 'package:solid_spork/user_screens/home_view.dart';
// import 'package:solid_spork/services/auth.dart';
// import 'package:solid_spork/skeletons/skeleton_screen.dart';
// import 'package:solid_spork/models/person_profile.dart';
// import 'package:solid_spork/user_screens/account.dart';
// import 'package:solid_spork/models/data.dart';
// import 'package:provider/provider.dart';

class BasicDialogs {
  BasicDialogs();

  void showUnavailableDialog(BuildContext context) {
    _showPlatformSpecificDialog(
        context: context,
        dialogTitle: 'Coming Soon',
        dialogDesc: 'Feature is still in-progress, and will be coming soon. Thank you for your patience!',
        leftOption: 'Dismiss',
        leftAction: null,
        rightOption: null,
        rightAction: null);
  }

  void logoutConfirmationDialog(
      BuildContext context, VoidCallback signOutAction) {
    _showPlatformSpecificDialog(
        context: context,
        dialogTitle: 'Logout',
        dialogDesc: 'You will be returned to the login screen.',
        leftOption: 'Cancel',
        leftAction: null,
        rightOption: 'Logout',
        rightAction: signOutAction);
  }

  void _showPlatformSpecificDialog(
      {BuildContext context,
      String dialogTitle,
      String dialogDesc,
      String leftOption,
      VoidCallback leftAction,
      String rightOption,
      VoidCallback rightAction}) {
    rightOption != null
        ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return Platform.isIOS
                  ? CupertinoAlertDialog(
                      title: new Text(dialogTitle),
                      content: new Text(dialogDesc),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child: Text(leftOption),
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (leftAction != null) {
                              leftAction();
                            }
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text(rightOption),
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (rightAction != null) {
                              rightAction();
                            }
                          },
                        )
                      ],
                    )
                  : AlertDialog(
                      title: new Text(dialogTitle),
                      content: new Text(dialogDesc),
                      actions: <Widget>[
                        // Buttons for the dialog box.
                        new FlatButton(
                          child: new Text(leftOption),
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (leftAction != null) {
                              leftAction();
                            }
                          },
                        ),
                        rightOption != null
                            ? new FlatButton(
                                child: new Text(rightOption),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  if (rightAction != null) {
                                    rightAction();
                                  }
                                },
                              )
                            : null
                      ],
                    );
            })
        : showDialog(
            context: context,
            builder: (BuildContext context) {
              return Platform.isIOS
                  ? CupertinoAlertDialog(
                      title: new Text(dialogTitle),
                      content: new Text(dialogDesc),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child: Text(leftOption),
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (leftAction != null) {
                              leftAction();
                            }
                          },
                        )
                      ],
                    )
                  : AlertDialog(
                      title: new Text(dialogTitle),
                      content: new Text(dialogDesc),
                      actions: <Widget>[
                        // Buttons for the dialog box.
                        new FlatButton(
                          child: new Text(leftOption),
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (leftAction != null) {
                              leftAction();
                            }
                          },
                        )
                      ],
                    );
            });
  }
}
