/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.util.regex.Pattern;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

/**
 *
 * @author R.Berberi
 */
@FacesValidator(value = "validatorPassword")
public class validatorPassword implements Validator{
    
    @Override
    public void validate(FacesContext context, UIComponent component, Object value)
                            throws ValidatorException{
        String passwordString = (String)value;
        String msg, UIID = component.getClientId();
        String pattern;
        FacesMessage fm;
        
        
        pattern =   "^" +
                    "(?=.*[A-Z])"+          // mindestens 1 Großbuchstabe
                    "(?=.*[a-z])"+          // mindestens 1 Kleinbuchstabe
                    "(?=.*[0-9])"+          // mindestens 1 Zahl
                    "(?=\\S+)"+             // No Whitespaces
                    "(?=.*[@#%$^&§+=])"+    // mindestens 1 Erlaubte Sonderzeichen
                    ".{8,}"+                // mindestens 8 Zeichen
                    "$";
        
        if (Pattern.matches(pattern, passwordString)){
            //msg = "Passwort ok!";
            msg = "";
        }
        else{
            msg = "Passwort überprüfen!";        
            fm = new FacesMessage(UIID, msg);
            throw new ValidatorException(fm);
        }
                
    }
}
