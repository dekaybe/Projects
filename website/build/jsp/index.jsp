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
	        <br />
	        Hi There,
		<br />
		This is the SRGP Data Group "draft" website. 
		<br />
		I'm hoping that we can use it to upload and download files between CIVI and NationBuilder.
		<br />
		I have created a database here that loads CIVI file and exports NB files.
		<br />
		I am currently working on the data transformations from one to another :-)
                <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                <br/><br/><br/><br/><br/><br/><br/><br/><br/>
              </td>
            </tr>
          </table>
          <%-- END OF THE MAIN PAGE TABLE--%>
        </td>
      </tr>
    </table>

    <br/>
    <br/>
    <br/>
  </body>
</html>
