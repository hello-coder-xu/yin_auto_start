package com.yin.autostart;

import android.content.Context;
import android.widget.Toast;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import com.judemanutd.autostarter.AutoStartPermissionHelper;

/**
 * AutostartPlugin
 */
public class AutostartPlugin implements FlutterPlugin, MethodCallHandler {

    private Context context;

    public AutostartPlugin() {

    }


    public AutostartPlugin(Context context) {
        this.context = context;
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        final MethodChannel channel =
                new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(),
                        "autostart");
        channel.setMethodCallHandler(new AutostartPlugin(flutterPluginBinding.getApplicationContext()));
    }


    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "autostart");
        channel.setMethodCallHandler(new AutostartPlugin(registrar.context()));
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        String methodValue = call.method;
        if (methodValue.equals("isAutoStartPermissionAvailable")) {
            result.success(AutoStartPermissionHelper.getInstance().isAutoStartPermissionAvailable(context));
        } else if (methodValue.equals("getAutoStartPermission")) {
            result.success(AutoStartPermissionHelper.getInstance().getAutoStartPermission(context));
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    }
}
