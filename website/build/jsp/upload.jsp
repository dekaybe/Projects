<%@page import="java.io.InputStream" %>
<%@page import="java.util.Properties" %>

<jsp:useBean id="fr" class="srgp_data_website.generate_frame" />
<jsp:useBean id="wd" class="srgp_data_website.widget" />

<%
    InputStream stream = application.getResourceAsStream("WEB-INF/project.properties");
    Properties props = new Properties();
    props.load(stream);
    String str_version      = props.getProperty("buildNum");
    String str_version_date = props.getProperty("buildDate");
    String v_user_name      = wd.user_name( request.getRemoteUser() );
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>SRGP - Data Group Home Page</title>
    <style type="text/css">
      @import url("/SRGP/css/mainstyles.css");
    </style>

  </head>
  <body> 
    <table class="banner" border=0 cellPadding=0 cellSpacing=0 width="100%">
      <tr>
        <%= fr.banner(v_user_name) %>
      </tr>
    </table>

    <table class="universe" border=0 cellPadding=0 cellSpacing=0 width="100%">
      <tr>
        <%= fr.left_side_menu(str_version, str_version_date) %>

        <td class="main_window">
          <%-- START OF THE MAIN PAGE TABLE--%>
          <%-- START OF THE MAIN PAGE TABLE--%>
          <table>
            <tr>
              <td>
                <br/>
	            NationBuilder files are loaded below, after being uploaded a file of the differences from the
                latest previously loaded file will automatically be downloaded.
                <table>
		          <form method="POST" action="upload" enctype="multipart/form-data" >
		            <tr>
                      <td>
                        NationBuilder File:
                      </td>
		              <td>
                        <input type="file" name="file" id="file" /> 
		                <input type="submit" value="Upload" name="upload" id="upload" />
                      </td>
                    </tr>  
		          <input type="hidden" value="/SRGP/data/upload/NationBuilder" name="destination"/>
                  <input type="hidden" value="NB_file" name="p_file_type"/>
                </form>
		        </table>
              <br/>
              <br/>
              CiviCRM file are loaded below, after uploaded a file, in the NationBuilder format,
		      will be automatically be downloaded. The files should be loaded exactly as they are
		      downloaded from NationBuilder without renaming. 
		      <table>
		      <form method="POST" action="upload" enctype="multipart/form-data" >
		        <tr>
                  <td>
                    Members File:
                  </td>
		          <td>
                    <input type="file" name="file" id="file" /> 
                  </td>
		          <td>
		            <input type="submit" value="Upload" name="upload" id="upload" />
                  </td>
		          <input type="hidden" value="/SRGP/data/upload/members" name="destination"/>
                  <input type="hidden" value="Members_file" name="p_file_type"/>
		        </tr>  
              </form>


              <form method="POST" action="upload" enctype="multipart/form-data" >
		        <tr>
                  <td>
                    Supporters File:
                  </td>
		          <td>
                    <input type="file" name="file" id="file" /> 
                  </td>
		          <td>
                    <input type="submit" value="Upload" name="upload" id="upload" />
                  </td>
                  <input type="hidden" value="/SRGP/data/upload/supporters" name="destination"/>
                  <input type="hidden" value="Supporters_file" name="p_file_type"/>
		        </tr>  
              </form>
                
              <form method="POST" action="upload" enctype="multipart/form-data" >
		        <tr>
                  <td>
                    Volunteers File:
                  </td>
		          <td>
                    <input type="file" name="file" id="file" /> 
                  </td>
		          <td>
                    <input type="submit" value="Upload" name="upload" id="upload" />
                  </td>
                  <input type="hidden" value="/SRGP/data/upload/volunteers" name="destination"/>
                  <input type="hidden" value="Volunteers_file" name="p_file_type"/>
		        </tr>  
              </form>
                
              <form method="POST" action="upload" enctype="multipart/form-data" >
		        <tr>
                  <td>
                    Officers File:
                  </td>
		          <td>
                    <input type="file" name="file" id="file" /> 
                  </td>
		          <td>
                    <input type="submit" value="Upload" name="upload" id="upload" />
                  </td>
                  <input type="hidden" value="/SRGP/data/upload/officers" name="destination"/>
                  <input type="hidden" value="Officers_file" name="p_file_type"/>
		        </tr>  
              </form>

              </td>
            </tr>
          </table>
          <%-- END OF THE MAIN PAGE TABLE--%>
          <%-- END OF THE MAIN PAGE TABLE--%>
        </td>
      </tr>
    </table>

    <br/>
    <br/>
    <br/>
  </body>
</html>
