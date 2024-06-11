import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/SoftDev_Project_Proposal_(Your_Story).gif',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Ranking': ParameterData.none(),
  'feedback': (data) async => ParameterData(
        allParams: {
          'reviewed': getParameter<DocumentReference>(data, 'reviewed'),
        },
      ),
  'LoginOrSignup': ParameterData.none(),
  'EditProfile': ParameterData.none(),
  'Signup': ParameterData.none(),
  'UserClassification': ParameterData.none(),
  'Dashboard': ParameterData.none(),
  'Search': ParameterData.none(),
  'Newpost': (data) async => ParameterData(
        allParams: {
          'type': getParameter<String>(data, 'type'),
        },
      ),
  'AddLocation': ParameterData.none(),
  'CreateProf': (data) async => ParameterData(
        allParams: {
          'accType': getParameter<String>(data, 'accType'),
        },
      ),
  'Settings': ParameterData.none(),
  'Notifications': ParameterData.none(),
  'UserActivity': ParameterData.none(),
  'Report': ParameterData.none(),
  'Block': (data) async => ParameterData(
        allParams: {
          'fname': getParameter<String>(data, 'fname'),
          'lname': getParameter<String>(data, 'lname'),
          'username': getParameter<String>(data, 'username'),
          'toBeBlocked': getParameter<DocumentReference>(data, 'toBeBlocked'),
        },
      ),
  'HelpCenter': ParameterData.none(),
  'Guide': ParameterData.none(),
  'FAQ': ParameterData.none(),
  'Community': ParameterData.none(),
  'Retrieve': ParameterData.none(),
  'PostExpansion': (data) async => ParameterData(
        allParams: {
          'post': getParameter<DocumentReference>(data, 'post'),
        },
      ),
  'CreateTicket': ParameterData.none(),
  'NotifPreference': ParameterData.none(),
  'ResetPassword': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'Chats': ParameterData.none(),
  'StartConvo': ParameterData.none(),
  'calendar': ParameterData.none(),
  'ApplicationPage': (data) async => ParameterData(
        allParams: {
          'post': getParameter<DocumentReference>(data, 'post'),
        },
      ),
  'EventMap': ParameterData.none(),
  'TermsCondition': (data) async => ParameterData(
        allParams: {
          'event': getParameter<DocumentReference>(data, 'event'),
          'date': getParameter<DocumentReference>(data, 'date'),
          'venue': getParameter<DocumentReference>(data, 'venue'),
        },
      ),
  'EditPost': (data) async => ParameterData(
        allParams: {
          'post': getParameter<DocumentReference>(data, 'post'),
        },
      ),
  'Privacy': ParameterData.none(),
  'BlockList': ParameterData.none(),
  'ViewProfile': ParameterData.none(),
  'ReviewRate_Perfect': ParameterData.none(),
  'ReviewRateTheArtist': ParameterData.none(),
  'YourApplications': ParameterData.none(),
  'ListEvents': ParameterData.none(),
  'Applicants': (data) async => ParameterData(
        allParams: {
          'post': getParameter<DocumentReference>(data, 'post'),
        },
      ),
  'JobLisitings': ParameterData.none(),
  'otherprofile': (data) async => ParameterData(
        allParams: {
          'performer': getParameter<DocumentReference>(data, 'performer'),
          'organizer': getParameter<DocumentReference>(data, 'organizer'),
        },
      ),
  'ViewApplication': (data) async => ParameterData(
        allParams: {
          'applicant': getParameter<DocumentReference>(data, 'applicant'),
        },
      ),
  'UA_Likes': ParameterData.none(),
  'UploadPortfolio': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
