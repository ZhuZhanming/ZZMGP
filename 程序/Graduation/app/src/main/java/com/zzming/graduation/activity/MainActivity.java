package com.zzming.graduation.activity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBar;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.text.TextUtils;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.google.gson.Gson;
import com.zzming.graduation.R;
import com.zzming.graduation.entity.Admin;
import com.zzming.graduation.entity.Product;
import com.zzming.graduation.entity.Record;
import com.zzming.graduation.util.ActivityCollector;
import com.zzming.graduation.util.AdminAdapter;
import com.zzming.graduation.util.HttpUtil;
import com.zzming.graduation.util.JsonForAdminList;
import com.zzming.graduation.util.JsonForProduct;
import com.zzming.graduation.util.JsonForProductList;
import com.zzming.graduation.util.JsonForRecordList;
import com.zzming.graduation.util.MyApplication;
import com.zzming.graduation.util.ProductAdapter;
import com.zzming.graduation.util.RecordAdapter;

import java.io.IOException;
import java.util.List;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.RequestBody;
import okhttp3.Response;

public class MainActivity extends BaseActivity implements View.OnClickListener,View.OnFocusChangeListener,NavigationView.OnNavigationItemSelectedListener {
    private DrawerLayout mDrawerLayout;
    private RecyclerView recyclerView;
    private LinearLayout part;
    private int partKind;
    private ProgressBar progressBar;
    private EditText idEdit;
    private EditText numEdit;
    private EditText onameEdit;
    private Button affirm;
    private Gson gson;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar)findViewById(R.id.toolBar);
        mDrawerLayout = (DrawerLayout)findViewById(R.id.drawer_layout);
        recyclerView = (RecyclerView)findViewById(R.id.recycler_view);
        part = (LinearLayout)findViewById(R.id.part);
        progressBar = (ProgressBar) part.findViewById(R.id.progress_bar);
        idEdit = (EditText) part.findViewById(R.id.id);
        idEdit.setOnFocusChangeListener(this);
        numEdit = (EditText)part.findViewById(R.id.num);
        onameEdit = (EditText)part.findViewById(R.id.oname);
        affirm = (Button)part.findViewById(R.id.to_do);
        affirm.setOnClickListener(this);
        gson = new Gson();
        NavigationView navView = (NavigationView)findViewById(R.id.nav_view);
        navView.setNavigationItemSelectedListener(this);
        setSupportActionBar(toolbar);
        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null){
            actionBar.setDisplayHomeAsUpEnabled(true);
            actionBar.setHomeAsUpIndicator(R.mipmap.ic_menu);
        }
        TextView power = (TextView)navView.getHeaderView(0).findViewById(R.id.power);
        power.setText(Admin.getPowerStr(admin.getPower()));
        TextView name = (TextView)navView.getHeaderView(0).findViewById(R.id.name);
        name.setText(admin.getName());
    }
    private void loadRecords(){
        RequestBody requestBody = new FormBody.Builder().build();
        HttpUtil.sendOkHttpRequest("/record.do", requestBody, new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                showResponse(e.getMessage());
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {
                JsonForRecordList result = gson.fromJson(response.body().string(),JsonForRecordList.class);
                showRecords(result.recordList);
            }
        });
    }
    private void loadAdmins(){
        RequestBody requestBody = new FormBody.Builder().build();
        HttpUtil.sendOkHttpRequest("/admin.do", requestBody, new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                showResponse(e.getMessage());
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {
                JsonForAdminList result = gson.fromJson(response.body().string(),JsonForAdminList.class);
                showAdmins(result.adminList);
            }
        });
    }
    private void loadProducts(){
        RequestBody requestBody = new FormBody.Builder().build();
        HttpUtil.sendOkHttpRequest("/product.do",requestBody,new Callback(){
            @Override
            public void onResponse(Call call, Response response) throws IOException {
                JsonForProductList result = gson.fromJson(response.body().string(), JsonForProductList.class);
                showProducts(result.productList);
            }
            @Override
            public void onFailure(Call call, IOException e) {
                showResponse(e.getMessage());
            }
        });
    }

    private void showRecords(final List<Record> recordList){
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                GridLayoutManager layoutManager = new GridLayoutManager(MyApplication.getContext(),2);
                recyclerView.setLayoutManager(layoutManager);
                RecordAdapter adapter = new RecordAdapter(recordList);
                recyclerView.setAdapter(adapter);
            }
        });
    }
    private void showAdmins(final List<Admin> adminList){
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                GridLayoutManager layoutManager = new GridLayoutManager(MyApplication.getContext(),3);
                recyclerView.setLayoutManager(layoutManager);
                AdminAdapter adapter = new AdminAdapter(adminList);
                recyclerView.setAdapter(adapter);
            }
        });
    }
    private void showProducts(final List<Product> productList){
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                GridLayoutManager layoutManager = new GridLayoutManager(MyApplication.getContext(),2);
                recyclerView.setLayoutManager(layoutManager);
                ProductAdapter adapter = new ProductAdapter(productList);
                recyclerView.setAdapter(adapter);
            }
        });
    }

    public static void actionStart(Context context){
        Intent intent = new Intent(context,MainActivity.class);
        context.startActivity(intent);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case android.R.id.home:
                mDrawerLayout.openDrawer(GravityCompat.START);
                break;
        }
        return true;
    }

    @Override
    public void onFocusChange(View v, boolean hasFocus) {
        switch (v.getId()){
            case R.id.id:
                if(hasFocus)
                    return;
                idEdit.setError(null);
                if (TextUtils.isEmpty(idEdit.getText().toString())) {
                    idEdit.setError("请先输入货号");
                    return;
                }
                progressBar.setVisibility(View.VISIBLE);
                String id = idEdit.getText().toString();
                RequestBody requestBody = new FormBody.Builder().add("id",id).build();
                HttpUtil.sendOkHttpRequest("/checkProductId.do", requestBody, new Callback() {
                    @Override
                    public void onFailure(Call call,final IOException e) {
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                progressBar.setVisibility(View.INVISIBLE);
                                idEdit.setError(e.getMessage());
                                idEdit.setText("");
                            }
                        });
                    }

                    @Override
                    public void onResponse(Call call, Response response) throws IOException {
                        final JsonForProduct result = gson.fromJson(response.body().string(),JsonForProduct.class);
                        switch (result.state){
                            case 0:
                                final Product product = result.product;
                                runOnUiThread(new Runnable() {
                                    @Override
                                    public void run() {
                                        progressBar.setVisibility(View.INVISIBLE);
                                        TextView textView = (TextView) part.findViewById(R.id.product_name);
                                        textView.setText(product.getName());
                                        textView = (TextView) part.findViewById(R.id.now_num);
                                        textView.setText(String.valueOf(product.getNum()));
                                        textView = (TextView) part.findViewById(R.id.people);
                                        textView.setText(product.getPeople());
                                        textView = (TextView) part.findViewById(R.id.kind);
                                        textView.setText(Product.getKindStr(product.getKind()));
                                        textView = (TextView) part.findViewById(R.id.norm);
                                        textView.setText(product.getNorm());
                                    }
                                });
                                break;
                            case 2:
                                runOnUiThread(new Runnable() {
                                    @Override
                                    public void run() {
                                        idEdit.setError(result.message);
                                        idEdit.requestFocus();
                                    }
                                });
                                break;
                            default:
                        }
                    }
                });
                break;
            default:
        }
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.to_do:
                String id = idEdit.getText().toString();
                String num = numEdit.getText().toString();
                String oname = onameEdit.getText().toString();
                attemptApply(id,num,oname);
        }
    }
    private void attemptApply(String id,String num,String oname){
        idEdit.setError(null);
        numEdit.setError(null);
        onameEdit.setError(null);
        boolean cancel = false;
        View focusView = null;
        if(TextUtils.isEmpty(oname)){
            onameEdit.setError("备注不能为空");
            focusView = onameEdit;
            cancel = true;
        }
        if(TextUtils.isEmpty(num) || num.length()<4){
            numEdit.setError("数量不能小于1000");
            focusView = numEdit;
            cancel = true;
        }
        if(TextUtils.isEmpty(id) || id.length()<6){
            idEdit.setError("货号长度不小于6");
            focusView = idEdit;
            cancel = true;
        }
        if (admin == null){
            showResponse("请重新登录");
            focusView = idEdit;
            cancel = true;
        }
        if (cancel){
            focusView.requestFocus();
        }else {
            progressBar.setVisibility(View.VISIBLE);
            RequestBody requestBody = new FormBody.Builder()
                    .add("kind",String.valueOf(partKind))
                    .add("admin_id",admin.getId().toString())
                    .add("num",num)
                    .add("product_id",id)
                    .add("oname",oname).build();
            HttpUtil.sendOkHttpRequest("/insertApply.do", requestBody, new Callback() {
                @Override
                public void onFailure(Call call, IOException e) {
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            progressBar.setVisibility(View.INVISIBLE);
                        }
                    });
                    showResponse(e.getMessage());
                }

                @Override
                public void onResponse(Call call, Response response) throws IOException {
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            progressBar.setVisibility(View.INVISIBLE);
                        }
                    });
                    showResponse(response.body().string());
                }
            });
        }
    }


    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem item) {
        mDrawerLayout.closeDrawers();
        recyclerView.setVisibility(View.GONE);
        part.setVisibility(View.GONE);
        switch (item.getItemId()){
            case R.id.nav_index:
                break;
            case R.id.nav_admin:
                recyclerView.setVisibility(View.VISIBLE);
                loadAdmins();
                break;
            case R.id.nav_record:
                recyclerView.setVisibility(View.VISIBLE);
                loadRecords();
                break;
            case R.id.nav_product:
                recyclerView.setVisibility(View.VISIBLE);
                loadProducts();
                break;
            case R.id.nav_in:
                part.setVisibility(View.VISIBLE);
                affirm.setText("确认,申请入库");
                partKind = 2;
                break;
            case R.id.nav_out:
                part.setVisibility(View.VISIBLE);
                affirm.setText("确认,申请出库");
                partKind = 3;
                break;
            case R.id.nav_logout:
                SharedPreferences.Editor editor = getSharedPreferences("data",MODE_PRIVATE).edit();
                editor.putString("code","");
                editor.apply();
                ActivityCollector.finishAll();
                Intent intent = new Intent(MainActivity.this,LoginActivity.class);
                startActivity(intent);
                break;
        }
        return true;
    }
}