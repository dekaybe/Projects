package srgp_data_file;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.util.logging.*;
import javax.servlet.annotation.MultipartConfig; 
import javax.servlet.annotation.WebServlet; 
import srgp_data_website.widget;
import srgp_data_website.generate_frame;

// @WebServlet(name = "FileUploadServlet", urlPatterns = {"/upload"})
@MultipartConfig

public class FileUploadServlet extends HttpServlet {

    private final static Logger LOGGER = 
            Logger.getLogger(FileUploadServlet.class.getCanonicalName());
    // Writes to /java_apps/apache-tomcat-7.0.59/logs/catalina.YYYY-MM-DD.log

protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
	    processRequest(request, response);
	    };

protected void processRequest(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    
    Properties prop = new Properties(); 
    prop.load(getServletContext().getResourceAsStream("/WEB-INF/project.properties"));
    String str_version      = prop.getProperty("buildNum");
    String str_version_date = prop.getProperty("buildDate");
    String v_user_name      = widget.user_name( request.getRemoteUser() );
    String v_file_type      = request.getParameter("p_file_type");

    // Create path components to save the file
    final String path = request.getParameter("destination");
    final javax.servlet.http.Part filePart = request.getPart("file");
    final String fileName = getFileName(filePart, v_file_type);

    OutputStream out = null;
    InputStream filecontent = null;
    //final PrintWriter writer = response.getWriter();

    try {
        out = new FileOutputStream(new File(path + File.separator
                + fileName));
        filecontent = filePart.getInputStream();

        int read = 0;
        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
        }

        LOGGER.log(Level.INFO, "File {0} being uploaded to {1}", new Object[]{fileName, path});

        //String RunDir = "/SRGP/data/upload/members/";
        String RunDir = path + "/";
    
    if ( v_file_type.equals("NB_file") ) 
    {
       // NationBuilder file compare happens here
       // get the name of the 2 files first
        String[] FileArray;
        FileArray = new String[2];

        try {

          String RunExe = "./get_last_two_file.ksh";

          Runtime rt = Runtime.getRuntime();
          Process pr = rt.exec(RunExe, null, new File(RunDir));
 
          int exitVal = pr.waitFor();

          BufferedReader input = new BufferedReader(new InputStreamReader(pr.getInputStream()));
          String line="";
 
          int i=0;
          while((line=input.readLine()) != null) {
            FileArray[i] = line;
            System.out.println(line);
            System.out.println("FileArray[" + i + "]=" + FileArray[i] );
            i = i + 1;
          }   
          System.out.println("get_last_two_file.ksh exited with error code "+exitVal);
 
        } catch(Exception e) {
          System.out.println(e.toString());
          e.printStackTrace();
        }   
        //
        //
        try {
          String RunFile0 = FileArray[0]; 
          String RunFile1 = FileArray[1];

          String RunExe = "/SRGP/python/SRGP/nb_updates.py";

          Runtime rt = Runtime.getRuntime();
          Process pr = rt.exec(RunExe + " " + RunFile0 + " " + RunFile1, null, new File(RunDir));
 
          int exitVal = pr.waitFor();

          BufferedReader input = new BufferedReader(new InputStreamReader(pr.getInputStream()));
          String line="";
 
          int l = 0;
          while((line=input.readLine()) != null) {
            System.out.println(line);
            l = l + 1;
            if ( l > 10 )
            {
              break;
            }
          }   
          System.out.println("nb_updates.py exited with error code "+exitVal);
 
        } catch(Exception e) {
          System.out.println(e.toString());
          e.printStackTrace();
        }   

        try {

          String RunExe = "./build_zip_file_etc.ksh";

          Runtime rt = Runtime.getRuntime();
          Process pr = rt.exec(RunExe, null, new File(RunDir));
 
          int exitVal = pr.waitFor();

          BufferedReader input = new BufferedReader(new InputStreamReader(pr.getInputStream()));
          String line="";
 
          int i=0;
          while((line=input.readLine()) != null) {
            System.out.println(line);
          }   
          System.out.println("Exited with error code "+exitVal);
 
        } catch(Exception e) {
          System.out.println(e.toString());
          e.printStackTrace();
        }   
        //

        long serialVersionUID = 1L;
        int BUFSIZE = 4096;
    
        String[] splitString = (FileArray[1].split("\\."));
        //
        String str_download_file = splitString[0] + ".zip";
        //
        String NB_File_and_path = "/SRGP/data/download/" + str_download_file;
        //   
        File file = new File(NB_File_and_path);
        int length   = 0;
        ServletOutputStream outStream = response.getOutputStream();
        ServletContext context  = getServletConfig().getServletContext();
        String mimetype = context.getMimeType(NB_File_and_path);
    
        // sets response content type
        if (mimetype == null) {
            mimetype = "application/octet-stream";
        }   
        response.setContentType(mimetype);
        response.setContentLength((int)file.length());
        String vfileName = (new File(NB_File_and_path)).getName();
    
        // sets HTTP header
        response.setHeader("Content-Disposition", "attachment; filename=\"" + vfileName + "\"");
    
        byte[] byteBuffer = new byte[BUFSIZE];
        DataInputStream in = new DataInputStream(new FileInputStream(file));
    
        // reads the file's bytes and writes them to the response stream
        while ((in != null) && ((length = in.read(byteBuffer)) != -1))
        {   
            outStream.write(byteBuffer,0,length);
        }   
    
        in.close();
        outStream.close();

    }

    // Start of the CIVI transform process and their download
    // Start of the CIVI transform process and their download
    // Only do this if files are of type:
    // Members 
    // Supporters 
    // Volunteers 
    // Officers 

    if ( v_file_type.equals("Members_file") 
      || v_file_type.equals("Supporters_file") 
      || v_file_type.equals("Volunteers_file") 
      || v_file_type.equals("Officers_file")   )
    {

        try {
          String RunFile = fileName;
          //String RunFile = "SRGP_MembersAll_20141111-651.csv";
          String RunExe = "/SRGP/python/SRGP/csv_fixer.py";

          Runtime rt = Runtime.getRuntime();
          Process pr = rt.exec(RunExe + " " + RunFile, null, new File(RunDir));
 
          int exitVal = pr.waitFor();

          BufferedReader input = new BufferedReader(new InputStreamReader(pr.getInputStream()));
          String line="";
 
          while((line=input.readLine()) != null) {
            System.out.println(line);
          }   
 
          System.out.println("Exited with error code "+exitVal);
 
        } catch(Exception e) {
          System.out.println(e.toString());
          e.printStackTrace();
        }   

        long serialVersionUID = 1L;
        int BUFSIZE = 4096;
    
        String NB_File = widget.add_NB_to_filename( fileName );
        String NB_File_and_path = RunDir + NB_File;
    
        File file = new File(NB_File_and_path);
        int length   = 0;
        ServletOutputStream outStream = response.getOutputStream();
        ServletContext context  = getServletConfig().getServletContext();
        String mimetype = context.getMimeType(NB_File_and_path);
    
        // sets response content type
        if (mimetype == null) {
            mimetype = "application/octet-stream";
        }   
        response.setContentType(mimetype);
        response.setContentLength((int)file.length());
        String vfileName = (new File(NB_File_and_path)).getName();
    
        // sets HTTP header
        response.setHeader("Content-Disposition", "attachment; filename=\"" + vfileName + "\"");
    
        byte[] byteBuffer = new byte[BUFSIZE];
        DataInputStream in = new DataInputStream(new FileInputStream(file));
    
        // reads the file's bytes and writes them to the response stream
        while ((in != null) && ((length = in.read(byteBuffer)) != -1))
        {   
            outStream.write(byteBuffer,0,length);
        }   
    
        in.close();
        outStream.close();

      // End of the CIVI transform process and their download
      // End of the CIVI transform process and their download
      }






    } catch (FileNotFoundException fne) {
        LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}", 
                new Object[]{fne.getMessage()});
    } finally {
        if (out != null) {
            out.close();
        }
        if (filecontent != null) {
            filecontent.close();
        }
    }
}

private String getFileName(final Part part, final String p_file_type) {
    final String partHeader = part.getHeader("Content-Disposition");
    final String OldFileName;
    String NewFileName = "";
    //
    LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
    for (String content : part.getHeader("Content-Disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
          OldFileName = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
          //
	  switch (p_file_type){
            case "NB_file":
	      NewFileName = OldFileName;
	      break;
	    case "Members_file":
              NewFileName = widget.sort_file_name( OldFileName, "SRGP_MembersAll" );
	      break;
	    case "Supporters_file":
	      NewFileName = widget.sort_file_name( OldFileName, "SRGP_Supporters" );
	      break;
	    case "Volunteers_file":
	      NewFileName = widget.sort_file_name( OldFileName, "SRGP_Volunteers" );
	      break;
	    case "Officers_file":
	      NewFileName = widget.sort_file_name( OldFileName, "SRGP_Officers" );
	      break;
	  }
	    
	  return NewFileName;
        }
        //if (content.trim().startsWith("filename")) {
        //    return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
        //}
    }
    return null;
}
}
