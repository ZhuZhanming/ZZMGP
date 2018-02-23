package com.zzming.graduation.util;

import com.google.gson.annotations.SerializedName;
import com.zzming.graduation.entity.Admin;
import com.zzming.graduation.entity.Product;

import java.util.List;

public class JsonForAdminList {
    public int state;
    @SerializedName("data")
    public List<Admin> adminList;
    public String message;
}
