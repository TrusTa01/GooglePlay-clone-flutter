sealed class AppLaunchState {
  const AppLaunchState();
}

final class AppLaunchBootstrapping extends AppLaunchState {
  const AppLaunchBootstrapping();
}

final class AppLaunchFailed extends AppLaunchState {
  final bool isRetrying;
  const AppLaunchFailed({this.isRetrying = false});
}

final class AppLaunchReady extends AppLaunchState {
  const AppLaunchReady();
}
