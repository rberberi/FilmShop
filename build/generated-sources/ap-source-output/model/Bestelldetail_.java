package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Bestellung;
import model.Filme;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-07-02T13:24:13")
@StaticMetamodel(Bestelldetail.class)
public class Bestelldetail_ { 

    public static volatile SingularAttribute<Bestelldetail, Integer> bdid;
    public static volatile SingularAttribute<Bestelldetail, Filme> fkFid;
    public static volatile SingularAttribute<Bestelldetail, Bestellung> fkBid;

}