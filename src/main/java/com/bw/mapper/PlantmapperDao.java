package com.bw.mapper;

import java.util.List;
import java.util.Map;

import com.bw.model.Plant;
import com.bw.model.Type;

public interface PlantmapperDao {
	List<Map<String , Object>> getall(Map<String , Object>map);
	
	List<Type> getTypeList();

	int addPlant(Plant plant);

	int deleteAll(String pids);

	Plant getPlantByPid(Plant plant);

	int updatePlant(Plant plant);
}
