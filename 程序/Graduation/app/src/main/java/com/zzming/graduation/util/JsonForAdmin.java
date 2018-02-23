package com.zzming.graduation.util;

import com.google.gson.annotations.SerializedName;
import com.zzming.graduation.entity.Admin;

public class JsonForAdmin{
    public int state;
    @SerializedName("data")
    public Admin admin;
    public String message;
}
