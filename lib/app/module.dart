import 'services.dart';

export 'routing.dart' show webUrl;
export 'services.dart' hide initServices;
export 'utils.dart';
export 'widgets/app.dart';

Future<void> initApp() => initServices();
