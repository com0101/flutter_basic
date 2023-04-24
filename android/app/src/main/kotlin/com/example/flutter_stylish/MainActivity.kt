package com.example.flutter_stylish

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.util.Log
import com.example.test_tappay.PrimeDialog
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "mediumExplain/battery"
    private val CHANNEL_2 = "tap_pay"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()

                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_2)
            .setMethodCallHandler { call, result ->
                if (call.method == "checkoutProduct") {
                    Log.d("test", "i got u ^.<")

                    val dialog = PrimeDialog(context, object : PrimeDialog.PrimeDialogListener {
                        override fun onSuccess(prime: String) {
                            Log.d("test", "onSuccess, prime=$prime")
                            result.success(prime)
                        }

                        override fun onFailure(error: String) {
                            Log.d("test", "onFailure, error=$error")
                            result.success(error)
                        }

                    })

                    dialog.show()

                } else {
                    Log.d("test", "u know nothing ${call.method}")

                    result.error("404", "404", null)
                }
            }
    }

    private fun getBatteryLevel(): Int {
        val batteryLevel = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(
                Intent.ACTION_BATTERY_CHANGED))
            intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
        return batteryLevel
    }
}
