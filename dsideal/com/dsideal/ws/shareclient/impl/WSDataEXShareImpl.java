
/**
 * Please modify this class to meet your needs
 * This class is not complete
 */

package com.dsideal.ws.shareclient.impl;

import java.util.logging.Logger;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 2.7.4
 * 2013-05-15T09:54:20.031+08:00
 * Generated source version: 2.7.4
 * 
 */

@javax.jws.WebService(
                      serviceName = "WS_DataEX_ShareImplService",
                      portName = "WS_DataEX_ShareImplPort",
                      targetNamespace = "http://dataEX_share",
                      wsdlLocation = "http://localhost:8840/DataEX_share/webservice/dataEX_share?wsdl",
                      endpointInterface = "com.dsideal.ws.shareclient.impl.WSDataEXShare")
                      
public class WSDataEXShareImpl implements WSDataEXShare {

    private static final Logger LOG = Logger.getLogger(WSDataEXShareImpl.class.getName());

    /* (non-Javadoc)
     * @see com.dsideal.ws.shareclient.impl.WSDataEXShare#queryDataDiff(com.dsideal.ws.shareclient.impl.DataEXQueryRequest  queryRequest )*
     */
    public com.dsideal.ws.shareclient.impl.DataEXQueryResult queryDataDiff(com.dsideal.ws.shareclient.impl.DataEXQueryRequest queryRequest) { 
        LOG.info("Executing operation queryDataDiff");
        System.out.println(queryRequest);
        try {
            com.dsideal.ws.shareclient.impl.DataEXQueryResult _return = null;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see com.dsideal.ws.shareclient.impl.WSDataEXShare#login(java.lang.String  userName ,)java.lang.String  password ,)java.lang.String  loginTime )*
     */
    public java.lang.String login(java.lang.String userName,java.lang.String password,java.lang.String loginTime) { 
        LOG.info("Executing operation login");
        System.out.println(userName);
        System.out.println(password);
        System.out.println(loginTime);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see com.dsideal.ws.shareclient.impl.WSDataEXShare#queryDataNO(com.dsideal.ws.shareclient.impl.DataEXQueryRequest  queryRequest )*
     */
    public com.dsideal.ws.shareclient.impl.DataEXPageResult queryDataNO(com.dsideal.ws.shareclient.impl.DataEXQueryRequest queryRequest) { 
        LOG.info("Executing operation queryDataNO");
        System.out.println(queryRequest);
        try {
            com.dsideal.ws.shareclient.impl.DataEXPageResult _return = null;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see com.dsideal.ws.shareclient.impl.WSDataEXShare#queryData(com.dsideal.ws.shareclient.impl.DataEXQueryRequest  queryRequest ,)int  arg1 )*
     */
    public com.dsideal.ws.shareclient.impl.DataEXQueryResult queryData(com.dsideal.ws.shareclient.impl.DataEXQueryRequest queryRequest,int arg1) { 
        LOG.info("Executing operation queryData");
        System.out.println(queryRequest);
        System.out.println(arg1);
        try {
            com.dsideal.ws.shareclient.impl.DataEXQueryResult _return = null;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see com.dsideal.ws.shareclient.impl.WSDataEXShare#queryDataConfirm(com.dsideal.ws.shareclient.impl.DataEXConfirmRequest  queryRequest ,)java.util.List<java.lang.String>  arg1 )*
     */
    public void queryDataConfirm(com.dsideal.ws.shareclient.impl.DataEXConfirmRequest queryRequest,java.util.List<java.lang.String> arg1) { 
        LOG.info("Executing operation queryDataConfirm");
        System.out.println(queryRequest);
        System.out.println(arg1);
        try {
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

}
