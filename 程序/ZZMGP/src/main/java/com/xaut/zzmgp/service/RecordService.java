package com.xaut.zzmgp.service;

import java.util.List;

import com.xaut.zzmgp.entity.Record;
import com.xaut.zzmgp.entity.WhereOfRecord;

public interface RecordService {
	
	Object[] loadApplys(WhereOfRecord where);
	
	Object[] loadRecords(WhereOfRecord where);

	List<Record> loadAllRecords();
	
	void insertApply(Record record);
}
