import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn
            ? DashboardWidget()
            : LoginOrSignupWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? DashboardWidget()
              : LoginOrSignupWidget(),
          routes: [
            FFRoute(
              name: 'Ranking',
              path: 'ranking',
              builder: (context, params) => RankingWidget(),
            ),
            FFRoute(
              name: 'feedback',
              path: 'feedback',
              builder: (context, params) => FeedbackWidget(
                reviewed: params.getParam(
                  'reviewed',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'LoginOrSignup',
              path: 'loginOrSignup',
              builder: (context, params) => LoginOrSignupWidget(),
            ),
            FFRoute(
              name: 'EditProfile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(),
            ),
            FFRoute(
              name: 'Signup',
              path: 'signup',
              builder: (context, params) => SignupWidget(),
            ),
            FFRoute(
              name: 'UserClassification',
              path: 'userClassification',
              builder: (context, params) => UserClassificationWidget(),
            ),
            FFRoute(
              name: 'Dashboard',
              path: 'dashboard',
              builder: (context, params) => DashboardWidget(),
            ),
            FFRoute(
              name: 'Search',
              path: 'search',
              builder: (context, params) => SearchWidget(),
            ),
            FFRoute(
              name: 'Newpost',
              path: 'newpost',
              builder: (context, params) => NewpostWidget(
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'AddLocation',
              path: 'addLocation',
              builder: (context, params) => AddLocationWidget(),
            ),
            FFRoute(
              name: 'CreateProf',
              path: 'createProf',
              builder: (context, params) => CreateProfWidget(
                accType: params.getParam(
                  'accType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Settings',
              path: 'settings',
              builder: (context, params) => SettingsWidget(),
            ),
            FFRoute(
              name: 'Notifications',
              path: 'notifications',
              builder: (context, params) => NotificationsWidget(),
            ),
            FFRoute(
              name: 'UserActivity',
              path: 'userActivity',
              builder: (context, params) => UserActivityWidget(),
            ),
            FFRoute(
              name: 'Report',
              path: 'report',
              builder: (context, params) => ReportWidget(),
            ),
            FFRoute(
              name: 'Block',
              path: 'block',
              builder: (context, params) => BlockWidget(
                fname: params.getParam(
                  'fname',
                  ParamType.String,
                ),
                lname: params.getParam(
                  'lname',
                  ParamType.String,
                ),
                username: params.getParam(
                  'username',
                  ParamType.String,
                ),
                toBeBlocked: params.getParam(
                  'toBeBlocked',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'HelpCenter',
              path: 'helpCenter',
              builder: (context, params) => HelpCenterWidget(),
            ),
            FFRoute(
              name: 'Guide',
              path: 'guide',
              builder: (context, params) => GuideWidget(),
            ),
            FFRoute(
              name: 'FAQ',
              path: 'faq',
              builder: (context, params) => FaqWidget(),
            ),
            FFRoute(
              name: 'Community',
              path: 'community',
              builder: (context, params) => CommunityWidget(),
            ),
            FFRoute(
              name: 'Retrieve',
              path: 'retrieve',
              builder: (context, params) => RetrieveWidget(),
            ),
            FFRoute(
              name: 'PostExpansion',
              path: 'post',
              requireAuth: true,
              builder: (context, params) => PostExpansionWidget(
                post: params.getParam(
                  'post',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['posts'],
                ),
              ),
            ),
            FFRoute(
              name: 'CreateTicket',
              path: 'createTicket',
              builder: (context, params) => CreateTicketWidget(),
            ),
            FFRoute(
              name: 'NotifPreference',
              path: 'notifPreference',
              builder: (context, params) => NotifPreferenceWidget(),
            ),
            FFRoute(
              name: 'ResetPassword',
              path: 'resetPassword',
              builder: (context, params) => ResetPasswordWidget(),
            ),
            FFRoute(
              name: 'ChatPage',
              path: 'chatPage',
              asyncParams: {
                'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam(
                  'chatUser',
                  ParamType.Document,
                ),
                chatRef: params.getParam(
                  'chatRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chats'],
                ),
              ),
            ),
            FFRoute(
              name: 'Chats',
              path: 'chats',
              builder: (context, params) => ChatsWidget(),
            ),
            FFRoute(
              name: 'StartConvo',
              path: 'startConvo',
              builder: (context, params) => StartConvoWidget(),
            ),
            FFRoute(
              name: 'calendar',
              path: 'calendar',
              builder: (context, params) => CalendarWidget(),
            ),
            FFRoute(
              name: 'ApplicationPage',
              path: 'applicationPage',
              builder: (context, params) => ApplicationPageWidget(
                post: params.getParam(
                  'post',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['posts'],
                ),
              ),
            ),
            FFRoute(
              name: 'EventMap',
              path: 'eventMap',
              builder: (context, params) => EventMapWidget(),
            ),
            FFRoute(
              name: 'TermsCondition',
              path: 'termsCondition',
              builder: (context, params) => TermsConditionWidget(
                event: params.getParam(
                  'event',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['posts'],
                ),
                date: params.getParam(
                  'date',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['posts'],
                ),
                venue: params.getParam(
                  'venue',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['posts'],
                ),
              ),
            ),
            FFRoute(
              name: 'EditPost',
              path: 'editPost',
              builder: (context, params) => EditPostWidget(
                post: params.getParam(
                  'post',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['posts'],
                ),
              ),
            ),
            FFRoute(
              name: 'Privacy',
              path: 'privacy',
              builder: (context, params) => PrivacyWidget(),
            ),
            FFRoute(
              name: 'BlockList',
              path: 'blockList',
              builder: (context, params) => BlockListWidget(),
            ),
            FFRoute(
              name: 'ViewProfile',
              path: 'viewProfile',
              builder: (context, params) => ViewProfileWidget(),
            ),
            FFRoute(
              name: 'ReviewRate_Perfect',
              path: 'reviewRatePerfect',
              builder: (context, params) => ReviewRatePerfectWidget(),
            ),
            FFRoute(
              name: 'ReviewRateTheArtist',
              path: 'reviewRateTheArtist',
              builder: (context, params) => ReviewRateTheArtistWidget(),
            ),
            FFRoute(
              name: 'YourApplications',
              path: 'yourApplications',
              builder: (context, params) => YourApplicationsWidget(),
            ),
            FFRoute(
              name: 'ListEvents',
              path: 'listEvents',
              builder: (context, params) => ListEventsWidget(),
            ),
            FFRoute(
              name: 'Applicants',
              path: 'applicants',
              builder: (context, params) => ApplicantsWidget(
                post: params.getParam(
                  'post',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['posts'],
                ),
              ),
            ),
            FFRoute(
              name: 'JobLisitings',
              path: 'jobLisitings',
              builder: (context, params) => JobLisitingsWidget(),
            ),
            FFRoute(
              name: 'otherprofile',
              path: 'otherprofile',
              builder: (context, params) => OtherprofileWidget(
                performer: params.getParam(
                  'performer',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                organizer: params.getParam(
                  'organizer',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'ViewApplication',
              path: 'viewApplication',
              builder: (context, params) => ViewApplicationWidget(
                applicant: params.getParam(
                  'applicant',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['applications'],
                ),
              ),
            ),
            FFRoute(
              name: 'UA_Likes',
              path: 'uALikes',
              builder: (context, params) => UALikesWidget(),
            ),
            FFRoute(
              name: 'UploadPortfolio',
              path: 'uploadPortfolio',
              builder: (context, params) => UploadPortfolioWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginOrSignup';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/SoftDev_Project_Proposal_(Your_Story).gif',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
