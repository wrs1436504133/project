package com.bw.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bw.mapper.PlantMapperDao;

@Service
public class PlantServiceImpl  implements PlantService{
	@Resource
	private PlantMapperDao mapperDao;

	@Override
	public List<Map<String, Object>> findAllList(Map<String, Object> map) {
		return mapperDao.findAllList(map);
	}

	

}
