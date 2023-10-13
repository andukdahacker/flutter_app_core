import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../modules/logger/app_logger.dart';
import '../../exceptions/internal_server_exception.dart';

class BlocUtils {
  static EventTransformer<Event> debounce<Event>(Duration duration) {
    return (events, mapper) => events.debounce(duration).switchMap(mapper);
  }

}
