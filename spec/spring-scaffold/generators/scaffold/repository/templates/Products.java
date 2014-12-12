package app.repositories;

import javax.persistence.EntityManager;

import app.models.Product;

public class Products extends Repository<Product, Long> {

	public Products(EntityManager entityManager) {
		super(entityManager);
	}
}
