/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

// not finished yet

import java.io.Serializable;
import java.util.HashMap;


public class userBean extends Object implements Serializable {

    private HashMap<String,Integer> cart=null;
    private boolean hasdb=false; // indicating the existence of product database
    public String test="tessst";

    public HashMap getcart() {return cart;}
    public boolean getdb() {return hasdb;}
    public void setcart(HashMap value) {this.cart = value;}
    public void setdb() {this.hasdb = true;}

}
