import 'services.dart';

export 'package:black_hole_flutter/black_hole_flutter.dart';
export 'package:collection/collection.dart';
export 'package:flutter/foundation.dart' hide binarySearch, mergeSort;
export 'package:flutter/material.dart';
export 'package:meta/meta.dart';
export 'package:todo/todo.dart';

export 'routing.dart' show webUrl;
export 'services.dart' hide initServices;
export 'utils.dart';
export 'widgets/app.dart';
export 'widgets/app_bar.dart';
export 'widgets/proportional_padding.dart';

Future<void> initApp() => initServices();
