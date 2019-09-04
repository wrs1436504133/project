package com.bw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bw.service.PlantService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class PlaantControlleer {
	@Resource
	private PlantService plantService;
	
	@RequestMapping("list.do")
	public String list(Model model,
			@RequestParam(defaultValue="1") int cpage,
			@RequestParam(defaultValue="") String pname){
		PageHelper.startPage(cpage, 2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pname", pname);
		List<Map<String,Object>> findAllList = plantService.findAllList(map );
		PageInfo<Map<String,Object>> pageInfo = new PageInfo<Map<String,Object>>(findAllList);
		model.addAttribute("list", findAllList);
		model.addAttribute("page", pageInfo);
		model.addAttribute("map", map);
		model.addAttribute("map", map);
		return "list";
	}
	
	@RequestMapping("toAdd.do")
	public String toAdd(){
		return "add";
	}
}
