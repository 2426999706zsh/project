package com.bw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.model.Plant;
import com.bw.model.Type;
import com.bw.service.plantservice;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class Plantcontroller {
	
	@Resource
	plantservice ser;
	
	@RequestMapping(value="list")
	public String getall(Model model,
			@RequestParam(defaultValue="")String pname,
			@RequestParam(defaultValue="1")int cpage,
			@RequestParam(defaultValue="0")int tid
			){
		
		Map<String , Object> map=new HashMap<String, Object>();
		map.put("pname", pname);
		map.put("tid", tid);
		PageHelper.startPage(cpage, 2);
		List<Map<String, Object>> list = ser.getall(map);
		PageInfo<Map<String , Object>> page=new PageInfo<>(list);
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		model.addAttribute("page", page);
		return "list";
		
	}
	@RequestMapping(value="getTypeList")
	@ResponseBody
	public Object getTypeList(){
		List<Type> typeList = ser.getTypeList();
		return typeList;
		
	}
	@RequestMapping(value="deleteall")
	@ResponseBody
	public Object deleteall(String pids){
		int deleteAll = ser.deleteAll(pids);
		return deleteAll;
	}
	@RequestMapping(value="toadd")
	public String toadd(){
		return "add";
	}
	@RequestMapping(value="add")
	@ResponseBody
	public int add(Plant plant){
		int addPlant = ser.addPlant(plant);
		return addPlant;
	}
	@RequestMapping(value="toupdate")
	public String toupdate(Plant plant,Model model){
		Plant p = ser.getPlantByPid(plant);
		model.addAttribute("p", p);
		return "update";
	}
	@RequestMapping(value="update")
	@ResponseBody
	public int update(Plant plant){
		int updatePlant = ser.updatePlant(plant);
		return updatePlant;
	}
}
