
package com.tech.blog.entties;


//import java.security.Timestamp;
import java.sql.Timestamp;


/**
 *
 * @author ALPANA KUMARI
 */
public class Post {
    private int pid;
    private String ptitle;
    private String pcontent;
    private String pcod;
    private String ppic;
    private Timestamp pdate;
    private int catid;
    private int userId;

    public Post() {
    }

    public Post(int pid, String ptitle, String pcontent, String pcod, String ppic, Timestamp pdate, int catid , int userId) {
        this.pid = pid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcod = pcod;
        this.ppic = ppic;
        this.pdate = pdate;
        this.catid = catid;
        this.userId=userId;
    }

    public Post(String ptitle, String pcontent, String pcod, String ppic, Timestamp pdate, int catid,int userId) {
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcod = pcod;
        this.ppic = ppic;
        this.pdate = pdate;
        this.catid = catid;
        this.userId=userId;
    }   

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getPcod() {
        return pcod;
    }

    public void setPcod(String pcod) {
        this.pcod = pcod;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
    
    
}
