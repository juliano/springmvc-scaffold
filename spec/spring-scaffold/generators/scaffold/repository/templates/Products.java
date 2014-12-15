package app.repositories;

import javax.persistence.EntityManager;
import org.springframework.stereotype.Repository;

import app.models.Product;

@Repository
public class Products extends GenericRepository<Product, Long> {

	public Products(EntityManager entityManager) {
		super(entityManager);
	}
}
