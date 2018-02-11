package com.mis.dao.bean;

import java.util.Date;

public class Book {
	private int incre_id;
	private String author;
	private String classify;
	private String id;
	private String name;
	private String news;
	private double price;
	private Date publishdata;



	public String getClassify() {
		return classify;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getNews() {
		return news;
	}

	public double getPrice() {
		return price;
	}

	public Date getPublishdata() {
		return new java.util.Date( publishdata.getTime());
	}


	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setNews(String news) {
		this.news = news;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setPublishdata(Date publishdata) {
		this.publishdata = publishdata;
	}
	public int getIncre_id() {
		return incre_id;
	}

	public void setIncre_id(int incre_id) {
		this.incre_id = incre_id;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "\n"+"��ˮ�ţ�"+incre_id+"\n\n"+"���:"+id+"\n\n"+"���ƣ�"+name+"\n\n"+"���ߣ�"+author+
		"\n\n"+"���"+classify+"\n\n"+"�۸�"+price+"\n\n"+"���ڣ�"+publishdata+
		"\n\n"+"���ܣ�"+news;
	}
	
}
