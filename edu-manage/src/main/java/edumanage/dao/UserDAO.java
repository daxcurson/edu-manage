package edumanage.dao;

import edumanage.model.User;

public interface UserDAO 
{
	public User findByLogin(String login);
	public User save(User user);
	public User findById(Long userId);
	public User findByEmail(String email);
	public User findByLoginOpenId(String loginOpenId);
	public User findByFacebookId(Long facebookId);
}