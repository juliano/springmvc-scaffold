package app.repositories;

import javax.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import app.models.Product;

@Repository
public class Products extends GenericRepository<Product, Long> {

	@Autowired
	public Products(EntityManager entityManager) {
		super(entityManager);
	}
}
