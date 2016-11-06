package edumanage.dao;

import java.util.List;
import edumanage.model.*;

public interface GroupDAO 
{
	List<Group> listAllGroups();
	Group findGroupById(long id);
	void save(Group g);
}
