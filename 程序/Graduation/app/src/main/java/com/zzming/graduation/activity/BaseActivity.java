package com.zzming.graduation.activity;

import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.widget.Toast;

import com.zzming.graduation.R;
import com.zzming.graduation.entity.Admin;
import com.zzming.graduation.util.ActivityCollector;
import com.zzming.graduation.util.MyApplication;


public class BaseActivity extends AppCompatActivity {
    public static Admin admin;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ActivityCollector.addActivity(this);
    }

    @Override
    protected void onStart() {
        super.onStart();
        if(admin == null ){
            AlertDialog.Builder builder = new AlertDialog.Builder(BaseActivity.this);
            builder.setTitle("Warning");
            builder.setMessage("请重新登录");
            builder.setCancelable(false);
            builder.setPositiveButton("Ok",new DialogInterface.OnClickListener(){
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    ActivityCollector.finishAll();
                    Intent intent = new Intent(MyApplication.getContext(),LoginActivity.class);
                    BaseActivity.this.startActivity(intent);
                }
            }).show();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        ActivityCollector.removeActivity(this);
    }
    protected void showResponse(final String response){
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                Toast.makeText(MyApplication.getContext(),response,Toast.LENGTH_SHORT).show();
            }
        });
    }
}
