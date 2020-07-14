package com.catalyst06.fileexplorer

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethdChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call, result ->
                    when {
                        call.method == "getStorageFreeSpace" -> result.success(getStorageFreeSpace())
                        call.method == "getStorageTotalSpace" -> result.success(getStorageTotalSpace())
                        call.method == "getExternalStorageTotalSpace" -> result.success(getExternalStorageTotalSpace())
                        call.method == "getExternalStorageFreeSpace" -> result.success(getExternalStorageFreeSpace())
                    }
                }
    }
}
