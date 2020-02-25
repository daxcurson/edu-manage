package ar.com.strellis.edumanage.model;

import java.util.Objects;

import javax.persistence.*;

@Entity
@Table(name="group_permission")
public class Permission 
{
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="group_id")
	private Group group;
	
	private String authority;

	/**
	 * @return the authority
	 */
	public String getAuthority() {
		return authority;
	}

	/**
	 * @param authority the authority to set
	 */
	public void setAuthority(String authority) {
		this.authority = authority;
	}

	/**
	 * @return the group
	 */
	public Group getGroup() {
		return group;
	}

	/**
	 * @param group the group to set
	 */
	public void setGroup(Group group) {
		this.group = group;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	public boolean equals(Object otro)
	{
		if(otro instanceof Permission)
		{
			Permission otroUser=(Permission)otro;
			if(otroUser.id==this.id && otroUser.getAuthority().equals(this.getAuthority())
					&& otroUser.getGroup().equals(this.getGroup()))
				return true;
		}
		return false;
	}
	public int hashCode()
	{
		return Objects.hash(id,getAuthority(),getGroup());
	}
}
