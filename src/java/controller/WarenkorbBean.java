/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.LoginBean;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;
import static javafx.application.Platform.exit;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import model.Accounts;
import model.Bestelldetail;
import model.Bestellung;
import model.Filme;
import model.Kunde;
import utilities.Data;

/**
 *
 * @author rei
 */
@Named(value = "warenkorbBean")
@SessionScoped
public class WarenkorbBean implements Serializable {

    private Filme filmBestellung;
    private List<Filme> filmeBestellungList;
    private int ausleihDauer = 1;
    private Date lieferDat;
    private Date rueckDat;
    private int warenAnzahl=0;
    
    private static final Logger logger
            = Logger.getLogger(FilmeBean.class.getName());
    
    @Inject
    private Data dbBean;
    
    @Inject
    private LoginBean loginBean;
    
    /**
     * Creates a new instance of WarenkorbBean
     */
    public WarenkorbBean() {
        this.filmeBestellungList=new ArrayList<>(); 
    }

    /**
     * @return the filmBestellung
     */
    public Filme getFilmBestellung() {
        return filmBestellung;
    }

    /**
     * @param filmBestellung the filmBestellung to set
     */
    public void setFilmBestellung(Filme filmBestellung) {
        this.filmBestellung = filmBestellung;
    }

    /**
     * @return the ausleihDauer
     */
    public int getAusleihDauer() {
        return ausleihDauer;
    }

    /**
     * @param ausleihDauer the ausleihDauer to set
     */
    public void setAusleihDauer(int ausleihDauer) {
        this.ausleihDauer = ausleihDauer;
    }

    /**
     * @return the lieferDat
     */
    public Date getLieferDat() {
        return lieferDat;
    }

    /**
     * @param lieferDat the lieferDat to set
     */
    public void setLieferDat(Date lieferDat) {       
        this.lieferDat = lieferDat;     
    }

    /**
     * @return the rueckDat
     */
    public Date getRueckDat() {
        return rueckDat;
    }

    /**
     * @param rueckDat the rueckDat to set
     */
    public void setRueckDat(Date rueckDat) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(this.lieferDat);
        calendar.add(Calendar.DATE, this.ausleihDauer);
        this.rueckDat = calendar.getTime();
    }
        /**
     * @return the warenAnzahl
     */
    public int getWarenAnzahl() {
        return warenAnzahl;
    }

    /**
     * @param warenAnzahl the warenAnzahl to set
     */
    public void setWarenAnzahl(int warenAnzahl) {
        this.warenAnzahl = warenAnzahl;
    }
    
        /**
     * @return the filmeBestellungList
     */
    public List<Filme> getFilmeBestellungList() {
        return filmeBestellungList;
    }

    /**
     * @param filmeBestellungList the filmeBestellungList to set
     */
    public void setFilmeBestellungList(List<Filme> filmeBestellungList) {
        this.filmeBestellungList = filmeBestellungList;
    }
    
    public String addToCart(int filmID){
        filmBestellung = dbBean.dbGetFilmeByID(filmID);
        this.filmeBestellungList.add(filmBestellung);
        this.setWarenAnzahl(this.getWarenAnzahl() + 1);
        return "filme.xhtml";
    }

    public String removeFromCart(int filmID){
        filmBestellung = dbBean.dbGetFilmeByID(filmID);
        this.filmeBestellungList.remove(filmBestellung);
        this.setWarenAnzahl(this.getWarenAnzahl() - 1);
        //this.lieferDat = null;
        //this.rueckDat = null;
        //this.ausleihDauer = 1;
        return "warenkorb.xhtml";
    }
    
    public String getTotalPrice(){     
        
        double preisSumme = 0;
        for(int i=0; i<this.filmeBestellungList.size(); i++)
        {           
            preisSumme += filmeBestellungList.get(i).getFPreisNetto().doubleValue();        
        }
        return String.format("%.2f", preisSumme*this.ausleihDauer);

    }
    
    public void sendFM(String s, String comp){
        FacesMessage msg = new FacesMessage(s);
        FacesContext.getCurrentInstance().addMessage(comp, msg);
    }

    public String bestellen(){
        if(!loginBean.isIsLoggedIn()){
            String msg = "Bitte einloggen oder registrieren um mit die Bestellung fortzfahren";
            sendFM(msg, "table2:0:bestellBtn");
        } else {
            if(this.filmeBestellungList.size() != 0){
                this.bestellungSchicken();
                this.warenAnzahl=0;   
                this.filmeBestellungList.clear();
                return "danke.xhtml";
            } else {                
                String msg = "Bitte ein Film auswählen!";
                sendFM(msg, "table2:0:bestellBtn");
            }
            
        }
        
        return "warenkorb.xhtml";
    }
    
    public String bestellungSchicken(){
   
        Bestellung bestellung = new Bestellung();
        String benutzer = loginBean.getBenutzername();
        Accounts account = dbBean.findUserByUserName(benutzer);

        Kunde kunde = dbBean.findKundeByAccount(account);
        
        bestellung.setFkKid(kunde);
        
        bestellung.setBLieferDat(lieferDat);
        bestellung.setBRueckDat(rueckDat);

        dbBean.bestellen(bestellung, this.filmeBestellungList);
        
         
        /*for (int i=0; i<this.filmeBestellungList.size(); i++)
        {
            Bestelldetail bestelldetail  = new Bestelldetail();
            
            bestelldetail.setFkFid(filmeBestellungList.get(i));
           
            bestelldetail.setFkBid(bestellung);
            
            dbBean.bestelldetailSchicken(bestelldetail);
        }*/
               
        this.filmBestellung = null;
        this.filmeBestellungList.clear();
        this.lieferDat = null;
        this.rueckDat = null;
        this.ausleihDauer = 1;
        
        return "message.xhtml";
    }


    
}
