package com.niit.ShoppingCart.model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name="category")
@Component
public class Category {

	private String cat_id;
	 private String cat_name;
	 private String description;
	/* private Set<Product> products;*/
		
		
		/*@OneToMany(mappedBy="category",fetch = FetchType.EAGER)
		public Set<Product> getProducts() {
			return products;   
		}
		public void setProducts(Set<Product> products) {
			this.products = products;
		}*/
		
		@Id
		public String getCat_id() {
			return cat_id;
		}
		public void setCat_id(String cat_id) {
			this.cat_id = cat_id;
		}
		public String getCat_name() {
			return cat_name;
		}
		public void setCat_name(String cat_name) {
			this.cat_name = cat_name;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
	
}
