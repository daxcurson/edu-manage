package edumanage.model;
import javax.persistence.*;

import org.hibernate.envers.Audited;

@Entity
@DiscriminatorValue("1")
@Audited
public class Matricula extends Cuota
{
	@Column(name="motivo")
	private String motivo;

	public String getMotivo() {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}
}
