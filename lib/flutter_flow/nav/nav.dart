import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/ams_1701035325_7064.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            )
          : const HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/ams_1701035325_7064.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              : const HomePageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/Dashboard',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'Om_Barnet',
          path: '/omBarnet',
          builder: (context, params) => const OmBarnetWidget(),
        ),
        FFRoute(
          name: 'Forealdre',
          path: '/forealdre',
          builder: (context, params) => const ForealdreWidget(),
        ),
        FFRoute(
          name: 'Lydboger',
          path: '/lydboger',
          builder: (context, params) => const LydbogerWidget(),
        ),
        FFRoute(
          name: 'Kontakt',
          path: '/kontakt',
          builder: (context, params) => const KontaktWidget(),
        ),
        FFRoute(
          name: 'Indstillinger',
          path: '/indstillinger',
          builder: (context, params) => const IndstillingerWidget(),
        ),
        FFRoute(
          name: 'Side1-2',
          path: '/om-barnet-1-2',
          builder: (context, params) => const Side12Widget(),
        ),
        FFRoute(
          name: 'Side3-4',
          path: '/om-barnet-3-4',
          builder: (context, params) => const Side34Widget(),
        ),
        FFRoute(
          name: 'Side5-6',
          path: '/om-barnet-5-6',
          builder: (context, params) => const Side56Widget(),
        ),
        FFRoute(
          name: 'Boger_Til_Foraeldre',
          path: '/bogerTilForaeldre',
          builder: (context, params) => const BogerTilForaeldreWidget(),
        ),
        FFRoute(
          name: 'Forldreforberedelse0-9mnd',
          path: '/rygningOgRusmidler-Hash',
          builder: (context, params) => const Forldreforberedelse09mndWidget(),
        ),
        FFRoute(
          name: 'Side0-1',
          path: '/om-barnet-0-1',
          builder: (context, params) => const Side01Widget(),
        ),
        FFRoute(
          name: 'Boern',
          path: '/boern',
          builder: (context, params) => const BoernWidget(),
        ),
        FFRoute(
          name: 'ManuminafoldebogBarnetfrstebog',
          path: '/forldreforberedelse-graviditet-fodsel',
          builder: (context, params) => const ManuminafoldebogBarnetfrstebogWidget(),
        ),
        FFRoute(
          name: 'Barnet1og2',
          path: '/Barnet1og2',
          builder: (context, params) => const Barnet1og2Widget(),
        ),
        FFRoute(
          name: 'Barnet3og4',
          path: '/Barnet3og4',
          builder: (context, params) => const Barnet3og4Widget(),
        ),
        FFRoute(
          name: 'Barnet5og6',
          path: '/Barnet5og6',
          builder: (context, params) => const Barnet5og6Widget(),
        ),
        FFRoute(
          name: 'Hash_information',
          path: '/Hash_information',
          builder: (context, params) => const HashInformationWidget(),
        ),
        FFRoute(
          name: 'Information_om_alkohol',
          path: '/Information_om_alkohol',
          builder: (context, params) => const InformationOmAlkoholWidget(),
        ),
        FFRoute(
          name: 'Til_forldre_om_bedsteforldre',
          path: '/Til_forldre_om_bedsteforldre',
          builder: (context, params) => const TilForldreOmBedsteforldreWidget(),
        ),
        FFRoute(
          name: 'Ekstra_materiale',
          path: '/ekstraMateriale',
          builder: (context, params) => const EkstraMaterialeWidget(),
        ),
        FFRoute(
          name: 'Plastickort1-2',
          path: '/Plastickort1-2',
          builder: (context, params) => const Plastickort12Widget(),
        ),
        FFRoute(
          name: 'Spilleregler5-6',
          path: '/Spilleregler5-6',
          builder: (context, params) => const Spilleregler56Widget(),
        ),
        FFRoute(
          name: 'Animationsvideoer',
          path: '/animationsvideoer',
          builder: (context, params) => const AnimationsvideoerWidget(),
        ),
        FFRoute(
          name: 'Fagfolk',
          path: '/fagfolk',
          builder: (context, params) => const FagfolkWidget(),
        ),
        FFRoute(
          name: 'Borneboger',
          path: '/borneboger',
          builder: (context, params) => const BornebogerWidget(),
        ),
        FFRoute(
          name: 'ManuminastarteriskoleBog',
          path: '/ManuminastarteriskoleBog',
          builder: (context, params) => const ManuminastarteriskoleBogWidget(),
        ),
        FFRoute(
          name: 'Manuminaharskoldkopperbog',
          path: '/Manuminaharskoldkopperbog',
          builder: (context, params) => const ManuminaharskoldkopperbogWidget(),
        ),
        FFRoute(
          name: 'Manuminasflelserbog',
          path: '/Manuminasflelserbog',
          builder: (context, params) => const ManuminasflelserbogWidget(),
        ),
        FFRoute(
          name: 'Manuminaskropbog',
          path: '/Manuminaskropbog',
          builder: (context, params) => const ManuminaskropbogWidget(),
        ),
        FFRoute(
          name: 'Manuminalegerbog',
          path: '/Manuminalegerbog',
          builder: (context, params) => const ManuminalegerbogWidget(),
        ),
        FFRoute(
          name: 'Manuminavaskerhnderbog',
          path: '/Manuminavaskerhnderbog',
          builder: (context, params) => const ManuminavaskerhnderbogWidget(),
        ),
        FFRoute(
          name: 'Manuminasovgodtbog',
          path: '/Manuminasovgodtbog',
          builder: (context, params) => const ManuminasovgodtbogWidget(),
        ),
        FFRoute(
          name: 'KunukflytterOpgavehfte',
          path: '/KunukflytterOpgavehfte',
          builder: (context, params) => const KunukflytterOpgavehfteWidget(),
        ),
        FFRoute(
          name: 'Hftetilforldre',
          path: '/hftetilforldre',
          builder: (context, params) => const HftetilforldreWidget(),
        ),
        FFRoute(
          name: 'Ditbarnstarteriskole',
          path: '/Ditbarnstarteriskole',
          builder: (context, params) => const DitbarnstarteriskoleWidget(),
        ),
        FFRoute(
          name: 'Ditbarnsfrstebog',
          path: '/Ditbarnsfrstebog',
          builder: (context, params) => const DitbarnsfrstebogWidget(),
        ),
        FFRoute(
          name: 'Ditsygebarn',
          path: '/Ditsygebarn',
          builder: (context, params) => const DitsygebarnWidget(),
        ),
        FFRoute(
          name: 'Ditbarnsflelser',
          path: '/Ditbarnsflelser',
          builder: (context, params) => const DitbarnsflelserWidget(),
        ),
        FFRoute(
          name: 'Ditbarnskrop',
          path: '/Ditbarnskrop',
          builder: (context, params) => const DitbarnskropWidget(),
        ),
        FFRoute(
          name: 'Ditbarnvaskerhnder',
          path: '/Ditbarnvaskerhnder',
          builder: (context, params) => const DitbarnvaskerhnderWidget(),
        ),
        FFRoute(
          name: 'Ditbarnssvn',
          path: '/Ditbarnssvn',
          builder: (context, params) => const DitbarnssvnWidget(),
        ),
        FFRoute(
          name: 'Ditbarnslegogbevgelse',
          path: '/Ditbarnslegogbevgelse',
          builder: (context, params) => const DitbarnslegogbevgelseWidget(),
        ),
        FFRoute(
          name: 'Plakat',
          path: '/Plakat',
          builder: (context, params) => const PlakatWidget(),
        ),
        FFRoute(
          name: 'Downloads',
          path: '/downloads',
          builder: (context, params) => const DownloadsWidget(),
        ),
        FFRoute(
          name: 'F0-9',
          path: '/f09',
          builder: (context, params) => const F09Widget(),
        ),
        FFRoute(
          name: 'F1-2',
          path: '/f12',
          builder: (context, params) => const F12Widget(),
        ),
        FFRoute(
          name: 'F3-4',
          path: '/f34',
          builder: (context, params) => const F34Widget(),
        ),
        FFRoute(
          name: 'F5-6',
          path: '/f56',
          builder: (context, params) => const F56Widget(),
        ),
        FFRoute(
          name: 'F-Alkohol',
          path: '/fAlkohol',
          builder: (context, params) => const FAlkoholWidget(),
        ),
        FFRoute(
          name: 'F-Hash',
          path: '/fHash',
          builder: (context, params) => const FHashWidget(),
        ),
        FFRoute(
          name: 'F-Instruktr',
          path: '/fInstruktr',
          builder: (context, params) => const FInstruktrWidget(),
        ),
        FFRoute(
          name: 'F-Foreldremodet',
          path: '/fForeldremodet',
          builder: (context, params) => const FForeldremodetWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
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
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
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
