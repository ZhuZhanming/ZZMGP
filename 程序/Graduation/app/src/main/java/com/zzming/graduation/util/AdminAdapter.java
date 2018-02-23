package com.zzming.graduation.util;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.zzming.graduation.R;
import com.zzming.graduation.entity.Admin;
import com.zzming.graduation.entity.Product;

import java.util.List;

/**
 * Created by zzming on 2017/5/10.
 */

public class AdminAdapter extends RecyclerView.Adapter<AdminAdapter.ViewHolder> {
    private Context mContext;
    private List<Admin> mAdminList;

    public AdminAdapter(List<Admin> mAdminList) {
        this.mAdminList = mAdminList;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        if(mContext == null){
            mContext =parent.getContext();
        }
        View view = LayoutInflater.from(mContext).inflate(R.layout.item_admin,parent,false);
        final AdminAdapter.ViewHolder holder = new AdminAdapter.ViewHolder(view);
        holder.productView.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
//                Goods goods = mGoodsList.get(holder.getAdapterPosition());
//                DetailActivity.actionStart(v.getContext(),goods);
            }
        });
        return holder;
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        Admin admin = mAdminList.get(position);
        holder.name.setText(admin.getName());
        holder.power.setText(Admin.getPowerStr(admin.getPower()));
    }

    @Override
    public int getItemCount() {
        return mAdminList.size();
    }

    static class ViewHolder extends RecyclerView.ViewHolder{
        View productView;
        TextView name;
        TextView power;

        public ViewHolder(View itemView) {
            super(itemView);
            productView = itemView;
            name = (TextView)itemView.findViewById(R.id.name);
            power = (TextView)itemView.findViewById(R.id.power);
        }
    }
}
