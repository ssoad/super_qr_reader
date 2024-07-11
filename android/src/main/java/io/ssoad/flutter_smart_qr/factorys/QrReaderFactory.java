package io.ssoad.flutter_smart_qr.factorys;

import android.content.Context;

import java.util.Map;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import io.ssoad.flutter_smart_qr.views.QrReaderView;

public class QrReaderFactory extends PlatformViewFactory {

    private PluginRegistry.Registrar registrar;

    public QrReaderFactory(PluginRegistry.Registrar registrar) {
        super(StandardMessageCodec.INSTANCE);
        this.registrar = registrar;
    }

    @Override
    public PlatformView create(Context context, int id, Object args) {
        Map<String, Object> params = (Map<String, Object>) args;
        return new QrReaderView(context, registrar, id, params);
    }
}
