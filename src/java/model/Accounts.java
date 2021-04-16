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
@Table(name = "accounts")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Accounts.findAll", query = "SELECT a FROM Accounts a")
    , @NamedQuery(name = "Accounts.findByAccid", query = "SELECT a FROM Accounts a WHERE a.accid = :accid")
    , @NamedQuery(name = "Accounts.findByAccname", query = "SELECT a FROM Accounts a WHERE a.accname = :accname")
    , @NamedQuery(name = "Accounts.findByAccpwd", query = "SELECT a FROM Accounts a WHERE a.accpwd = :accpwd")})
public class Accounts implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ACCID")
    private Integer accid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "ACCNAME")
    private String accname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "ACCPWD")
    private String accpwd;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkAccid")
    private Collection<Kunde> kundeCollection;

    public Accounts() {
    }

    public Accounts(Integer accid) {
        this.accid = accid;
    }

    public Accounts(Integer accid, String accname, String accpwd) {
        this.accid = accid;
        this.accname = accname;
        this.accpwd = accpwd;
    }

    public Integer getAccid() {
        return accid;
    }

    public void setAccid(Integer accid) {
        this.accid = accid;
    }

    public String getAccname() {
        return accname;
    }

    public void setAccname(String accname) {
        this.accname = accname;
    }

    public String getAccpwd() {
        return accpwd;
    }

    public void setAccpwd(String accpwd) {
        this.accpwd = accpwd;
    }

    @XmlTransient
    public Collection<Kunde> getKundeCollection() {
        return kundeCollection;
    }

    public void setKundeCollection(Collection<Kunde> kundeCollection) {
        this.kundeCollection = kundeCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (accid != null ? accid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Accounts)) {
            return false;
        }
        Accounts other = (Accounts) object;
        if ((this.accid == null && other.accid != null) || (this.accid != null && !this.accid.equals(other.accid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.Accounts[ accid=" + accid + " ]";
    }
    
}
