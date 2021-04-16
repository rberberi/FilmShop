package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Kunde;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-07-02T13:24:13")
@StaticMetamodel(Accounts.class)
public class Accounts_ { 

    public static volatile CollectionAttribute<Accounts, Kunde> kundeCollection;
    public static volatile SingularAttribute<Accounts, Integer> accid;
    public static volatile SingularAttribute<Accounts, String> accpwd;
    public static volatile SingularAttribute<Accounts, String> accname;

}