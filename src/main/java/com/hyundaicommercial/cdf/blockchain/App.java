package com.hyundaicommercial.cdf.blockchain;

import org.json.JSONObject;
//import java.util.logging.Logger;

import org.apache.log4j.Logger;
import com.hyundaicommercial.cdf.blockchain.Interface;

import static java.lang.String.format;

public class App {
    private static Interface bcInterface = null;
    //private static Logger logger = Logger.getGlobal();
    final static Logger logger = Logger.getLogger(App.class);
    public static void main(String... args) {

        /*
        JSONObject a = new JSONObject();
        String b = "{\"a\":\"1\",\"b\":2}";
        a.put("data", b);
        logger.info(a.toString());
        String d = "[{\"c\":3}, {\"d\":\"4\"}]";
        a.put("array", d);
        logger.info(a.toString());
        */        
        
        try {
            bcInterface = new Interface();
        } catch (Exception e) {
            e.printStackTrace();
        }

        
        // 대리점1 한도 설정
        // 대리점1 한도 확인
        // 대리점2 한도 설정
        // 대리점2 한도 확인
        BYRSET("1");
        BYRVIEW("1");
        BYRSET("2");
        BYRVIEW("2");

        // 매출채권 1 생성 (for 대리점1)
        // 매출채권 1 확인
        // 매출채권 2 생성 (for 대리점2)
        // 매출채권 2 확인
        String rcv1 = ARCREATE("1");
        ARVIEW(rcv1);
        String rcv2 = ARCREATE("2");
        ARVIEW(rcv2);
    }

    private static String ARCREATE(String owner) {
    
        JSONObject input = new JSONObject();
        input.put("TAXBILL_NO", "1");
        input.put("GROUP_TYPE", "1");
        input.put("ISSUER_NO", owner);
        input.put("OWNER_NO", owner);
        input.put("PAYMENT_DATE", "4");
        input.put("EXPIRATION_DATE", "5");
        input.put("AMOUNT", 100);
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.ANCTS_RECEIVABLE_CREATE(input.toString());
        logger.info(format("Output: %s\n", output.toString()));
        JSONObject outputJson = new JSONObject(output);
        String result = outputJson.get("result").toString();
        JSONObject resultJson = new JSONObject(result);

        return resultJson.get("ACNTS_NO").toString();

        /*
            Dec 05, 2018 3:31:48 PM com.hyundaicommercial.cdf.blockchain.App ARCREATE
            INFO: Output: {"ACNTS_NO":"CDFRCV5","ISSUE_DATE":"20181205","STATUS":"1","ERROR_MSG":"Succeed to set value for key"}
        */
    }

    private static void ARVIEW(String id) {

        JSONObject input = new JSONObject();
        input.put("BUSINESS_TYPE", "1");
        input.put("BUSINESS_NO", "1");
        input.put("ACNTS_NO", id);
        input.put("GROUP_TYPE", "3");
        input.put("ACNTS_STATUS", "4");
        input.put("LIMIT", 1);
        input.put("CURRENT_NUM", 10000);
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.ANCTS_RECEIVABLE_VIEW(input.toString());
        logger.info(format("Output: %s\n", output.toString()));

        /*
            Dec 05, 2018 4:10:11 PM com.hyundaicommercial.cdf.blockchain.App ARVIEW
            INFO: Output: {"DATA":[{"ACNTS_NO":"CDFRCV12","GROUP_TYPE":"1","ISSUER_NO":"2","OWNER_NO":"2","ISSUE_DATE":"20181205","EXPIRATION_DATE":"5","PAYMENT_DATE":"4","AMOUNT":100,"COLLECT_AMOUNT":0,"ACNTS_STATUS":"1","TAXBILL_NO":"1"}],"STATUS":"1","ERROR_MSG":"Succeed to get value for key"}
        */
    }

    private static void ARCANCEL() {

        JSONObject input = new JSONObject();
        input.put("ACNTS_NO", "CDFRCV1");
        input.put("ACNTS_STATUS", "1");
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.ANCTS_RECEIVABLE_CANCEL(input.toString());
        logger.info(format("Output: %s\n", output));
    }

    private static void ARCHANGE() {

        JSONObject input = new JSONObject();
        input.put("ACNTS_NO", "CDFRCV1");
        input.put("EXPIRATION_DATE", "6");
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.ANCTS_RECEIVABLE_EXPIRE_CHANGE(input.toString());
        logger.info(format("Output: %s\n", output));
    }

