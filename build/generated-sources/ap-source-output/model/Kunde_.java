package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Accounts;
import model.Bestellung;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-07-02T13:24:13")
@StaticMetamodel(Kunde.class)
public class Kunde_ { 

    public static volatile SingularAttribute<Kunde, String> kVName;
    public static volatile SingularAttribute<Kunde, String> kTel;
    public static volatile SingularAttribute<Kunde, Accounts> fkAccid;
    public static volatile SingularAttribute<Kunde, String> kEmail;
    public static volatile CollectionAttribute<Kunde, Bestellung> bestellungCollection;
    public static volatile SingularAttribute<Kunde, Integer> kid;
    public static volatile SingularAttribute<Kunde, String> kName;

}