package utilities;

import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.TypedQuery;
import javax.transaction.UserTransaction;
import model.Accounts;
import model.Bestelldetail;
import model.Bestellung;
import model.Filme;
import model.Kunde;

/**
 *
 * @author R.Berberi
 */
@Named(value = "dataBean")
@SessionScoped
public class Data implements Serializable {

    @PersistenceUnit
    private EntityManagerFactory emf;
    
    @Resource
    private UserTransaction ut;
        
    //EntityManager em = emf.createEntityManager();
    /**
     * Creates a new instance of NewJSFManagedBean
     */
    public Data() {
    }
    
    public List<Filme> dbGetFilmeList()
    {
        EntityManager em = emf.createEntityManager();
        String sql = "SELECT f FROM Filme f ORDER BY f.fName";
        
        TypedQuery<Filme> query = em.createQuery(sql, Filme.class);
        return query.getResultList();
    }
    
    public Filme dbGetFilmeByID(int filmID){
        EntityManager em = emf.createEntityManager();
        
        TypedQuery<Filme> query = 
                em.createNamedQuery("Filme.findByFid", Filme.class);
        query.setParameter("fid", filmID);
        return query.getSingleResult();
    }
    
    public boolean login(String benutzername, String passwort){
        EntityManager em = emf.createEntityManager();
        try{
            String sql = "SELECT a FROM Accounts a WHERE a.accname = :accname AND a.accpwd = :accpwd";
            
            TypedQuery<Accounts> query = em.createQuery(sql, Accounts.class);
            query.setParameter("accname", benutzername);
            query.setParameter("accpwd", passwort);
            //List<Accounts> results = query.getSingleResult();
            if (query.getSingleResult() != null){
                return true;
            }
            return false;                    
        } catch(Exception e){
            return false;
        }
    }
    
    public boolean benutzerSuche(String benutzername){
        EntityManager em = emf.createEntityManager();
        try{    
            TypedQuery<Accounts> query = em.createNamedQuery("Accounts.findByAccname", Accounts.class);
            query.setParameter("accname", benutzername);
            if (query.getSingleResult() != null){
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }
    
    public void registerBenutzer(Accounts account){
        EntityManager em = emf.createEntityManager();
        try{
            ut.begin();
            em.joinTransaction();
            em.persist(account);
            ut.commit();
        } catch(Exception e) {
            try { ut.rollback();}
            catch (Exception e1) {}
        }
    }
    
    public void registerKunde(Kunde kunde) {
        EntityManager em = emf.createEntityManager();
        try{
            ut.begin();
            em.joinTransaction();
            em.persist(kunde);
            ut.commit();
        } catch(Exception e) {
            try { ut.rollback();}
            catch (Exception e1) {}
        }
    }
    
    public Accounts findUserByUserName(String benutzername){
        EntityManager em = emf.createEntityManager();
        try{    
            TypedQuery<Accounts> query = em.createNamedQuery("Accounts.findByAccname", Accounts.class);
            query.setParameter("accname", benutzername);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    
    public Kunde findKundeByAccount(Accounts account){
        EntityManager em = emf.createEntityManager();
        try{    
            TypedQuery<Kunde> query = em.createNamedQuery("Kunde.findByAcc", Kunde.class);
            query.setParameter("FK_ACCID", account);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    
        public Bestelldetail findBestellungByBID(Bestellung bestellung){
        EntityManager em = emf.createEntityManager();
        try{    
            TypedQuery<Bestelldetail> query = em.createNamedQuery("Bestelldetail.findByBestellID", Bestelldetail.class);
            query.setParameter("FK_BID", bestellung);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    
    /*
    public void ausleihen(Bestellung bestellung){
        EntityManager em = emf.createEntityManager();
        try{
            ut.begin();
            em.joinTransaction();
            em.persist(bestellung);

            ut.commit();
        } catch(Exception e) {
            try { ut.rollback();}
            catch (Exception e1) {}
        }
    }
    
     public void bestelldetailSchicken(Bestelldetail bestelldetail){
        EntityManager em = emf.createEntityManager();
        try{
            ut.begin();
            em.joinTransaction();
            em.persist(bestelldetail);
            ut.commit();
        } catch(Exception e) {
            try { ut.rollback();}
            catch (Exception e1) {}
        }
    }
    */
        
    public void bestellen(Bestellung bestellung, List<Filme>FilmBestellungList){
        EntityManager em = emf.createEntityManager();
        try{
            ut.begin();
            em.joinTransaction();
            em.persist(bestellung);
            
        for (int i=0; i<FilmBestellungList.size(); i++)
        {           
            Bestelldetail bestelldetail = new Bestelldetail();
            bestelldetail.setFkFid(FilmBestellungList.get(i));          
            bestelldetail.setFkBid(bestellung);
            em.persist(bestelldetail);
        }
            
            ut.commit();
        } catch(Exception e) {
            try { ut.rollback();}
            catch (Exception e1) {}
        }
        
    }
     
}
