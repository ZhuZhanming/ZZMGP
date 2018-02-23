package com.xaut.zzmgp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xaut.zzmgp.dao.AllocationDao;
import com.xaut.zzmgp.entity.Allocation;
import com.xaut.zzmgp.entity.WhereOfAllocation;
import com.xaut.zzmgp.service.AllocationService;

@Service("allocationService")
public class AllocationServiceImpl implements AllocationService {
	@Resource(name = "allocationDao")
	private AllocationDao allocationDao;

	public Object[] loadAllocations(WhereOfAllocation where) {
		if (where.getPage() == null) {
			where.setPage(1);
		}
		Object[] objs = new Object[6];
		objs[0] = allocationDao.findAllocations(where);
		objs[1] = allocationDao.findRows(where);
		int allNum = 0;
		int allRemainder = 0;
		List<Allocation> allocations = allocationDao.findAllocationsOfNotPage(where);
		for (Allocation a : allocations) {
			allNum += a.getNum();
			allRemainder += a.getRemainder();
		}
		objs[2] = allNum;
		objs[3] = allRemainder;
		objs[4] = allocationDao.findAllArea();
		if (where.getArea_id() != null) {
			objs[5] = allocationDao.findFrameByAreaId(where.getArea_id());
		}
		return objs;
	}

}
