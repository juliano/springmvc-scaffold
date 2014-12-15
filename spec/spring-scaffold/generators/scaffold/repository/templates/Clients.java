package app.repositories;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import app.models.Client;

@Repository
public class Clients extends GenericRepository<Client, Long> {

	@Autowired
	public Clients(Session session) {
		super(session);
	}
}
