package uz.mcodevs.weather_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//        MapKitFactory.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("911ead18-c5d2-41ab-a2c8-6e10b0d34309") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}