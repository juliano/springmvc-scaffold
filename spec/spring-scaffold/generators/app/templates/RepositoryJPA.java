package app.repositories;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

public abstract class Repository<T, I extends Serializable> {
	
	protected final EntityManager entityManager;
	protected final Class<T> clazz;

	protected Repository(EntityManager entityManager) {
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
	
	public T get(I id) {
		return entityManager.find(clazz, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<T> getAll() {
		Query query = entityManager.createQuery("from " + clazz.getName());
		return query.getResultList();
	}
}
