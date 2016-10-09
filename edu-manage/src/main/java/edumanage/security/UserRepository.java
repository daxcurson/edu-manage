package edumanage.security;

import edumanage.model.*;

public interface UserRepository {
    User findByLogin(String login);
    User save(User user);
    User findById(Long userId);
    User findByEmail(String email);   
    User findByLoginOpenId(String loginOpenId);
    User findByFacebookId(Long facebookId);
}