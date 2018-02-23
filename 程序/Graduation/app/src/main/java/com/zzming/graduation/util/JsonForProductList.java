package com.zzming.graduation.util;

import com.google.gson.annotations.SerializedName;
import com.zzming.graduation.entity.Product;

import java.util.List;

public class JsonForProductList {
    public int state;
    @SerializedName("data")
    public List<Product> productList;
    public String message;
}
