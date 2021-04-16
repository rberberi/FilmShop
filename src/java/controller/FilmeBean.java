package controller;

import java.util.logging.Logger;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import model.Filme;
import utilities.Data;

/**
 *
 * @author R.Berberi
 */
@Named(value = "filmeBean")
@RequestScoped
public class FilmeBean {

    private List<Filme> filmList;
    private static final Logger logger
            = Logger.getLogger(FilmeBean.class.getName());
    
    @Inject
    private Data dbBean;
    
    /**
     * Creates a new instance of BackingJPABean
     */
    public FilmeBean() {
        this.filmList = new ArrayList<>();
        logger.info("Konstruktor BackingJPABean");
    }
    
    @PostConstruct
    private void init(){
        this.filmList = dbBean.dbGetFilmeList();
        logger.info("PostConstruct BackingJPABean");
    }

    @PreDestroy
    private void finalMethod(){
        logger.info("PreDestroy BackingJPABean");
    }
    
    

    /**
     * @return the filmList
     */
    public List<Filme> getFilmList() {
        return filmList;
    }

    /**
     * @param filmList the filmList to set
     */
    public void setFilmList(List<Filme> filmList) {
        this.filmList = filmList;
    }
    
}
