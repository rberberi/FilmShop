/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author rei
 */
@Entity
@Table(name = "bestelldetail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bestelldetail.findAll", query = "SELECT b FROM Bestelldetail b")
    , @NamedQuery(name = "Bestelldetail.findByBdid", query = "SELECT b FROM Bestelldetail b WHERE b.bdid = :bdid")})
public class Bestelldetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "BDID")
    private Integer bdid;
    @JoinColumn(name = "FK_BID", referencedColumnName = "BID")
    @ManyToOne(optional = false)
    private Bestellung fkBid;
    @JoinColumn(name = "FK_FID", referencedColumnName = "FID")
    @ManyToOne(optional = false)
    private Filme fkFid;

    public Bestelldetail() {
    }

    public Bestelldetail(Integer bdid) {
        this.bdid = bdid;
    }

    public Integer getBdid() {
        return bdid;
    }

    public void setBdid(Integer bdid) {
        this.bdid = bdid;
    }

    public Bestellung getFkBid() {
        return fkBid;
    }

    public void setFkBid(Bestellung fkBid) {
        this.fkBid = fkBid;
    }

    public Filme getFkFid() {
        return fkFid;
    }

    public void setFkFid(Filme fkFid) {
        this.fkFid = fkFid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bdid != null ? bdid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bestelldetail)) {
            return false;
        }
        Bestelldetail other = (Bestelldetail) object;
        if ((this.bdid == null && other.bdid != null) || (this.bdid != null && !this.bdid.equals(other.bdid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.Bestelldetail[ bdid=" + bdid + " ]";
    }
    
}
