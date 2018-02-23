package com.zzming.graduation.util;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.zzming.graduation.R;
import com.zzming.graduation.entity.Product;

import java.util.List;

public class ProductAdapter extends RecyclerView.Adapter<ProductAdapter.ViewHolder> {
    private Context mContext;
    private List<Product> mProductList;

    public ProductAdapter(List<Product> mProductList) {
        this.mProductList = mProductList;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        if(mContext == null){
            mContext =parent.getContext();
        }
        View view = LayoutInflater.from(mContext).inflate(R.layout.item_product,parent,false);
        final ViewHolder holder = new ViewHolder(view);
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
        Product product = mProductList.get(position);
        holder.name.setText(product.getName());
        holder.kind.setText(Product.getKindStr(product.getKind()));
        holder.people.setText(product.getPeople());
        holder.num.setText(product.getAllNum().toString());
    }

    @Override
    public int getItemCount() {
        return mProductList.size();
    }

    static class ViewHolder extends RecyclerView.ViewHolder{
        View productView;
        TextView name;
        TextView kind;
        TextView people;
        TextView num;

        public ViewHolder(View itemView) {
            super(itemView);
            productView = itemView;
            name = (TextView)itemView.findViewById(R.id.name);
            kind = (TextView)itemView.findViewById(R.id.kind);
            people = (TextView) itemView.findViewById(R.id.people);
            num = (TextView) itemView.findViewById(R.id.num);
        }
    }
}
