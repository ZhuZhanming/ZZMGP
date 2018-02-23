package com.xaut.zzmgp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xaut.zzmgp.entity.Allocation;
import com.xaut.zzmgp.entity.Area;
import com.xaut.zzmgp.entity.Frame;
import com.xaut.zzmgp.entity.WhereOfAllocation;

@Repository("allocationDao")
public interface AllocationDao {
	Allocation findOneAllocation(WhereOfAllocation where);

	void update(Allocation allocation);

	List<Allocation> findAllocations(WhereOfAllocation where);

	int findRows(WhereOfAllocation where);
	/**
	 * 根据area_id或frame_id找所有的allocation---不分页
	 */
	List<Allocation> findAllocationsOfNotPage(WhereOfAllocation where);

	List<Area> findAllArea();
	
	List<Frame> findFrameByAreaId(int area_id);
}
