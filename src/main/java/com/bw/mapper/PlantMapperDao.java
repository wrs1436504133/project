package com.bw.mapper;

import java.util.List;
import java.util.Map;

public interface PlantMapperDao {
	List<Map<String,Object>> findAllList(Map<String,Object> map);
}
