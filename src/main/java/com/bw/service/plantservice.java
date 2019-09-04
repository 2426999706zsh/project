package com.bw.service;

import java.util.List;
import java.util.Map;

import com.bw.model.Plant;
import com.bw.model.Type;

public interface plantservice {
	List<Map<String , Object>> getall(Map<String , Object>map);
	
	List<Type> getTypeList();

	int addPlant(Plant plant);

	int deleteAll(String pids);

	Plant getPlantByPid(Plant plant);

	int updatePlant(Plant plant);
}
