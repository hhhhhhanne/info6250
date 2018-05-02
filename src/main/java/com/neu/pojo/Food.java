package com.neu.pojo;


import java.util.HashSet;
import java.util.Set;


public class Food implements java.io.Serializable {

	// Fields

	private Integer id;
	private Types types;
	private String name;
	private String title;
	private String info;
	private Double price;
	private String imgSrc;
	private Integer discount;
	private Integer review;
	private Set orderdetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public Food() {
	}

	/** full constructor */
	public Food(Types types, String name, String title, String info,
			Double price, String imgSrc, Integer discount, Integer review,
			Set orderdetails) {
		this.types = types;
		this.name = name;
		this.title = title;
		this.info = info;
		this.price = price;
		this.imgSrc = imgSrc;
		this.discount = discount;
		this.review = review;
		this.orderdetails = orderdetails;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Types getTypes() {
		return this.types;
	}

	public void setTypes(Types types) {
		this.types = types;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImgSrc() {
		return this.imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}

	public Integer getDiscount() {
		return this.discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public Integer getReview() {
		return this.review;
	}

	public void setReview(Integer review) {
		this.review = review;
	}

	public Set getOrderdetails() {
		return this.orderdetails;
	}

	public void setOrderdetails(Set orderdetails) {
		this.orderdetails = orderdetails;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (!(o instanceof Food)) return false;

		Food food = (Food) o;

		if (id != null ? !id.equals(food.id) : food.id != null) return false;
		return true;
	}

	@Override
	public int hashCode() {
		return this.id.hashCode();
	}

	@Override
	public String toString() {
		return name;
	}
}