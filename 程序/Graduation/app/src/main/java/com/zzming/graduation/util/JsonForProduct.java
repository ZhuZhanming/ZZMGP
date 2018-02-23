package com.zzming.graduation.util;

import com.google.gson.annotations.SerializedName;
import com.zzming.graduation.entity.Product;

public class JsonForProduct {
    public int state;
    @SerializedName("data")
    public Product product;
    public String message;
}
