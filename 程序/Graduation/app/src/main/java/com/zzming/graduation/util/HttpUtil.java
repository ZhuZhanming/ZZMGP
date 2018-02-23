package com.zzming.graduation.util;

import java.util.concurrent.TimeUnit;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;

public class HttpUtil {
    /**
     * 放送okhttp请求的静态方法
     * @param address 访问的相对路径
     * @param requestBody 请求参数
     * @param callback 回调的实现接口
     */
    public static void sendOkHttpRequest(String address, RequestBody requestBody, okhttp3.Callback callback){
        OkHttpClient client = new OkHttpClient.Builder()
                .connectTimeout(2, TimeUnit.SECONDS)
                .readTimeout(5,TimeUnit.SECONDS)
                .build();
        Request request = new Request.Builder().url("http://192.168.43.136:8080/ZZMGP/android"+address).post(requestBody).build();
        client.newCall(request).enqueue(callback);
    }

}
