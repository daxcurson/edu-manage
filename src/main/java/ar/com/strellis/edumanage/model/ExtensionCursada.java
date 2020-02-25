package ar.com.strellis.edumanage.model;

import javax.persistence.*;

@Entity
@Table(name="extension_cursadas")
public class ExtensionCursada 
{
	@Id
	@GeneratedValue
	private Integer id;
}
