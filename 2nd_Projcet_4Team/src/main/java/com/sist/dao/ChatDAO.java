package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.chat.*;
public class ChatDAO {
  private Connection conn;
  private PreparedStatement ps;
  private final String URL="jdbc:oracle:thin:@211.238.142.113:1521:XE";
  
  public ChatDAO()
  {
	  try
	  {
		  Class.forName("oracle.jdbc.driver.OracleDriver");
	  }catch(Exception ex) {}
  }
  public void getConnection()
  {
	 try
	 {
		 conn=DriverManager.getConnection(URL,"hr","happy");
	 }catch(Exception ex) {}
  }
  public void disConnection()
  {
	try
	{
		if(ps!=null) ps.close();
		if(conn!=null) conn.close();
	}catch(Exception ex) {}
  }
  public ChatVO chatInfoData(String userId) {
	  ChatVO vo=new ChatVO();
	  try
	  {
		  getConnection();
		  String sql="SELECT userId,userName FROM projectMember "
				    +"WHERE userId=?";
		  ps=conn.prepareStatement(sql);
		  ps.setString(1, userId);
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  vo.setUserId(rs.getString(1));
		  vo.setUserName(rs.getString(2));
		  rs.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();  
      }
	  finally
	  {
		  disConnection();
	  }
	  return vo;
  }
}