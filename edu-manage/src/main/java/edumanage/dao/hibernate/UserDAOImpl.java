package edumanage.dao.hibernate;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edumanage.dao.UserDAO;
import edumanage.model.User;

@Repository
public class UserDAOImpl implements UserDAO
{
	static Logger log = Logger.getLogger(UserDAOImpl.class);
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User findByLogin(String login) 
	{
		log.trace("Estoy en UserDAOImpl.findByLogin, login pedido:"+login);
		return (User) sessionFactory.getCurrentSession().createQuery("from User where username='"+login+"'").getSingleResult();
	}

	@Override
	public void save(User user) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}

	@Override
	public User findById(Long userId) 
	{
		log.trace("Estoy en UserDAO.findById");
		return (User) sessionFactory.getCurrentSession().createQuery("from User where User.id"+userId).getSingleResult();
	}

	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findByLoginOpenId(String loginOpenId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findByFacebookId(Long facebookId) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUsers()
	{
		return sessionFactory.getCurrentSession().createQuery("from User").getResultList();
	}

}
