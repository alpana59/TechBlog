package com.tech.blog.dao;

import com.tech.blog.entties.Category;
import com.tech.blog.entties.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp; // ✅ Correct spelling
//import java.security.Timestamp;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ALPANA KUMARI
 */
public class PostDao {
    
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String q = "SELECT * FROM Category";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c); // ✅ Correct variable name
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String q = "INSERT INTO post(ptitle, pcontent, pcode, ppic, catid, userId) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getPtitle());
            pstmt.setString(2, p.getPcontent());
            pstmt.setString(3, p.getPcod());
            pstmt.setString(4, p.getPpic());
            pstmt.setInt(5, p.getCatid());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace(); // ❗ Previously: e.getStackTrace(); → this does nothing!
        }
        return f;
    }

    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("SELECT * FROM post order by pid desc");
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pId = set.getInt("pid");
                String pTitle = set.getString("ptitle");
                String pContent = set.getString("pcontent");
                String pCod = set.getString("pcode");
                String pPic = set.getString("ppic");
                Timestamp pdate = set.getTimestamp("pdate"); // ✅ Correct usage
                int catId = set.getInt("catid");
                int userId = set.getInt("userId");

                Post ppost = new Post(pId, pTitle, pContent, pCod, pPic, pdate, catId, userId);
                list.add(ppost);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        // You can implement this method later
        
        try {
            PreparedStatement p = con.prepareStatement("SELECT * FROM post where catId=?");
            p.setInt(1,catId);
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pId = set.getInt("pid");
                String pTitle = set.getString("ptitle");
                String pContent = set.getString("pcontent");
                String pCod = set.getString("pcode");
                String pPic = set.getString("ppic");
                Timestamp pdate = set.getTimestamp("pdate"); // ✅ Correct usage
                
                int userId = set.getInt("userId");

                Post ppost = new Post(pId, pTitle, pContent, pCod, pPic, pdate, catId, userId);
                list.add(ppost);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Post getPostByPostId(int postId){
        Post post=null;
        String q="select * from post where pid=?";
        try{
            PreparedStatement p=this.con.prepareStatement(q);
            p.setInt(1,postId);
            ResultSet set=p.executeQuery();
            if(set.next())
            {
                int pId = set.getInt("pid");
                String pTitle = set.getString("ptitle");
                String pContent = set.getString("pcontent");
                String pCod = set.getString("pcode");
                String pPic = set.getString("ppic");
                Timestamp pdate = set.getTimestamp("pdate"); // ✅ Correct usage
                int cid=set.getInt("catId");
                
                int userId = set.getInt("userId");

                post = new Post(pId, pTitle, pContent, pCod, pPic, pdate, cid, userId);

                
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return post;
    }
}
