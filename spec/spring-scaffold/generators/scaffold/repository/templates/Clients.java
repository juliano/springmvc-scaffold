package app.repositories;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import app.models.Client;

@Repository
public class Clients extends GenericRepository<Client, Long> {

	public Clients(Session session) {
		super(session);
	}
}
