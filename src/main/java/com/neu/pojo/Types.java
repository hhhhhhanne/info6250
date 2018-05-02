package com.neu.pojo;

import java.util.HashSet;
import java.util.Set;



public class Types implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Set foods = new HashSet(0);

	// Constructors

	/** default constructor */
	public Types() {
	}

	/** full constructor */
	public Types(String name, Set foods) {
		this.name = name;
		this.foods = foods;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set getFoods() {
		return this.foods;
	}

	public void setFoods(Set foods) {
		this.foods = foods;
	}

}