package com.zzming.graduation.util;

import com.google.gson.annotations.SerializedName;
import com.zzming.graduation.entity.Product;
import com.zzming.graduation.entity.Record;

import java.util.List;

public class JsonForRecordList {
    public int state;
    @SerializedName("data")
    public List<Record> recordList;
    public String message;
}
