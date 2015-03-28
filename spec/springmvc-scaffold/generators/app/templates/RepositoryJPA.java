package app.repositories;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;

public abstract class GenericRepository<T> {
	
	protected final EntityManager entityManager;
	protected final Class<T> clazz;

	protected GenericRepository(EntityManager entityManager) {
		this.entityManager = entityManager;
		
		@SuppressWarnings("unchecked")
		Class<T> clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];

		this.clazz = clazz;
	}
	
	public void add(T entity) {
		entityManager.persist(entity);
	}
	
	public T update(T entity) {
		return entityManager.merge(entity);
	}
	
	public void remove(T entity) {
		entityManager.remove(entity);
	}
	
	public T get(Long id) {
		return entityManager.find(clazz, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<T> all() {
		return entityManager.createQuery("from " + clazz.getName()).getResultList();
	}
}
