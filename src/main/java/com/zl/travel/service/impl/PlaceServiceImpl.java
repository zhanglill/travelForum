package com.zl.travel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.travel.dao.PlaceMapper;
import com.zl.travel.domain.Place;
import com.zl.travel.service.PlaceService;

@Service
public class PlaceServiceImpl implements PlaceService {

    @Autowired
    public PlaceMapper placeDao;

    public List<Place> getAllPlace() {
        return placeDao.getAllPlace();
    }

    public Place getByName(String name) {
        return placeDao.getByName(name);
    }

    public boolean insertSelective(Place place) {
    	return placeDao.insertSelective(place) > 0;
    }

    public boolean updateByPrimaryKeySelective(Place place) {
    	return placeDao.updateByPrimaryKeySelective(place) >0;
    }

    public Place selectByPrimaryKey(Integer id) {
    	return placeDao.selectByPrimaryKey(id);
    }

    public boolean deleteByPrimaryKey(Integer id) {
    	return placeDao.deleteByPrimaryKey(id)>0;
    }
}
