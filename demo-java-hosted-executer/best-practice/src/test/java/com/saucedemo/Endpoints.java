package com.saucedemo;

import java.net.MalformedURLException;
import java.net.URL;

/**
 * URL to the desired Data Center.
 */
public class Endpoints {
    /**
     * Emulator/Simulator Hub.
     *
     * @return URL of Emulator/Simulator Hub
     */
    public static URL getEmuSimHub() throws MalformedURLException {        
        String endpoint = System.getenv("SAUCE_ENDPOINT");
        if(endpoint == null) {
            return new URL("https://ondemand.saucelabs.com:443/wd/hub");
        }
        return new URL(endpoint);
    }

    public static URL getScreenerHub() throws MalformedURLException {
        return new URL("https://hub.screener.io/wd/hub");
    }

    /**
     * Real Device Hub.
     *
     * @return URL for Real Device Hub
     */
    public static URL getRealDevicesHub() throws MalformedURLException {
        String endpoint = System.getenv("SAUCE_ENDPOINT");
        if(endpoint == null) {
            return new URL("https://ondemand.us-west-1.saucelabs.com/wd/hub");
        }
        return new URL(endpoint);
    }
}
