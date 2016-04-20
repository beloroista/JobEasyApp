/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


import java.io.BufferedReader;  
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;  
import java.net.URL;  
import org.json.simple.parser.JSONParser;








/**
 *
 * @author zhangqian
 */
@WebServlet(urlPatterns = {"/GetToken"})
public class GetToken extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out1 = response.getWriter();
        String code = request.getParameter("code");
        String state = request.getParameter("state");


      
            try{                
                String query = "grant_type=authorization_code&code="+code+"&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2FJobEasyApp%2FGetToken&client_id=77a9ivlgasumg4&client_secret=fR5zPUnYqkAHv5TP";
                String url = "https://www.linkedin.com/uas/oauth2/accessToken";
                String charset = "UTF-8"; 
                
                HttpURLConnection  connection = (HttpURLConnection)new URL(url).openConnection();
                connection.setDoOutput(true); // Triggers POST.
                connection.setRequestProperty("Accept-Charset", "UTF-8");
                connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=" + charset);
                
                try (OutputStream output = connection.getOutputStream()) {
                output.write(query.getBytes(charset));
                }


                InputStream is = connection.getInputStream();
                BufferedReader rd = new BufferedReader(new InputStreamReader(is));
                String line="";
                String res="";
                while((line = rd.readLine()) != null) {
                    res=res+line;       ;
                }

                JSONObject jo=new JSONObject(res);
                String fintoken= (String)jo.get("access_token");
                

             String profile=getProfile("https://api.linkedin.com/v1/people/~:(id,public-profile-url,num-connections,picture-url)?format=json", fintoken);
             JSONParser parser = new JSONParser();
            JSONObject jofile = (JSONObject) parser.parse(profile);
             //JSONObject jofile=new JSONObject(profile);
         String pfurl=jofile.getString("publicProfileUrl");
         String uu=getSkill(pfurl);
         System.out.println(uu);
         JSONArray skills=new JSONArray(getSkill(pfurl));
         
             

                
                
                

        } 
        catch(Exception e){
            System.out.println("error");
        }
            out1.close();
  }
    public static String getProfile(String url,String token) throws MalformedURLException, IOException{
        
        URLConnection connection = new URL(url).openConnection();
        connection.setRequestProperty("Accept-Charset", "UTF-8");
        connection.setRequestProperty("Connection", "Keep-Alive");
        connection.setRequestProperty("Authorization", "Bearer "+token);
        InputStream inputStream = connection.getInputStream();  
      
        Reader reader = new InputStreamReader(inputStream, "UTF-8");  
        BufferedReader bufferedReader = new BufferedReader(reader);  
        String str = null;  
        StringBuffer sb = new StringBuffer();  
        while ((str = bufferedReader.readLine()) != null) {  
            sb.append(str);  
        }  
        //System.out.println(sb.toString());
        reader.close(); 
        String x=sb.toString();
        return x; 
    }
public  static String getSkill(String pfurl) throws Exception {  
        String command = "C:\\Users\\Chi\\Documents\\GitHub\\JobEasyApp\\python"+pfurl;
        Process p = Runtime.getRuntime().exec(command);
        BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String ret = in.readLine();
        return ret; 
    }

    public String getJsonString(String urlPath) throws Exception {  
        URL url = new URL(urlPath);  
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();  
        connection.connect();  
        InputStream inputStream = connection.getInputStream();  
      
        Reader reader = new InputStreamReader(inputStream, "UTF-8");  
        BufferedReader bufferedReader = new BufferedReader(reader);  
        String str = null;  
        StringBuffer sb = new StringBuffer();  
        while ((str = bufferedReader.readLine()) != null) {  
            sb.append(str);  
        }  
        //System.out.println(sb.toString());
        reader.close();  
        connection.disconnect();  
        return sb.toString();  
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
