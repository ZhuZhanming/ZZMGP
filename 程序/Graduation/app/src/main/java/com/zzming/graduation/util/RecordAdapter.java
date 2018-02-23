package com.zzming.graduation.util;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.zzming.graduation.R;
import com.zzming.graduation.entity.Record;

import java.util.List;

public class RecordAdapter extends RecyclerView.Adapter<RecordAdapter.ViewHolder> {
    private Context mContext;
    private List<Record> mRecordList;

    public RecordAdapter(List<Record> mRecordList) {
        this.mRecordList = mRecordList;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        if(mContext == null){
            mContext =parent.getContext();
        }
        View view = LayoutInflater.from(mContext).inflate(R.layout.item_record,parent,false);
        final RecordAdapter.ViewHolder holder = new RecordAdapter.ViewHolder(view);
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
        Record record = mRecordList.get(position);
        holder.kind.setText(Record.getKindStr(record.getKind()));
        holder.product.setText(record.getProduct_name());
        holder.admin.setText(record.getAdmin_name());
        holder.num.setText(record.getNum().toString());
    }

    @Override
    public int getItemCount() {
        return mRecordList.size();
    }

    static class ViewHolder extends RecyclerView.ViewHolder{
        View productView;
        TextView kind;
        TextView product;
        TextView admin;
        TextView num;

        public ViewHolder(View itemView) {
            super(itemView);
            productView = itemView;
            kind = (TextView)itemView.findViewById(R.id.kind);
            product = (TextView)itemView.findViewById(R.id.product);
            admin = (TextView) itemView.findViewById(R.id.admin);
            num = (TextView) itemView.findViewById(R.id.num);
        }
    }
}
