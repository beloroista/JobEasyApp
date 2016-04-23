/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

// not finished yet

import java.io.Serializable;
import org.json.JSONObject;


public class userBean extends Object implements Serializable {

   
    private JSONObject profile=null;
   



   
    public void setprofile(JSONObject value) {this.profile = value;}
    
    public JSONObject getprofile() {return profile;}
   
}
