package ar.com.strellis.edumanage.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ar.com.strellis.edumanage.model.Group;

@Repository
public interface GroupDAO extends JpaRepository<Group,Long> 
{
	public Optional<Group> findById(Long id);
}