    private static void AROVERDUE() {

        JSONObject input = new JSONObject();
        input.put("ACNTS_NO", "CDFRCV1");
        input.put("ACNTS_STATUS", "4");
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.ANCTS_RECEIVABLE_OVERDUE(input.toString());
        logger.info(format("Output: %s\n", output));
    }

    private static void ARSTATUS() {

        JSONObject input = new JSONObject();
        input.put("ACNTS_NO", "CDFRCV1");
        input.put("ACNTS_STATUS", "2");
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.ANCTS_RECEIVABLE_CREATE_STATUS(input.toString());
        logger.info(format("Output: %s\n", output));
    }

    private static void ARBANKRUPT() {

        JSONObject input = new JSONObject();
        input.put("TAXBILL_NO", "1");
        input.put("TAXBILL_AMOUNT", "2");
        input.put("BUSINESS_NO", "1");
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.ANCTS_RECEIVABLE_CANCEL(input.toString());
        logger.info(format("Output: %s\n", output));
    }

    private static void BYRSET(String id) {

        JSONObject input = new JSONObject();
        input.put("BYR_LIMIT_NO", id);
        input.put("LIMIT_CONTRACT_NO", id + "2");
        input.put("AMOUNT", 10000);
        input.put("REMAINING_LIMIT", 10000);
        input.put("OVER_LIMIT", 10000);
        input.put("GUAR_AMOUNT", 10000);
        input.put("SET_AMOUNT", 0);
        input.put("SET_DATE", "8");
        input.put("OFF_DATE", "9");
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.BYR_LIMIT_SET(input.toString());
        logger.info(format("Output: %s\n", output.toString()));
        /*
            Dec 05, 2018 3:31:46 PM com.hyundaicommercial.cdf.blockchain.App BYRSET
            INFO: Output: {"result":{"STATUS":"2","ERROR_MSG":"Buyer(Agency) already exists."}}
        */
    }

    private static void BYRVIEW(String id) {

        JSONObject input = new JSONObject();
        input.put("BYR_LIMIT_NO", id);
        input.put("BYR_STATUS", "");
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.BYR_LIMIT_VIEW(input.toString());
        logger.info(format("Output: %s\n", output));

        /*
            Dec 05, 2018 3:31:46 PM com.hyundaicommercial.cdf.blockchain.App BYRVIEW
            INFO: Output: {"LIMIT_CONTRACT_NO":"12","AMOUNT":10000,"REMAINING_LIMIT":10000,"OVER_LIMIT":10000,"GUAR_AMOUNT":10000,"GUAR_OVER_AMOUNT":0,"SET_AMOUNT":0,"BYR_STATUS":"1","SET_DATE":"8","OFF_DATE":"9","BYR_LIMIT_DATE":"20181205","PRE_BYR_LIMIT_INFO":null}
        */
    }

    private static void BYRUPDATE() {

        JSONObject input = new JSONObject();
        input.put("BYR_LIMIT_NO", "1");
        input.put("BYR_STATUS", "2");
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.BYR_LIMIT_STATUS_UPDATE(input.toString());
        logger.info(format("Output: %s\n", output));
    }

    private static void BYRMANI() {

        JSONObject input = new JSONObject();
        input.put("TYPE", "1");
        input.put("BYR_LIMIT_NO", "1");
        input.put("AMOUNT", 100);
        input.put("OVER_LIMIT", 105);
        input.put("REMAINING_LIMIT", 104);
        input.put("GUAR_OVER_AMOUNT", 106);
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.BYR_LIMIT_CUTBACK_INCREASE(input.toString());
        logger.info(format("Output: %s\n", output));
    }

    private static void BYRMANICANCEL() {

        JSONObject input = new JSONObject();
        input.put("TYPE", "1");
        input.put("BYR_LIMIT_NO", "1");
        input.put("AMOUNT", 100);
        input.put("OVER_LIMIT", 5);
        input.put("REMAINING_LIMIT", 4);
        input.put("GUAR_OVER_AMOUNT", 6);
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.BYR_LIMIT_VIEW(input.toString());
        logger.info(format("Output: %s\n", output));
    }

    private static void BYRTRANSFER() {

        JSONObject input = new JSONObject();
        input.put("TYPE", "1");
        input.put("FROM", "1");
        input.put("TO", "2");
        logger.info(format("Input: %s\n", input.toString()));
        String output = bcInterface.BYR_LIMIT_STATUS_UPDATE(input.toString());
        logger.info(format("Output: %s\n", output));
    }


}