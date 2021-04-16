package model;

import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Bestelldetail;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-07-02T13:24:13")
@StaticMetamodel(Filme.class)
public class Filme_ { 

    public static volatile SingularAttribute<Filme, Integer> fid;
    public static volatile SingularAttribute<Filme, String> fName;
    public static volatile SingularAttribute<Filme, Integer> fJahr;
    public static volatile SingularAttribute<Filme, BigDecimal> fPreisNetto;
    public static volatile CollectionAttribute<Filme, Bestelldetail> bestelldetailCollection;

}