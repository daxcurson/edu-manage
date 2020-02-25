package ar.com.strellis.edumanage.model;

import java.util.Objects;

import javax.persistence.*;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

@Entity
@Table(name="users")
@Audited(targetAuditMode=RelationTargetAuditMode.NOT_AUDITED)
public class User
{
	/**
	 * 
	 */
	@SuppressWarnings("unused")
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@GeneratedValue
	private int id;
	private String username;
	private String password;
	@Transient
	private String confirm_password;
	private int enabled;

	@OneToOne
	private Group group;
	
	public int getId()
	{
		return id;
	}
	public void setId(int i)
	{
		id=i;
	}
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String u)
	{
		username=u;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String p)
	{
		password=p;
	}
	public Group getGroup()
	{
		return this.group;
	}
	public void setGroup(Group s)
	{
		this.group=s;
	}
	/**
	 * @return the enabled
	 */
	public int getEnabled() {
		return enabled;
	}
	/**
	 * @param enabled the enabled to set
	 */
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getConfirm_password() {
		return confirm_password;
	}
	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}
	public boolean equals(Object otro)
	{
		if(otro instanceof User)
		{
			User otroUser=(User)otro;
			if(otroUser.id==this.id && otroUser.username.equals(this.username))
				return true;
		}
		return false;
	}
	public int hashCode()
	{
		return Objects.hash(id,username);
	}
}
