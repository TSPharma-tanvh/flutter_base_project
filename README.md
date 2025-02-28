Set up the project (required to run):

- BrandLoading to show app icon when loading not add the icon yet, it is still empty. Search BrandLoading to add the app icon.
- Add hide/show password in CustomTextField class: search for AppSvg and before that, add that icon to AppSvg.
- Change all svg in BottomSheetWidget before use, see change color of svg in this class too

How to use:

- how to put {id} in the ApiEndPoints string has example in ApiEndpoints class

How to run the project

- flutter clean
- flutter pub get
- dart run build_runner build --delete-conflicting-outputs (to run build scripts generate .g files used for model classes)
- cd core
- flutter pub get
- dart run intl_utils:generate (to generate new translation)

build app bundle:

- flutter build appbundle --release

Firebase location file:

- firebase.json in the root project, same level with pubspec.yaml
- googleservice-info.plist in ios/runner, same level with info.plist
- google-services.json in android/app, same level with build.gradle
- firebase_options in lib/, same level with main.dart

- how to create a mini app and config mini app

- flutter package create miniapp_name
- rename main.dart file and extends StandardConnection from Core
- required: init, createView, getRoutes
- optional: onEVentMiniApp

- intl pages: @\_MAIN_APP, @\_BOTTOM_BAR, @\_CART_PAGE, @AUTH_PAGE, @\_CONSULTANT_POP_UP, @HOME_PAGE, @NOTIFICATION_PAGE, @VOUCHER_PAGE, @USER_PAGE, @VALIDATE, @CALENDAR, @CONFIRM_ADDRESS_PAGE, @\_ADDRESS_PAGE
