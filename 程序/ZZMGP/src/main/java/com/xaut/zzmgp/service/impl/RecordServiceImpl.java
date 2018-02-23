package com.xaut.zzmgp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xaut.zzmgp.dao.RecordDao;
import com.xaut.zzmgp.entity.Record;
import com.xaut.zzmgp.entity.WhereOfRecord;
import com.xaut.zzmgp.service.RecordService;

@Service("recordService")
public class RecordServiceImpl implements RecordService {
	@Resource(name = "recordDao")
	private RecordDao recordDao;
	
	public Object[] loadApplys(WhereOfRecord where){
		if (where.getPage() == null) {
			where.setPage(1);
		}
		Object[] objs = new Object[2];
		objs[0] = recordDao.findApplys(where);
		objs[1] = recordDao.findApplysRows(where);
		return objs;
	}

	public Object[] loadRecords(WhereOfRecord where) {
		if (where.getPage() == null) {
			where.setPage(1);
		}
		Object[] objs = new Object[2];
		objs[0] = recordDao.findRecords(where);
		objs[1] = recordDao.findRows(where);
		return objs;
	}

	public List<Record> loadAllRecords() {
		return recordDao.findAllRecords();
	}
	@Transactional
	public void insertApply(Record record) {
		recordDao.insertApply(record);
		recordDao.insertRecord(record);
	}
}
