package srgp_data_website;

import java.util.Properties;
import java.io.InputStream;
import srgp_data_website.widget;

public class generate_frame {

  public static String banner(String str_user_name) {
    //
    String v_return = "\n";
    //
    v_return = v_return + "  <td class=\"top_banner_left\">\n";
    v_return = v_return + "    <h1>&nbsp;Sheffield &amp; Rotherham Green Party Data Group</h1>\n";
    v_return = v_return + "  </td>\n";
    v_return = v_return + "  <td class=\"top_banner_right\">\n";
    v_return = v_return + "    <h1>Welcome " + str_user_name + " &nbsp;</h1>\n";
    v_return = v_return + "  </td>\n";
    // 
    return ( v_return );
    //
  }

  public static String left_side_menu(String str_version, String str_version_date) {
    //
    String v_return = "\n";
    //
    v_return = v_return + "<td class=\"side_menu\">";
    v_return = v_return + "<br/>\n";
    v_return = v_return + "&nbsp;<a href=\"http://bankside-computing.co.uk/SRGP\">Home</a>\n";
    v_return = v_return + "<br/>\n";
    v_return = v_return + "&nbsp;<a href=\"/SRGP/jsp/upload.jsp\">Process Files</a>\n";
    v_return = v_return + "<br/>\n";
    v_return = v_return + "<br/><br/><br/><br/><br/><br/><br/><br/><br/>\n";
    v_return = v_return + "<br/><br/><br/><br/><br/><br/><br/><br/><br/>\n";
    v_return = v_return + "<div class=\"small_p\">\n";
    v_return = v_return + "&nbsp;Version:" + str_version + "\n";
    v_return = v_return + "<br/>\n";
    v_return = v_return + "&nbsp;Date:" + str_version_date + "\n";
    v_return = v_return + "<br/>\n";
    v_return = v_return + "&nbsp<a href=\"mailto:dave@bankside-computing.co.uk\">Support?</a>\n";
    v_return = v_return + "</div>\n";
    v_return = v_return + "</td>\n";
    // 
    return ( v_return );
    //
  }

  public static String banner_and_left_menu(String str_user_name, String str_version, String str_version_date) {
    //
    String v_return = "\n";
    //
    v_return = v_return + "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n";
    v_return = v_return + "\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n";
    v_return = v_return + "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n";
    v_return = v_return + "  <head>\n";
    v_return = v_return + "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n";
    v_return = v_return + "    <title>SRGP - Data Group Home Page</title>\n";
    v_return = v_return + "    <style type=\"text/css\">\n";
    v_return = v_return + "      @import url(\"/SRGP/css/mainstyles.css\");\n";
    v_return = v_return + "    </style>\n";
    v_return = v_return + "\n";
    v_return = v_return + "  </head>\n";
    v_return = v_return + "  <body> \n";
    v_return = v_return + "    <table class=\"banner\" border=0 cellPadding=0 cellSpacing=0 width=\"100%\">\n";
    v_return = v_return + "      <tr>\n";
    v_return = v_return +          banner(str_user_name);
    v_return = v_return + "      </tr>\n";
    v_return = v_return + "    </table>\n";
    v_return = v_return + "\n";
    v_return = v_return + "    <table class=\"universe\" border=0 cellPadding=0 cellSpacing=0 width=\"100%\">\n";
    v_return = v_return + "      <tr>\n";
    v_return = v_return +          left_side_menu(str_version, str_version_date);
    v_return = v_return + "\n";
    v_return = v_return + "        <td class=\"main_window\">\n";
    v_return = v_return + "          <table>\n";
    v_return = v_return + "            <tr>\n";
    v_return = v_return + "              <td>\n";
    v_return = v_return + "                <br />\n";
    //
    return ( v_return );
  }

  public static String close_page() {
    //
    String v_return = "\n";
    //
    // v_return = v_return + "                <br/><br/><br/><br/><br/><br/><br/><br/><br/>\n";
    //v_return = v_return + "                <br/><br/><br/><br/><br/><br/><br/><br/><br/>\n";
    v_return = v_return + "              </td>\n";
    v_return = v_return + "            </tr>\n";
    v_return = v_return + "          </table>\n";
    v_return = v_return + "        </td>\n";
    v_return = v_return + "      </tr>\n";
    v_return = v_return + "    </table>\n";
    v_return = v_return + "\n";
    v_return = v_return + "    <br/>\n";
    v_return = v_return + "    <br/>\n";
    v_return = v_return + "    <br/>\n";
    v_return = v_return + "  </body>\n";
    v_return = v_return + "</html>\n";
    //
    return ( v_return );
  }
}
