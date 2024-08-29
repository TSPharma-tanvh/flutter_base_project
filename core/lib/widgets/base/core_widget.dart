part of '../../core.dart';

abstract class CoreWidget<T extends Cubit<CoreState>> extends StatefulWidget {
  final AppThemeCore? theme;

  const CoreWidget({
    super.key,
    this.theme,
  });

  @protected
  Widget build(BuildContext context, AppThemeCore theme, AppLocalizations tr);

  @protected
  @mustCallSuper
  void onInit(BuildContext context) {}

  @protected
  @mustCallSuper
  void onDispose(BuildContext context) {}

  @override
  State<CoreWidget<T>> createState() => _CoreWidgetState<T>();
}

class _CoreWidgetState<T extends Cubit<CoreState>>
    extends State<CoreWidget<T>> {
  @override
  void initState() {
    widget.onInit(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme ?? context.watch<T>().state.theme;
    final t = DeviceUtilsCore.languageOf(context);
    return widget.build(context, theme, t!);
  }

  @override
  void dispose() {
    widget.onDispose(context);
    super.dispose();
  }
}
