package srgp_data_website;

import java.text.*;
import java.util.*;
import java.util.logging.*;

//import java.util.Map;
//import java.util.Iterator;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class widget {
  //
  public static String add_NB_to_filename ( String p_file_name )
  {
    //
    String file_name  = p_file_name;
    //
    String [] file_name_split = file_name.split("\\.") ;
    String prefix   = file_name_split[0];
    String postfix  = file_name_split[1];
    //
    String new_file_name = prefix + "NB." + postfix;
    return ( new_file_name  );
    //
  }
  //
  public static String sort_file_name ( String p_file_name, String p_new_prefix )
  {
    //
    String [] v_file_name_split = p_file_name.split("_") ;
    String postfix  = v_file_name_split[1];
    //
    String new_file_name = p_new_prefix + "_" + postfix;
    return ( new_file_name  );
    //
  }

  // 
  public static String user_name ( String p_tomcat_user )
  {
    String v_sql        = ""; 
    String v_return     = ""; 

    try {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      Connection conn =
      DriverManager.getConnection("jdbc:mysql://localhost/srgp?user=admin&password=password");
      Statement stmt = null;
      stmt = conn.createStatement();
      ResultSet rs = null;

      v_sql = "select CONCAT(su_first_name, \" \", su_last_name) from srgp_user where su_tomcat_user=\'" + p_tomcat_user + "\';";

      if (stmt.execute(v_sql)) {
        rs = stmt.getResultSet();
      }   

      if ( rs.isBeforeFirst() ){
        while ( rs.next() ) { 
          v_return = rs.getString(1) ;
        }   
      }   
    
      conn.close();

      return ( v_return );

    } catch (Exception ex) {
      // handle the error
      // HMMMMM RAISE AN ERROR HERE!!!
      return ( ex.toString() );
    }   
  }
  // 
  public static String message ( int p_customer_id )
  {
    String v_sql        = "";  
    String v_return     = "";  

    try {
      //Class.forName("com.mysql.jdbc.Driver").newInstance();
      //Connection conn =
      //DriverManager.getConnection("jdbc:mysql://localhost/vh?user=vh_local&password=Paris1ntS");
      //Statement stmt = null;
      //stmt = conn.createStatement();
      //ResultSet rs = null;

      //v_sql = "select set_message from setting where set_cus_id=" + p_customer_id + ";"; 

      //if (stmt.execute(v_sql)) {
      //  rs = stmt.getResultSet();
      //}    

      //if ( rs.isBeforeFirst() ){
      //  while ( rs.next() ) {  
      //    v_return = rs.getString(1) ;
      //  }    
      //}    
    
      //conn.close();
      return ( v_return );

    } catch (Exception ex) {
      // handle the error
      return ( ex.toString() );
    }    
  }
  //   
  public static int shortMonthToMOY ( String p_MMM )
  {
    int v_return     = 99;

    if        ( p_MMM.equals("Jan")){
      v_return=0;
    } else if ( p_MMM.equals("Feb")) {
      v_return=1;
    } else if ( p_MMM.equals("Mar")) {
      v_return=2;
    } else if ( p_MMM.equals("Apr")) {
      v_return=3;
    } else if ( p_MMM.equals("May")) {
      v_return=4;
    } else if ( p_MMM.equals("Jun")) {
      v_return=5;
    } else if ( p_MMM.equals("Jul")) {
      v_return=6;
    } else if ( p_MMM.equals("Aug")) {
      v_return=7;
    } else if ( p_MMM.equals("Sep")) {
      v_return=8;
    } else if ( p_MMM.equals("Oct")) {
      v_return=9;
    } else if ( p_MMM.equals("Nov")) {
      v_return=10;
    } else if ( p_MMM.equals("Dec")) {
      v_return=11;
    } else {
      v_return=99;
    }

    return ( v_return );
  }
  //
  //
  public static int daysInMonth( int month, int year) 
  {
  String [] p        = new String[100];

    int [] m= new int[12];
    m[0] = 31;  // Jan
    m[2] = 31;  // Mar
    m[3] = 30;  // Apr
    m[4] = 31;  // May
    m[5] = 30;  // Jun
    m[6] = 31;  // Jul
    m[7] = 31;
    m[8] = 30;
    m[9] = 31;
    m[10] = 30;
    m[11] = 31;
    //[31,28,31,30,31,30,31,31,30,31,30,31];
    int vReturn;
    //  
    vReturn = m[month] ;
    if (month == 1) // if feb
    {   
      if (year%4 != 0)  
      { // Maybe a leapyear
        if ( (year%100 == 0 && year%400 != 0) )
        { // not a leap year
          vReturn = 29; 
        } else { // leap year
          vReturn = 28; 
        }   
      }   
   }   
   return( vReturn );
   //return( month );
  }

}

