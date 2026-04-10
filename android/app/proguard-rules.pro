# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Mobile Scanner (MLKit / CameraX)
-keep class com.google.mlkit.** { *; }
-keep class com.google.android.gms.** { *; }

# SQLite / Drift
-keep class org.sqlite.** { *; }
-keep class sqlite3.** { *; }

# Share Plus
-keep class dev.fluttercommunity.plus.share.** { *; }

# URL Launcher
-keep class io.flutter.plugins.urllauncher.** { *; }

# Vibration
-keep class com.benjaminabel.vibration.** { *; }

# AudioPlayers
-keep class xyz.luan.audioplayers.** { *; }

# Barcode
-keep class net.sourceforge.zbar.** { *; }

# Play Core (deferred components)
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.**
-dontwarn com.google.android.play.core.tasks.**

# General
-dontwarn javax.annotation.**
-dontwarn kotlin.**
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
