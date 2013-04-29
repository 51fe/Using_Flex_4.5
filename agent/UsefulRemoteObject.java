package myROPackage;

import flex.messaging.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UsefulRemoteObject {
    
    public HttpServletRequest request;
    public FlexSession session;
    
    public UsefulRemoteObject() {
        request = FlexContext.getHttpRequest();            
        session = FlexContext.getFlexSession();    
    }
    
    public String getSessionId() throws Exception {
        String s = new String();
        s = (String) session.getId();            
        return s;
    }

    public String getHeader(String h) throws Exception {
        String s = new String();
        s = (String) request.getHeader(h);            
        return h + "=" + s;
    }
}