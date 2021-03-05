import 'services.dart';

export 'package:black_hole_flutter/black_hole_flutter.dart';
export 'package:collection/collection.dart';
export 'package:flutter/foundation.dart' hide binarySearch, mergeSort;
export 'package:meta/meta.dart';

export 'routing.dart' show webUrl;
export 'services.dart' hide initServices;
export 'utils.dart';
export 'widgets/app.dart';
export 'widgets/app_bar.dart';

Future<void> initApp() => initServices();
