# Verloop's flutter SDK

This is a wrapper over native verloop's [iOS](https://github.com/verloop/ios-sdk) and [Android](https://github.com/verloop/android-sdk) SDK.

You can checkout sample app for any clarification on the usage of the SDK

## Getting Started

Here we are adding verloop chat button as a floating action button in the app. You can attach the widget at any other place too

On press is internally handled by the `VerloopWidget` using `onTap` of `GestureDetector` widget



```dart
const String _clientId = "ClientID"; // You need to use the name of your organisation here

final Map<String,String> userVariableMap = Map();
userVariableMap['key1'] = 'value1';

final Map<String,String> roomVariableMap = Map();
roomVariableMap['key2'] = 'value2';

Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      floatingActionButton: const VerloopWidget(
        clientId: _clientId,            // Required
        userId: "<user_id>",            // Optional: add this if you want to associate all the chats of this user across the platforms 
        recipeId: "<recipe_id>",        // Optional: if you wish to use any other recipe apart from the default one, use this
        fcmToken: "<fcm_token>",        // Optional: this would help us to send the notification on the device. You still need to handle the fcm notifications.
        userName: "<user_name>",        // Optional: This would populate the system variable for user name which would help you identify the user. else the name of the user would be autogenerated like "guest-123"
        userEmail: "<user_email>",      // Optional: This would populate the system variable for emails
        userPhone: "<user_phone>",      // Optional: This would populate the system variable for Phone number
        userVariables: userVariableMap, // Optional: These are the global variables of the user which is associated with the given userId. These variables would be used by the recipe. These values would spill over to the another room once the current conversation is over.
        roomVariables: roomVariableMap, // Optional: These variables would be used by the recipe and will not spill over another room created by the user once the conversation is over
        overrideUrlOnClick: false,      // Optional: this is by default false, if you don't want the url to open in the browser, and want to handle internally in the app, make it as false
        child: FloatingActionButton(    // This can be replaced with any widget 
          onPressed: null,
          child: Icon(Icons.chat),
        ),
      ),
    ),
  );
}
```

### Button click listeners
These button are defined as a part of the conversational flow. Once the user clicks the button, you can listen to the events in your flutter app.
A very common use case for this is navigating the user to another section of the app if button is clicked inside the recipe

```dart

```

### Url click listeners

### Handling notifications

`flutter pub add firebase_messaging`

follow this https://firebase.google.com/docs/flutter/setup
