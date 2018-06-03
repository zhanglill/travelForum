package com.zl.travel.domain;

import java.io.Serializable;
import java.util.List;

/**
 * 主题板块实体类
 */
public class Place implements Serializable {
    private Integer id;

    private String name;

    private String delFlag;
    
    private int count;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
    
    
}