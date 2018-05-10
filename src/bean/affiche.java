package bean;

import org.springframework.stereotype.Repository;

import java.util.Date;
@Repository
public class affiche {
    private Integer id;

    private String title;

    private String content;

    private Date addtime;

    private String adder;

    private Integer ifhide;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public String getAdder() {
        return adder;
    }

    public void setAdder(String adder) {
        this.adder = adder == null ? null : adder.trim();
    }

    public Integer getIfhide() {
        return ifhide;
    }

    public void setIfhide(Integer ifhide) {
        this.ifhide = ifhide;
    }
}