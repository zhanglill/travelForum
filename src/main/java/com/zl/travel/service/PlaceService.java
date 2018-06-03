package com.zl.travel.service;

import java.util.List;

import com.zl.travel.domain.Place;

public interface PlaceService {
	
    List<Place> getAllPlace();

    Place getByName(String name);    
 
 	boolean insertSelective(Place record);   

 	boolean updateByPrimaryKeySelective(Place record);

 	Place selectByPrimaryKey(Integer id);

 	boolean deleteByPrimaryKey(Integer id);
}
