package bean;

import org.springframework.stereotype.Repository;

import java.util.Date;
@Repository
public class adminlog {
    private Integer id;

    private String username;

    private String password;

    private Date logintime;

    private String loginip;

    private String useros;

    private String ok;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Date getLogintime() {
        return logintime;
    }

    public void setLogintime(Date logintime) {
        this.logintime = logintime;
    }

    public String getLoginip() {
        return loginip;
    }

    public void setLoginip(String loginip) {
        this.loginip = loginip == null ? null : loginip.trim();
    }

    public String getUseros() {
        return useros;
    }

    public void setUseros(String useros) {
        this.useros = useros == null ? null : useros.trim();
    }

    public String getOk() {
        return ok;
    }

    public void setOk(String ok) {
        this.ok = ok == null ? null : ok.trim();
    }
}