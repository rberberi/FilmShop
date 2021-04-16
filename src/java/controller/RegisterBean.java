/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.LoginBean;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;
import model.Accounts;
import model.Kunde;
import utilities.Data;

/**
 *
 * @author rei
 */
@Named(value = "registerBean")
@RequestScoped
public class RegisterBean {
    
    private String vorname;
    private String nachname;
    private String telNummer;   
    private String email;
    private String benutzername;
    private String passwort;
    private boolean nachnameOK;
    private boolean telnummerOK;

    private static final Logger logger =
            Logger.getLogger(RegisterBean.class.getName());
    
    @Inject
    private Data dbBean;
    
    @Inject 
    private LoginBean loginBean;
    
    /**
     * Creates a new instance of RegisterBean
     */
    public RegisterBean() {       
    }

    /**
     * @return the vorname
     */
    public String getVorname() {
        return vorname;
    }

    /**
     * @param vorname the vorname to set
     */
    public void setVorname(String vorname) {
        this.vorname = vorname;
    }

    /**
     * @return the nachname
     */
    public String getNachname() {
        return nachname;
    }

    /**
     * @param nachname the nachname to set
     */
    public void setNachname(String nachname) {
        this.nachname = nachname;
    }

    /**
     * @return the telNummer
     */
    public String getTelNummer() {
        return telNummer;
    }

    /**
     * @param telNummer the telNummer to set
     */
    public void setTelNummer(String telNummer) {
        this.telNummer = telNummer;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the benutzername
     */
    public String getBenutzername() {
        return benutzername;
    }

    /**
     * @param benutzername the benutzername to set
     */
    public void setBenutzername(String benutzername) {
        this.benutzername = benutzername;
    }

    /**
     * @return the passwort
     */
    public String getPasswort() {
        return passwort;
    }

    /**
     * @param passwort the passwort to set
     */
    public void setPasswort(String passwort) {
        this.passwort = passwort;
    }
    
        /**
     * @return the nachnameOK
     */
    public boolean isNachnameOK() {
        return nachnameOK;
    }

    /**
     * @param nachnameOK the nachnameOK to set
     */
    public void setNachnameOK(boolean nachnameOK) {
        this.nachnameOK = nachnameOK;
    }

    /**
     * @return the telnummerOK
     */
    public boolean isTelnummerOK() {
        return telnummerOK;
    }

    /**
     * @param telnummerOK the telnummerOK to set
     */
    public void setTelnummerOK(boolean telnummerOK) {
        this.telnummerOK = telnummerOK;
    }
    
    public void sendFM(FacesContext context, UIComponent comp, String msg){
        FacesMessage message = new FacesMessage(msg);
        context.addMessage(comp.getClientId(context), message);
    }
    
    public void sendFM(String s, String comp){
        FacesMessage msg = new FacesMessage(s);
        FacesContext.getCurrentInstance().addMessage(comp, msg);
    }
    
    public void validateNachname(FacesContext context, UIComponent comp, Object value){
        String regex = "[A-Z]{1}[a-z]{2,24}";
        String name = (String) value;
        String msg;
        this.nachnameOK = false;
        if(name.length() > 2 ) {
            if(!Pattern.matches(regex, name)){
                msg = "Familienname muss mit einem Großbuchstaben anfangen, und 3-25 Zeichen haben";
                sendFM(context, comp, msg);
            } else {
                this.nachnameOK = true;
            }
        }
        else {
            msg = "Familienname muss mindestens 3 Zeichen haben!";
            sendFM(context, comp, msg);
        }
    }
    
    
    public void validateTelnummer(FacesContext context, UIComponent comp, Object value){
        String regex = "[0]{1}[0-9]{7,15}";
        String telnr = (String) value;
        String msg;
        this.telnummerOK = false;
        if(telnr.length() > 7) {
            if(!Pattern.matches(regex, telnr)){
                msg = "TelNr muss mit 0 beginnen, 8-15 Zahlen und nur Zahlen haben";
                sendFM(context, comp, msg);
            } else {
                this.telnummerOK = true;
            }
        }
        else {
            msg = "Telefonnummer muss mindestens 8 Zahlen haben!";
            sendFM(context, comp, msg);
        }
    }
    
    public String register(){
        if(this.nachnameOK && this.telnummerOK){
            if(!dbBean.benutzerSuche(benutzername)){
                Accounts account = new Accounts();
                account.setAccname(benutzername);
                account.setAccpwd(passwort);
                dbBean.registerBenutzer(account);

                Kunde kunde = new Kunde();
                kunde.setKVName(vorname);
                kunde.setKName(nachname);
                kunde.setKEmail(email);
                kunde.setKTel(telNummer);

                kunde.setFkAccid(account);
                dbBean.registerKunde(kunde);

                loginBean.setBenutzername(benutzername);
                loginBean.setPasswort(passwort);
                loginBean.login();
                return "filme.xhtml";
            }
            else 
            {
                this.sendFM("Username bereits vergeben!", "benutzername");
            }
        }
        return "register.xhtml";
    }


    
}
