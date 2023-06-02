package com.example.fingerprint_auth_example

import io.flutter.embedding.android.FlutterFragmentActivity
ipmort io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.embedding.engine.FlutterEngine
import androidx.annotation.NonNull;

class MainActivity: FlutterFragmentActivity(){
    override fun configureFlutterEngine(@NonNull flutterEngine)
        GeneratedPluginRegistrant.registerWith(fluterEngine)
    }