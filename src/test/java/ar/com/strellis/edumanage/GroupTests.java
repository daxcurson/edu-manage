package ar.com.strellis.edumanage;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Set;

import org.hibernate.Hibernate;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;

import ar.com.strellis.edumanage.dao.GroupDAO;
import ar.com.strellis.edumanage.exceptions.GrupoInexistenteException;
import ar.com.strellis.edumanage.model.Group;
import ar.com.strellis.edumanage.model.Permission;

@SpringBootTest(classes=EdumanageApplication.class)
@AutoConfigureMockMvc
class GroupTests {

	@Autowired
	private GroupDAO groupDAO;
	@Test
	void test() 
	{
		long id=2;
		try {
			Group g=groupDAO.findById(id).orElseThrow(GrupoInexistenteException::new);
			System.out.println("Encontrado el grupo "+g.getGroupName());
			Hibernate.initialize(g.getPermissions());
			Set<Permission> permisos=g.getPermissions();
			if(!permisos.isEmpty())
				for(Permission p:permisos)
				{
					System.out.println("Permiso: "+p.getAuthority());
				}
			else
				System.out.println("Este grupo no tiene permisos");
		} catch (GrupoInexistenteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
