package com.zzming.graduation.activity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.gson.Gson;
import com.zzming.graduation.entity.Admin;
import com.zzming.graduation.util.HttpUtil;
import com.zzming.graduation.R;
import com.zzming.graduation.util.JsonForAdmin;
import com.zzming.graduation.util.MyApplication;

import java.io.IOException;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.RequestBody;
import okhttp3.Response;

public class LoginActivity extends AppCompatActivity {
    private EditText mCodeView;
    private EditText mPasswordView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        mCodeView = (EditText)findViewById(R.id.code);
        mPasswordView = (EditText)findViewById(R.id.password);
        Button login = (Button) findViewById(R.id.to_login);
        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String code = mCodeView.getText().toString();
                String password = mPasswordView.getText().toString();
                attemptLogin(code,password);
            }
        });
        Button register = (Button)findViewById(R.id.to_register);
        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(LoginActivity.this,RegisterActivity.class);
                startActivity(intent);
            }
        });
        SharedPreferences pref = getSharedPreferences("data",MODE_PRIVATE);
        String code = pref.getString("code","");
        String password = pref.getString("password","");
        if(!"".equals(code) && !"".equals(password)){
            attemptLogin(code,password);
        }
    }

    private void attemptLogin(String code,String password){
        mCodeView.setError(null);
        mPasswordView.setError(null);
        boolean cancel = false;
        View focusView = null;
        if(TextUtils.isEmpty(password) || code.length() < 4){
            mPasswordView.setError("密码格式不正确");
            focusView = mPasswordView;
            cancel = true;
        }
        if(TextUtils.isEmpty(code) || code.length()<4){
            mCodeView.setError("账号格式不正确");
            focusView = mCodeView;
            cancel = true;
        }
        if(cancel){
            focusView.requestFocus();
        }else{
            RequestBody requestBody = new FormBody.Builder().add("code",code).add("password",password).build();
            HttpUtil.sendOkHttpRequest("/login.do", requestBody, new Callback() {
                @Override
                public void onFailure(Call call, IOException e) {
                    show(e.getMessage());
                }

                @Override
                public void onResponse(Call call, Response response) throws IOException {
                    Gson gson = new Gson();
                    JsonForAdmin result = gson.fromJson(response.body().string(),JsonForAdmin.class);
                    switch (result.state){
                        case 0:
                            Admin admin = result.admin;
                            SharedPreferences.Editor editor = getSharedPreferences("data",MODE_PRIVATE).edit();
                            editor.putInt("id",admin.getId())
                                    .putString("name",admin.getName())
                                    .putString("code",admin.getCode())
                                    .putString("password",admin.getPassword())
                                    .putInt("power",admin.getPower());
                            editor.apply();
                            BaseActivity.admin = admin;
                            MainActivity.actionStart(LoginActivity.this);
                            break;
                        case 2:
                            showCodeExc(result.message);
                            break;
                        case 3:
                            showPwdExc(result.message);
                            break;
                        default:
                            show(result.message);
                    }
                }
            });
        }
    }

    @Override
    protected void onStop() {
        super.onStop();
        finish();
    }

    private void showPwdExc(final String str){
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                mPasswordView.setError(str);
                mPasswordView.requestFocus();
            }
        });
    }
    private void showCodeExc(final String str){
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                mCodeView.setError(str);
                mCodeView.requestFocus();
            }
        });
    }
    private void show(final String info){
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                Toast.makeText(MyApplication.getContext(),info,Toast.LENGTH_SHORT).show();
            }
        });
    }
}
