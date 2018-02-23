package com.xaut.zzmgp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xaut.zzmgp.entity.Apply;
import com.xaut.zzmgp.entity.Record;
import com.xaut.zzmgp.entity.WhereOfRecord;

@Repository("recordDao")
public interface RecordDao {
	
	int findNumForIn();
	
	int findNumForOut();
	
	Apply findApplyById(Integer id);
	
	void updateApplyOfAgree(Integer id);
	
	void updateApplyOfRefuse(Integer id);
	
	List<Apply> findApplys(WhereOfRecord where);
	
	int findApplysRows(WhereOfRecord where);

	void insertApply(Record record);

	void insertRecord(Record record);

	List<Record> findAllRecords();

	List<Record> findRecords(WhereOfRecord where);

	int findRows(WhereOfRecord where);

	Record findById(Integer id);

}
