package com.example.trai_ui

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.provider.Telephony
import io.flutter.plugin.common.MethodChannel

class SmsReceiver(private val context: Context, private val channel: MethodChannel) {
    private var receiver: BroadcastReceiver? = null

    fun startListening() {
        if (receiver != null) return

        receiver = object : BroadcastReceiver() {
            override fun onReceive(context: Context?, intent: Intent?) {
                if (intent?.action != Telephony.Sms.Intents.SMS_RECEIVED_ACTION) return

                val messages = Telephony.Sms.Intents.getMessagesFromIntent(intent)
                messages?.forEach { smsMessage ->
                    val messageBody = smsMessage.messageBody
                    channel.invokeMethod("onSmsReceived", messageBody)
                }
            }
        }

        context.registerReceiver(
            receiver,
            IntentFilter(Telephony.Sms.Intents.SMS_RECEIVED_ACTION)
        )
    }

    fun stopListening() {
        receiver?.let {
            context.unregisterReceiver(it)
            receiver = null
        }
    }
}
