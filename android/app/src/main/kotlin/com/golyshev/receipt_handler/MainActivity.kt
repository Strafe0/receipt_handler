package com.golyshev.receipt_handler

import android.content.Intent
import android.os.Bundle
import android.net.Uri
import java.io.File
import java.io.BufferedReader

import androidx.annotation.NonNull

import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    var sharedText: String? = null
    private val CHANNEL: String = "app.channel.shared.data"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val intent: Intent = getIntent()
        val action: String? = intent.getAction()
        val type: String? = intent.getType()

        if (intent.action == Intent.ACTION_SEND) {
            println("INTENT TYPE: ${intent.type}")
            if ("text/plain" == intent.type || "application/json" == intent.type) {
                handleSendText(intent, Intent.EXTRA_TEXT)
            }
            if ("text/html" == intent.type) {
                handleSendText(intent, Intent.EXTRA_HTML_TEXT)
            }
        }

        // if (Intent.ACTION_SEND.equals(action) && type != null) {
        //     if ("text/json".equals(type)) {
        //         handleSendText(intent) // Handle text being sent
        //     }
        // }
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        // GeneratedPluginRegistrant.registerWith(flutterEngine)
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler {
                    call, result ->
                        if (call.method == "getSharedText") {
                            result.success(sharedText)
                            sharedText = null
                        }
                }
    }

    fun handleSendText(intent: Intent, dataType: String) {
        // sharedText = intent.getStringExtra(dataType)
        // sharedText = intent.getExtras().toString()
        // sharedText = intent.getBundleExtra(Intent.EXTRA_STREAM).toString()
        
        // var extras = intent.getExtras().toString()
        // println("extras: ${extras}")
        var extra: String? = intent.getExtras()?.get(Intent.EXTRA_STREAM).toString()
        var contentUri: Uri = Uri.parse(extra)
        var file: File = File(contentUri.getPath())
        sharedText = file.getPath()

        val inputStream = contentResolver.openInputStream(contentUri)

        val reader = BufferedReader(inputStream?.reader())
        var content: String
        try {
            content = reader.readText()
        } finally {
            reader.close()
        }
        sharedText = content
    }
}
