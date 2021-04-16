/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author rei
 */
@Entity
@Table(name = "kunde")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Kunde.findAll", query = "SELECT k FROM Kunde k")
    , @NamedQuery(name = "Kunde.findByKid", query = "SELECT k FROM Kunde k WHERE k.kid = :kid")
    , @NamedQuery(name = "Kunde.findByKVName", query = "SELECT k FROM Kunde k WHERE k.kVName = :kVName")
    , @NamedQuery(name = "Kunde.findByKName", query = "SELECT k FROM Kunde k WHERE k.kName = :kName")
    , @NamedQuery(name = "Kunde.findByKEmail", query = "SELECT k FROM Kunde k WHERE k.kEmail = :kEmail")
    , @NamedQuery(name = "Kunde.findByKTel", query = "SELECT k FROM Kunde k WHERE k.kTel = :kTel")
, @NamedQuery(name = "Kunde.findByAcc", query = "SELECT k FROM Kunde k WHERE k.fkAccid = :FK_ACCID")})
public class Kunde implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "KID")
    private Integer kid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "KVName")
    private String kVName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "KName")
    private String kName;
    @Size(max = 100)
    @Column(name = "KEmail")
    private String kEmail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "KTel")
    private String kTel;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkKid")
    private Collection<Bestellung> bestellungCollection;
    @JoinColumn(name = "FK_ACCID", referencedColumnName = "ACCID")
    @ManyToOne(optional = false)
    private Accounts fkAccid;

    public Kunde() {
    }

    public Kunde(Integer kid) {
        this.kid = kid;
    }

    public Kunde(Integer kid, String kVName, String kName, String kTel) {
        this.kid = kid;
        this.kVName = kVName;
        this.kName = kName;
        this.kTel = kTel;
    }

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }

    public String getKVName() {
        return kVName;
    }

    public void setKVName(String kVName) {
        this.kVName = kVName;
    }

    public String getKName() {
        return kName;
    }

    public void setKName(String kName) {
        this.kName = kName;
    }

    public String getKEmail() {
        return kEmail;
    }

    public void setKEmail(String kEmail) {
        this.kEmail = kEmail;
    }

    public String getKTel() {
        return kTel;
    }

    public void setKTel(String kTel) {
        this.kTel = kTel;
    }

    @XmlTransient
    public Collection<Bestellung> getBestellungCollection() {
        return bestellungCollection;
    }

    public void setBestellungCollection(Collection<Bestellung> bestellungCollection) {
        this.bestellungCollection = bestellungCollection;
    }

    public Accounts getFkAccid() {
        return fkAccid;
    }

    public void setFkAccid(Accounts fkAccid) {
        this.fkAccid = fkAccid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (kid != null ? kid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Kunde)) {
            return false;
        }
        Kunde other = (Kunde) object;
        if ((this.kid == null && other.kid != null) || (this.kid != null && !this.kid.equals(other.kid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.Kunde[ kid=" + kid + " ]";
    }
    
}
