package com.tech.blog.dao;


import java.sql.*;
import com.tech.blog.entties.User; // Make sure this import exists

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    // Method to insert user data into the database
    
    
    
    public boolean saveUser(User user) {
    boolean flag = false;
    try {
        String query = "INSERT INTO user(name, email, password, gender, about, profile) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = this.con.prepareStatement(query);
        pstmt.setString(1, user.getName());
        pstmt.setString(2, user.getEmail());
        pstmt.setString(3, user.getPassword());
        pstmt.setString(4, user.getGender());
        pstmt.setString(5, user.getAbout());
        pstmt.setString(6, user.getProfile()); // Profile add kiya
        pstmt.executeUpdate();
        flag = true;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return flag;
}

    
//    public boolean saveUser(User user) {
//        boolean flag = false;
//        try {
//            String query = "INSERT INTO user(name, email, password, gender, about) VALUES (?, ?, ?, ?, ?)";
//
//            PreparedStatement pstmt = this.con.prepareStatement(query); // Correct spelling
//            pstmt.setString(1, user.getName());
//            pstmt.setString(2, user.getEmail());
//            pstmt.setString(3, user.getPassword());
//            pstmt.setString(4, user.getGender());
//            pstmt.setString(5, user.getAbout());
//
//            pstmt.executeUpdate(); // Execute the query
//            flag = true;
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return flag;
//    }
    //grt user by  useremail and userpassword
   public User getUserBYEmailAnadPassword(String email, String password)
{
    User user=null;
    
         try{
             String query="select * from user where email=? and password=?";
             PreparedStatement pstmt=con.prepareStatement(query);
             pstmt.setString(1,email);
             pstmt.setString(2,password);
             ResultSet set =   pstmt.executeQuery();
             if(set.next())
             { 
               user=new User();  
               ///data frpm db
               String name=set.getString("name");
               user.setName(name);
               user.setId(set.getInt("id"));
               user.setEmail(set.getString("email"));
               user.setPassword(set.getString("password"));
               user.setGender(set.getString("gender"));
               user.setAbout(set.getString("about"));
               user.setDateTime(set.getTimestamp("rdate"));
               user.setProfile(set.getString("profile"));
                 
             }   
             
         }catch(Exception e){
             e.printStackTrace();
         }
    
            return user;
}
   
 public boolean updateUser(User user) {
    boolean f = false;

    try {
        String query = "UPDATE User SET name=?, email=?, password=?, gender=?, about=?, profile=? WHERE id=?";
        PreparedStatement p = con.prepareStatement(query);
        p.setString(1, user.getName());
        p.setString(2, user.getEmail());
        p.setString(3, user.getPassword());
        p.setString(4, user.getGender());
        p.setString(5, user.getAbout());
        p.setString(6, user.getProfile()); // You missed this if you have a profile field
        p.setInt(7, user.getId()); // Assuming 'id' is an integer. Use setString if it's a String.

        p.executeUpdate();
        f = true;
    } catch (Exception e) {
        e.printStackTrace();
    }

    return f;
}
 
public User getUserByUserId(int userId) {
    User user=null;
    try{
    String q="select *from User where id=?";
    PreparedStatement ps=this.con.prepareStatement(q);
    ps.setInt(1,userId);
    ResultSet set=ps.executeQuery();
    if(set.next()){
      user=new User();  
               ///data frpm db
               String name=set.getString("name");
               user.setName(name);
               user.setId(set.getInt("id"));
               user.setEmail(set.getString("email"));
               user.setPassword(set.getString("password"));
               user.setGender(set.getString("gender"));
               user.setAbout(set.getString("about"));
               user.setDateTime(set.getTimestamp("rdate"));
               user.setProfile(set.getString("profile"));  
    }
    }catch(Exception e){
        e.printStackTrace();
    }
    
    return user;
}

public User getUserByEmail(String email) {
        User user = null;
        try {
            String q = "SELECT * FROM user WHERE email=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                user = extractUser(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }


private User extractUser(ResultSet set) throws SQLException {
        User user = new User();
        user.setId(set.getInt("id"));
        user.setName(set.getString("name"));
        user.setEmail(set.getString("email"));
        user.setPassword(set.getString("password"));
        user.setGender(set.getString("gender"));
        user.setAbout(set.getString("about"));
        user.setDateTime(set.getTimestamp("rdate"));
        user.setProfile(set.getString("profile"));
        return user;
    }


    
    
}
