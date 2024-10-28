package com.nitnelav.capacitor.apn;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "CapacitorApnToken")
public class CapacitorApnTokenPlugin extends Plugin {

    private CapacitorApnToken implementation = new CapacitorApnToken();

    @PluginMethod
    public void getApnsToken(PluginCall call) {
  

        JSObject ret = new JSObject();
        ret.put("token", implementation.echo("Method not implemented on android."));
        call.resolve(ret);
    }
}
