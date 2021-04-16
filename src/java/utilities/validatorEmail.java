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
@FacesValidator(value = "validatorEmail")
public class validatorEmail implements Validator{
    @Override
    public void validate(FacesContext context, UIComponent component, Object value)
                            throws ValidatorException{
        String emailString = (String)value;
        String msg, UIID = component.getClientId();
        String pattern;
        FacesMessage fm;

        pattern =   "^" +
                    "[A-Za-z]{1}"+          // E-mail started und endet mit Buchstaben
                    "[\\w-.]{3,23}"+        // 3-23 Wortzeichen + "-." erlaubt
                    "+@[\\w-]{2,22}"+       // Domain: Wortzeichen + - erlaubt
                    "\\.[A-Za-z]{2,4}"+     // z.b. .com (2-4 Buchstaben)
                    "$";
        if (!"".equals(emailString))    {
            if (Pattern.matches(pattern, emailString)){
                msg = "";
            }
            else{
                msg = "Email überprüfen!";        
                fm = new FacesMessage(UIID, msg);
                throw new ValidatorException(fm);
            }
        }
    }
}