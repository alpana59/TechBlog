
package com.tech.blog.dao;
import java.sql.*;

public class LikeDao {
    
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
//    public boolean insertlike(int pid, int uid ){
//        boolean f=false;
//        try{
//            String q="insert into `like`(pid,uid)values(?,?)";
//            PreparedStatement p= con. prepareStatement(q);
//            p.setInt(1, pid);
//            p.setInt(2, uid);
//            p.executeUpdate();
//            f=true;
//            
//            
//        }catch(Exception e){
//            e.printStackTrace();
//            
//        }
//        
//      return f; 
//    }
    public boolean insertlike(int pid, int uid) {
    boolean f = false;
    try {
        String q = "insert into `like`(pid,uid) values(?,?)";
        PreparedStatement p = con.prepareStatement(q);
        p.setInt(1, pid);
        p.setInt(2, uid);
        p.executeUpdate();
        f = true;
    } catch(Exception e) {
        e.printStackTrace();
    }
    return f;
}

    
    public boolean toggleLike(int pid, int uid) {
    boolean f = false;
    try {
        // check if user already liked
        if (isLikedByuser(pid, uid)) {
            // already liked, so delete (dislike)
            String q = "DELETE FROM `like` WHERE pid=? AND uid=?";
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = false; // user has disliked now
        } else {
            // not liked yet, so insert
            String q = "INSERT INTO `like`(pid, uid) VALUES(?, ?)";
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true; // user has liked now
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return f;
}

    public int countLikeOnPost(int pid) {
    int count = 0;
    String q = "SELECT COUNT(*) AS total FROM `like` WHERE pid=?";
    try {
        PreparedStatement p = this.con.prepareStatement(q);
        p.setInt(1, pid);
        ResultSet set = p.executeQuery();
        if (set.next()) {
            count = set.getInt("total");  // alias ka naam use kar rahe hain
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return count;
}

//    public int countLikeOnPost(int pid){
//        int count =0;
//        String q="select count(*) from like where pid=?";
//        try{
//            PreparedStatement p=this.con.prepareStatement(q);
//            p.setInt(1,pid);
//            ResultSet set=p.executeQuery();
//            if(set.next()){
//                count=set.getInt("count(*)");
//            }
//        }catch(Exception e){
//        e.printStackTrace();
//        
//        
//      }
//        
//        return count;
//    }
    public boolean isLikedByuser(int pid,int uid){
    boolean f=false;
    try{
        PreparedStatement p=this.con.prepareStatement("select*from `like` where pid=? AND uid=?");
        p.setInt(1, pid);
        p.setInt(2,uid);
        ResultSet set=p.executeQuery();
        if(set.next()){
            f=true;
        }
        
    }catch(Exception e){
        e.printStackTrace();
    }
    
    return f;
}
    public boolean deletLike(int pid ,int uid )
    {
        boolean f=false;
        try{
        
                 
            PreparedStatement p = this.con.prepareStatement("DELETE FROM `like` WHERE pid=? AND uid=?");

             p.setInt(1, pid);
             p.setInt(2,uid);
             p.executeUpdate();
             f=true;
        }    
        
          catch(Exception e){
              e.printStackTrace();
          }
        return f;
        
        
    }
    // Save or update user rating
public boolean saveOrUpdateRating(int pid, int uid, int rating) {
    boolean flag = false;
    try {
        String query = "INSERT INTO post_rating (pid, uid, rating) VALUES (?,?,?) ON DUPLICATE KEY UPDATE rating=?";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setInt(1, pid);
        pst.setInt(2, uid);
        pst.setInt(3, rating);
        pst.setInt(4, rating);

        int row = pst.executeUpdate();
        if(row > 0) flag = true;

    } catch(Exception e) {
        e.printStackTrace();
    }
    return flag;
}

// Get previous rating of user
public int getUserRating(int pid, int uid) {
    int rating = 0;
    try {
        String query = "SELECT rating FROM post_rating WHERE pid=? AND uid=?";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setInt(1, pid);
        pst.setInt(2, uid);
        ResultSet rs = pst.executeQuery();
        if(rs.next()) {
            rating = rs.getInt("rating");
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
    return rating;
}
public double getAverageRating(int pid) {
    double avg = 0.0;
    try {
        String query = "SELECT AVG(rating) as avgRating FROM post_rating WHERE pid=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, pid);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            avg = rs.getDouble("avgRating");
            if (rs.wasNull()) {
                avg = 0.0; // agar koi rating nahi hai
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return avg;
}

}



   


