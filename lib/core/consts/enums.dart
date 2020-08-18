import '../utils/screen_utils.dart';
import '../widgets/app_widget_extension.dart';

/// all the application level size type enum.
/// [SizeType] is used for detemining font, icon... vb sizes
/// Example: [ScreenUtils]
enum SizeType {
  Tiny,
  xxSmall,
  xSmall,
  Middle,
  Small,
  Large,
  xLarge,
  xxLarge,
  Ultra,
  Mega
}

/// [MessageType] defines the type of the message which is seen on screen.
/// Example: [AppWidgetExtension]
enum MessageType { SUCCESS, ERROR, INFO }
