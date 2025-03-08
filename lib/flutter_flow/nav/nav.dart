import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? SplashGlobalWidget() : OnbordingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SplashGlobalWidget()
              : OnbordingWidget(),
          routes: [
            FFRoute(
              name: OnbordingWidget.routeName,
              path: OnbordingWidget.routePath,
              builder: (context, params) => OnbordingWidget(),
            ),
            FFRoute(
              name: LoginSmsWidget.routeName,
              path: LoginSmsWidget.routePath,
              builder: (context, params) => LoginSmsWidget(
                number: params.getParam(
                  'number',
                  ParamType.String,
                ),
                driverName: params.getParam(
                  'driverName',
                  ParamType.String,
                ),
                driverLastName: params.getParam(
                  'driverLastName',
                  ParamType.String,
                ),
                companyRef: params.getParam(
                  'companyRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users', 'company'],
                ),
                assignUser: params.getParam(
                  'assignUser',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: SmsConfirmWidget.routeName,
              path: SmsConfirmWidget.routePath,
              builder: (context, params) => SmsConfirmWidget(
                number: params.getParam(
                  'number',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AddNewOrderWidget.routeName,
              path: AddNewOrderWidget.routePath,
              builder: (context, params) => AddNewOrderWidget(),
            ),
            FFRoute(
              name: NotificationPageWidget.routeName,
              path: NotificationPageWidget.routePath,
              builder: (context, params) => NotificationPageWidget(),
            ),
            FFRoute(
              name: TehnikMoreWidget.routeName,
              path: TehnikMoreWidget.routePath,
              asyncParams: {
                'tehnikDoc':
                    getDoc(['users', 'tehnika'], TehnikaRecord.fromSnapshot),
                'tehModeDoc': getDoc(['spravochnik_tekhnika'],
                    SpravochnikTekhnikaRecord.fromSnapshot),
                'oborudDoc': getDoc(
                    ['users', 'dop_oborud'], DopOborudRecord.fromSnapshot),
              },
              builder: (context, params) => TehnikMoreWidget(
                tehnikDoc: params.getParam(
                  'tehnikDoc',
                  ParamType.Document,
                ),
                tehModeDoc: params.getParam(
                  'tehModeDoc',
                  ParamType.Document,
                ),
                oborudDoc: params.getParam(
                  'oborudDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: ContactPageWidget.routeName,
              path: ContactPageWidget.routePath,
              builder: (context, params) => ContactPageWidget(),
            ),
            FFRoute(
              name: OrderDetailZWidget.routeName,
              path: OrderDetailZWidget.routePath,
              builder: (context, params) => OrderDetailZWidget(
                orderRef: params.getParam(
                  'orderRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['orders'],
                ),
              ),
            ),
            FFRoute(
              name: AddNewTechnikWidget.routeName,
              path: AddNewTechnikWidget.routePath,
              builder: (context, params) => AddNewTechnikWidget(),
            ),
            FFRoute(
              name: ListEmployersWidget.routeName,
              path: ListEmployersWidget.routePath,
              builder: (context, params) => ListEmployersWidget(),
            ),
            FFRoute(
              name: HomePageWidget.routeName,
              path: HomePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => HomePageWidget(),
            ),
            FFRoute(
              name: CabinetPageWidget.routeName,
              path: CabinetPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => CabinetPageWidget(),
            ),
            FFRoute(
              name: ListTechnikaWidget.routeName,
              path: ListTechnikaWidget.routePath,
              builder: (context, params) => ListTechnikaWidget(),
            ),
            FFRoute(
              name: EmployersMoreWidget.routeName,
              path: EmployersMoreWidget.routePath,
              asyncParams: {
                'userref': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => EmployersMoreWidget(
                userref: params.getParam(
                  'userref',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: AddOfferWidget.routeName,
              path: AddOfferWidget.routePath,
              asyncParams: {
                'orderDoc': getDoc(['orders'], OrdersRecord.fromSnapshot),
              },
              builder: (context, params) => AddOfferWidget(
                orderDoc: params.getParam(
                  'orderDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: FaqPageWidget.routeName,
              path: FaqPageWidget.routePath,
              builder: (context, params) => FaqPageWidget(),
            ),
            FFRoute(
              name: OffersMoreWidget.routeName,
              path: OffersMoreWidget.routePath,
              asyncParams: {
                'orderDoc': getDoc(['orders'], OrdersRecord.fromSnapshot),
              },
              builder: (context, params) => OffersMoreWidget(
                orderDoc: params.getParam(
                  'orderDoc',
                  ParamType.Document,
                ),
                oFFerDoc: params.getParam(
                  'oFFerDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['orders', 'offers'],
                ),
              ),
            ),
            FFRoute(
              name: ChatPageWidget.routeName,
              path: ChatPageWidget.routePath,
              builder: (context, params) => ChatPageWidget(
                chatRef: params.getParam(
                  'chatRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chats'],
                ),
              ),
            ),
            FFRoute(
              name: OffersPageWidget.routeName,
              path: OffersPageWidget.routePath,
              builder: (context, params) => OffersPageWidget(),
            ),
            FFRoute(
              name: ProjecksPageWidget.routeName,
              path: ProjecksPageWidget.routePath,
              builder: (context, params) => ProjecksPageWidget(),
            ),
            FFRoute(
              name: CreateCompanyWidget.routeName,
              path: CreateCompanyWidget.routePath,
              builder: (context, params) => CreateCompanyWidget(),
            ),
            FFRoute(
              name: AddLocationWidget.routeName,
              path: AddLocationWidget.routePath,
              builder: (context, params) => AddLocationWidget(
                myLocation: params.getParam(
                  'myLocation',
                  ParamType.LatLng,
                ),
              ),
            ),
            FFRoute(
              name: OfertaPageWidget.routeName,
              path: OfertaPageWidget.routePath,
              builder: (context, params) => OfertaPageWidget(),
            ),
            FFRoute(
              name: AddNewDopOborudWidget.routeName,
              path: AddNewDopOborudWidget.routePath,
              builder: (context, params) => AddNewDopOborudWidget(),
            ),
            FFRoute(
              name: OrderDetailIsWidget.routeName,
              path: OrderDetailIsWidget.routePath,
              builder: (context, params) => OrderDetailIsWidget(
                orderRef: params.getParam(
                  'orderRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['orders'],
                ),
              ),
            ),
            FFRoute(
              name: SplashPageWidget.routeName,
              path: SplashPageWidget.routePath,
              builder: (context, params) => SplashPageWidget(
                pincode: params.getParam(
                  'pincode',
                  ParamType.String,
                ),
                number: params.getParam(
                  'number',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: LoginWebWidget.routeName,
              path: LoginWebWidget.routePath,
              builder: (context, params) => LoginWebWidget(),
            ),
            FFRoute(
              name: MyOrdersWebZWidget.routeName,
              path: MyOrdersWebZWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MyOrdersWebZWidget(),
            ),
            FFRoute(
              name: NotificationWebWidget.routeName,
              path: NotificationWebWidget.routePath,
              builder: (context, params) => NotificationWebWidget(),
            ),
            FFRoute(
              name: MyTehnikAndOborudWebWidget.routeName,
              path: MyTehnikAndOborudWebWidget.routePath,
              builder: (context, params) => MyTehnikAndOborudWebWidget(),
            ),
            FFRoute(
              name: MyEmployersWebWidget.routeName,
              path: MyEmployersWebWidget.routePath,
              builder: (context, params) => MyEmployersWebWidget(),
            ),
            FFRoute(
              name: NewOrdersWebWidget.routeName,
              path: NewOrdersWebWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NewOrdersWebWidget(),
            ),
            FFRoute(
              name: AnsversWebWidget.routeName,
              path: AnsversWebWidget.routePath,
              builder: (context, params) => AnsversWebWidget(),
            ),
            FFRoute(
              name: SupportWebWidget.routeName,
              path: SupportWebWidget.routePath,
              builder: (context, params) => SupportWebWidget(),
            ),
            FFRoute(
              name: SplashPageWebWidget.routeName,
              path: SplashPageWebWidget.routePath,
              builder: (context, params) => SplashPageWebWidget(
                number: params.getParam(
                  'number',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SplashGlobalWidget.routeName,
              path: SplashGlobalWidget.routePath,
              builder: (context, params) => SplashGlobalWidget(),
            ),
            FFRoute(
              name: MoreOrdersZWidget.routeName,
              path: MoreOrdersZWidget.routePath,
              builder: (context, params) => MoreOrdersZWidget(
                orderRef: params.getParam(
                  'orderRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['orders'],
                ),
              ),
            ),
            FFRoute(
              name: MyCabinetWebWidget.routeName,
              path: MyCabinetWebWidget.routePath,
              builder: (context, params) => MyCabinetWebWidget(),
            ),
            FFRoute(
              name: OrdersWebIWidget.routeName,
              path: OrdersWebIWidget.routePath,
              requireAuth: true,
              builder: (context, params) => OrdersWebIWidget(),
            ),
            FFRoute(
              name: OtklikOrdersIWidget.routeName,
              path: OtklikOrdersIWidget.routePath,
              requireAuth: true,
              builder: (context, params) => OtklikOrdersIWidget(
                orderRef: params.getParam(
                  'orderRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['orders'],
                ),
              ),
            ),
            FFRoute(
              name: ProjectsIWidget.routeName,
              path: ProjectsIWidget.routePath,
              builder: (context, params) => ProjectsIWidget(),
            ),
            FFRoute(
              name: OfertaWebWidget.routeName,
              path: OfertaWebWidget.routePath,
              builder: (context, params) => OfertaWebWidget(),
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
            return '/onbording';
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
              ? isWeb
                  ? Container()
                  : Container(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      child: Image.asset(
                        'assets/images/T_App_logo_09.png',
                        fit: BoxFit.contain,
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

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
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
