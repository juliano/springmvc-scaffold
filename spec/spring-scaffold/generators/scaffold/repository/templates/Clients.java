package app.repositories;

import org.hibernate.Session;

import app.models.Client;

public class Clients extends Repository<Client, Long> {

	public Clients(Session session) {
		super(session);
	}
}
