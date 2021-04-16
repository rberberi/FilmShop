package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Bestelldetail;
import model.Kunde;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-07-02T13:24:13")
@StaticMetamodel(Bestellung.class)
public class Bestellung_ { 

    public static volatile SingularAttribute<Bestellung, Date> bRueckDat;
    public static volatile CollectionAttribute<Bestellung, Bestelldetail> bestelldetailCollection;
    public static volatile SingularAttribute<Bestellung, Date> bLieferDat;
    public static volatile SingularAttribute<Bestellung, Integer> bid;
    public static volatile SingularAttribute<Bestellung, Kunde> fkKid;

}