package com.example.weather_app

import com.yandex.mapkit.MapKitFactory

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("911ead18-c5d2-41ab-a2c8-6e10b0d34309") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}