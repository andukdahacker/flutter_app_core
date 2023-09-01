# omt_base_project

Base project use Getx, MVVM design pattern and Clean architecture.\
Created by HoaNV.

## How to run project

1. git clone http://git.omt.vn/hoanv/omt_base_flutter.git
2. run `flutter pub get && flutter packages pub run build_runner build -d` by terminal
3. run project by terminal `flutter run -t lib/main/main_dev.dart` for 'develop environment' and `flutter run -t lib/main/main_prod.dart` for 'product environment'.

## Directory structure

1. `configs`: config environment project by flavor.
2. `l10n`: contains project's language files.
3. `main`: initialize the project's initial modules.
4. `module`: contains the project's dependency injector.
5. `src`: source code project
- `app`:  app's main module contain common states like: language, theme mode,...
- `base`: contains project's code base like: base_cubit, handle error from server, base navigation, resource, mixin, constant,....
- `feature`: contain project's features.
- `helper`: contains the general utility of the project.
- `routes`: folder containing the project's navigation, includes: app route config, implement navigator, middleware, observer.

## Rule convention

1. Apply [SOLID](https://www.freecodecamp.org/news/solid-principles-explained-in-plain-english/) principles in object-oriented programming.
2. In the project that uses flutter's built-in rules defined in the file `analysis_options.yaml`. Detailed information about the [rules](https://dart.dev/tools/linter-rules) used.
3. Each feature should be moduled for app's each function, eg: auth feature will include: login, forgot password,...