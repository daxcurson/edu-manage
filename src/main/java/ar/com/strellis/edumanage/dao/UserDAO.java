package ar.com.strellis.edumanage.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ar.com.strellis.edumanage.model.User;

@Repository
public interface UserDAO extends JpaRepository<User,Long>
{
	@Query("select u from User u where username=:username")
	User findByLogin(String username);
}
