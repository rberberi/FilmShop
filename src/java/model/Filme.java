/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author rei
 */
@Entity
@Table(name = "filme")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Filme.findAll", query = "SELECT f FROM Filme f")
    , @NamedQuery(name = "Filme.findByFid", query = "SELECT f FROM Filme f WHERE f.fid = :fid")
    , @NamedQuery(name = "Filme.findByFName", query = "SELECT f FROM Filme f WHERE f.fName = :fName")
    , @NamedQuery(name = "Filme.findByFJahr", query = "SELECT f FROM Filme f WHERE f.fJahr = :fJahr")
    , @NamedQuery(name = "Filme.findByFPreisNetto", query = "SELECT f FROM Filme f WHERE f.fPreisNetto = :fPreisNetto")})
public class Filme implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "FID")
    private Integer fid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "FName")
    private String fName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FJahr")
    private int fJahr;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "FPreisNetto")
    private BigDecimal fPreisNetto;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkFid")
    private Collection<Bestelldetail> bestelldetailCollection;

    public Filme() {
    }

    public Filme(Integer fid) {
        this.fid = fid;
    }

    public Filme(Integer fid, String fName, int fJahr, BigDecimal fPreisNetto) {
        this.fid = fid;
        this.fName = fName;
        this.fJahr = fJahr;
        this.fPreisNetto = fPreisNetto;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getFName() {
        return fName;
    }

    public void setFName(String fName) {
        this.fName = fName;
    }

    public int getFJahr() {
        return fJahr;
    }

    public void setFJahr(int fJahr) {
        this.fJahr = fJahr;
    }

    public BigDecimal getFPreisNetto() {
        return fPreisNetto;
    }

    public void setFPreisNetto(BigDecimal fPreisNetto) {
        this.fPreisNetto = fPreisNetto;
    }

    @XmlTransient
    public Collection<Bestelldetail> getBestelldetailCollection() {
        return bestelldetailCollection;
    }

    public void setBestelldetailCollection(Collection<Bestelldetail> bestelldetailCollection) {
        this.bestelldetailCollection = bestelldetailCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (fid != null ? fid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Filme)) {
            return false;
        }
        Filme other = (Filme) object;
        if ((this.fid == null && other.fid != null) || (this.fid != null && !this.fid.equals(other.fid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.Filme[ fid=" + fid + " ]";
    }
    
}
