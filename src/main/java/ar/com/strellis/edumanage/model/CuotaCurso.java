package ar.com.strellis.edumanage.model;

import javax.persistence.*;

import org.hibernate.envers.Audited;

@DiscriminatorValue("0")
@Audited
public class CuotaCurso extends Cuota
{
}
