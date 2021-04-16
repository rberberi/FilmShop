package model;

import static com.sun.faces.facelets.util.Path.context;
import java.io.Serializable;
import java.util.logging.Logger;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;
import utilities.Data;

/**
 *
 * @author R.Berberi
 */
@Named(value = "loginBean")
@SessionScoped
public class LoginBean implements Serializable {



    private String benutzername;
    private String passwort;
    private boolean isLoggedIn = false;
    private boolean loginError = false;
    private static final Logger logger
            = Logger.getLogger(LoginBean.class.getName());
  
    @Inject
    private Data dbBean;
    
    /**
     * Creates a new instance of BackingJPABean
     */
    public LoginBean() {
        this.benutzername = "";
        this.passwort = "";
        this.isLoggedIn = false;
        this.loginError = false;
        logger.info("Konstruktor BackingJPABean");
    }
    
    /**
     * @return the isLoggedIn
     */
    public boolean isIsLoggedIn() {
        return isLoggedIn;
    }

    /**
     * @param isLoggedIn the isLoggedIn to set
     */
    public void setIsLoggedIn(boolean isLoggedIn) {
        this.isLoggedIn = isLoggedIn;
    }

    /**
     * @return the loginError
     */
    public boolean isLoginError() {
        return loginError;
    }

    /**
     * @param loginError the loginError to set
     */
    public void setLoginError(boolean loginError) {
        this.loginError = loginError;
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

    
    public void sendFM(FacesContext context, UIComponent comp, String msg){
        FacesMessage message = new FacesMessage(msg);
        context.addMessage(comp.getClientId(context), message);
    }
    
    public void sendFM(String s, String comp){
        FacesMessage msg = new FacesMessage(s);
        FacesContext.getCurrentInstance().addMessage(comp, msg);
    }
    
    public String login(){
  

        if (dbBean.login(benutzername, passwort)){
            this.isLoggedIn = true;
            return "filme.xhtml";
        }
        
        FacesMessage m = new FacesMessage( "Eingaben überprüfen!");
        FacesContext.getCurrentInstance().addMessage("loginForm", m);
     
        return "index.xhtml";
    }
    
    public String logout(){
        this.isLoggedIn=false;
        
        HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
        session.invalidate();
        
        return "index.xhtml";
    }

    
}
