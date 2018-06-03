package com.zl.travel.dao;


import java.util.List;

import com.zl.travel.domain.Place;
import com.zl.travel.domain.Tab;

public interface PlaceMapper{
    int deleteByPrimaryKey(Integer id);

    int insert(Place record);

    int insertSelective(Place record);

    Place selectByPrimaryKey(Integer id);

    Place getByName(String name);

    int updateByPrimaryKeySelective(Place record);

    int updateByPrimaryKey(Place record);

    List<Place> getAllPlace();
}