package edumanage.security;

import edumanage.model.*;
import java.util.*;

public interface GroupRepository 
{
	List<Group> listAllGroups();
	Group findGroupById(long id);
	void save(Group g);
}
