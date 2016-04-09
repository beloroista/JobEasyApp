/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;


@WebServlet(urlPatterns = {"/GetCities"})
public class GetCities extends HttpServlet {


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
        PrintWriter out = response.getWriter();
        char[] cbuf = new char[200];
        int amtread;
        try {
        JSONObject jo;
        BufferedReader in = request.getReader();       
        amtread = in.read(cbuf);
        cbuf[amtread]='\0';
        String invalue = new String(cbuf,0,amtread);
        
        try{
            jo=new JSONObject(invalue);

            String state= jo.getString("state");
            String URL="http://api.sba.gov/geodata/city_links_for_state_of/"+state+".json";                       
            //System.out.println("123");
            JSONArray raw=new JSONArray(getJsonString(URL));
            JSONArray cities = new JSONArray(); 
              
            for (int i = 0; i < raw.length(); i++) {
                JSONObject child = raw.getJSONObject(i);                
                cities.put(child.getString("name"));
            }
            //System.out.println("~~~~~~~~~~~"+cities.length()+"!!!!!!!!");
            out.println(cities.toString()); 
                    
            }
        catch(Exception e)
           {e.printStackTrace();
            System.out.println("error");
           }
        finally { 
            out.close();
        }
        } 
        
        finally {
            out.close();
        }

       

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
