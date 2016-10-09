package edumanage.model;

import javax.persistence.*;

import org.hibernate.envers.Audited;

@Entity
@DiscriminatorValue("0")
@Audited
public class CuotaCurso extends Cuota
{
}
