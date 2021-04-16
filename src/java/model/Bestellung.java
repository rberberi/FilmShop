/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author rei
 */
@Entity
@Table(name = "bestellung")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bestellung.findAll", query = "SELECT b FROM Bestellung b")
    , @NamedQuery(name = "Bestellung.findByBid", query = "SELECT b FROM Bestellung b WHERE b.bid = :bid")
    , @NamedQuery(name = "Bestellung.findByBLieferDat", query = "SELECT b FROM Bestellung b WHERE b.bLieferDat = :bLieferDat")
    , @NamedQuery(name = "Bestellung.findByBRueckDat", query = "SELECT b FROM Bestellung b WHERE b.bRueckDat = :bRueckDat")})
public class Bestellung implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "BID")
    private Integer bid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "BLieferDat")
    @Temporal(TemporalType.DATE)
    private Date bLieferDat;
    @Basic(optional = false)
    @NotNull
    @Column(name = "BRueckDat")
    @Temporal(TemporalType.DATE)
    private Date bRueckDat;
    @JoinColumn(name = "FK_KID", referencedColumnName = "KID")
    @ManyToOne(optional = false)
    private Kunde fkKid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkBid")
    private Collection<Bestelldetail> bestelldetailCollection;

    public Bestellung() {
    }

    public Bestellung(Integer bid) {
        this.bid = bid;
    }

    public Bestellung(Integer bid, Date bLieferDat, Date bRueckDat) {
        this.bid = bid;
        this.bLieferDat = bLieferDat;
        this.bRueckDat = bRueckDat;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public Date getBLieferDat() {
        return bLieferDat;
    }

    public void setBLieferDat(Date bLieferDat) {
        this.bLieferDat = bLieferDat;
    }

    public Date getBRueckDat() {
        return bRueckDat;
    }

    public void setBRueckDat(Date bRueckDat) {
        this.bRueckDat = bRueckDat;
    }

    public Kunde getFkKid() {
        return fkKid;
    }

    public void setFkKid(Kunde fkKid) {
        this.fkKid = fkKid;
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
        hash += (bid != null ? bid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bestellung)) {
            return false;
        }
        Bestellung other = (Bestellung) object;
        if ((this.bid == null && other.bid != null) || (this.bid != null && !this.bid.equals(other.bid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.Bestellung[ bid=" + bid + " ]";
    }
    
}
