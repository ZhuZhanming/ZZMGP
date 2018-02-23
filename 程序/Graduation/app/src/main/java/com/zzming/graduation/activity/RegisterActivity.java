package com.zzming.graduation.activity;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.zzming.graduation.R;
import com.zzming.graduation.util.HttpUtil;
import com.zzming.graduation.util.MyApplication;

import java.io.IOException;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.RequestBody;
import okhttp3.Response;

public class RegisterActivity extends AppCompatActivity implements View.OnClickListener {
    private EditText nameText;
    private EditText codeText;
    private EditText passwordText;
    private EditText rePasswordText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        nameText = (EditText)findViewById(R.id.name);
        codeText = (EditText)findViewById(R.id.code);
        passwordText = (EditText)findViewById(R.id.password);
        rePasswordText = (EditText)findViewById(R.id.re_password);
        Button register = (Button)findViewById(R.id.register);
        Button back = (Button)findViewById(R.id.back);
        register.setOnClickListener(this);
        back.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.register:
                String name = nameText.getText().toString();
                String code = codeText.getText().toString();
                String password = passwordText.getText().toString();
                String rePassword = rePasswordText.getText().toString();
                RequestBody requestBody = new FormBody.Builder().add("name",name).add("code",code).add("password",password).build();
                HttpUtil.sendOkHttpRequest("/regist.do", requestBody, new Callback() {
                    @Override
                    public void onFailure(Call call, IOException e) {
                        show(e.getMessage());
                    }

                    @Override
                    public void onResponse(Call call, Response response) throws IOException {
                        show(response.body().string());
                        back();
                    }
                });
                break;
            case R.id.back:
                back();
                break;
        }
    }
    private void show(final String info){
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                Toast.makeText(MyApplication.getContext(),info,Toast.LENGTH_LONG).show();
            }
        });
    }
    private void back(){
        Intent intent = new Intent(RegisterActivity.this,LoginActivity.class);
        startActivity(intent);
        finish();
    }
}
