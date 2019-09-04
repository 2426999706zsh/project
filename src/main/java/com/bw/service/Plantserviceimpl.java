package com.bw.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bw.mapper.PlantmapperDao;
import com.bw.model.Plant;
import com.bw.model.Type;

@Service
public class Plantserviceimpl implements plantservice{
	@Resource
	PlantmapperDao dao;
	@Override
	public List<Map<String, Object>> getall(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getall(map);
	}
	@Override
	public List<Type> getTypeList() {
		// TODO Auto-generated method stub
		return dao.getTypeList();
	}
	@Override
	public int addPlant(Plant plant) {
		// TODO Auto-generated method stub
		return dao.addPlant(plant);
	}
	@Override
	public int deleteAll(String pids) {
		// TODO Auto-generated method stub
		return dao.deleteAll(pids);
	}
	@Override
	public Plant getPlantByPid(Plant plant) {
		// TODO Auto-generated method stub
		return dao.getPlantByPid(plant);
	}
	@Override
	public int updatePlant(Plant plant) {
		// TODO Auto-generated method stub
		return dao.updatePlant(plant);
	}

}
