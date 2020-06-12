package com.hyundaicommercial.cdf.blockchain;

import static java.lang.String.format;

import org.apache.log4j.Logger;

import com.hyundaicommercial.cdf.blockchain.util.Helper;

public class Interface
{
    final static Logger logger = Logger.getLogger(Interface.class);
    private Helper helper = null;

    public Interface() throws Exception {

    // Load configuration from file
        logger.info("Load configuration file: config/config.yaml");
        this.helper = new Helper("config/config.yaml");
    }

    /**
     * 매출 채권 생성
     * @param input stringified JSON object
     * @return output
     */
    public String ANCTS_RECEIVABLE_CREATE(String input) {
        
        logger.info(format("Account Receivable - method: create, data: %s\n", input));
        return helper.invokeChaincode("acntsreceivable", "ANCTS_RECEIVABLE_CREATE", input);
    }

    /**
     * 매출 채권 조회
     * @param input stringified JSON object
     * @return output
     */
    public String ANCTS_RECEIVABLE_VIEW(String input) {

        logger.info(format("Account Receivable - method: view, data: %s\n", input));
        return helper.queryChaincode("acntsreceivable", "ANCTS_RECEIVABLE_VIEW", input);
    }

    /**
     * 매출 채권 취소
     * @param input stringified JSON object
     * @return output
     */
    public String ANCTS_RECEIVABLE_CANCEL(String input) {

        logger.info(format("Account Receivable - method: cancel, data: %s\n", input));
        return helper.invokeChaincode("acntsreceivable", "ANCTS_RECEIVABLE_CANCEL", input);
    }

    /**
     * 매출 채권 만기일 변경
     * @param input stringified JSON object
     * @return output
     */
    public String ANCTS_RECEIVABLE_EXPIRE_CHANGE(String input) {

        logger.info(format("Account Receivable - method: expire_change, data: %s\n", input));
        return helper.invokeChaincode("acntsreceivable", "ANCTS_RECEIVABLE_EXPIRE_CHANGE", input);
    }

    /**
     * 매출 채권 연체 처리
     * @param input stringified JSON object
     * @return output
     */
    public String ANCTS_RECEIVABLE_OVERDUE(String input) {

        logger.info(format("Account Receivable - method: overdue, data: %s\n", input));
        return helper.invokeChaincode("acntsreceivable", "ANCTS_RECEIVABLE_OVERDUE", input);
    }

    /**
     * 매출 채권 상태 업데이트
     * @param input stringified JSON object
     * @return output
     */
    public String ANCTS_RECEIVABLE_CREATE_STATUS(String input) {

        logger.info(format("Account Receivable - method: create_status, data: %s\n", input));
        return helper.invokeChaincode("acntsreceivable", "ANCTS_RECEIVABLE_CREATE_STATUS", input);
    }

    /**
     * 매출 채권 부도처리
     * @param input stringified JSON object
     * @return output
     */
    public String ANCTS_RECEIVABLE_BANKRUPT(String input) {

        logger.info(format("Account Receivable - method: bankrupt, data: %s\n", input));
        return helper.invokeChaincode("acntsreceivable", "ANCTS_RECEIVABLE_BANKRUPT", input);
    }

    /**
     * 대리점 최초 한도 설정
     * @param input stringified JSON object
     * @return output
     */
    public String BYR_LIMIT_SET(String input) {
        
        logger.info(format("Buyer Limit - method: set, data: %s\n", input));
        return helper.invokeChaincode("byrlimit", "BYR_LIMIT_SET", input);
    }

    /**
     * 대리점 한도 상태 업데이트
     * @param input stringified JSON object
     * @return output
     */
    public String BYR_LIMIT_STATUS_UPDATE(String input) {
        
        logger.info(format("Buyer Limit - method: status_update, data: %s\n", input));
        return helper.invokeChaincode("byrlimit", "BYR_LIMIT_STATUS_UPDATE", input);
    }

    /**
     * 대리점 한도 감액/증액
     * @param input stringified JSON object
     * @return output
     */
    public String BYR_LIMIT_CUTBACK_INCREASE(String input) {
        
        logger.info(format("Buyer Limit - method: cutback_increase, data: %s\n", input));
        return helper.invokeChaincode("byrlimit", "BYR_LIMIT_CUTBACK_INCREASE", input);
    }

    /**
     * 대리점 한도 감액/증액 취소
     * @param input stringified JSON object
     * @return output
     */
    public String BYR_LIMIT_CUTBACK_INCREASE_CANCEL(String input) {
        
        logger.info(format("Buyer Limit - method: cutback_increase_cancel, data: %s\n", input));
        return helper.invokeChaincode("byrlimit", "BYR_LIMIT_CUTBACK_INCREASE_CANCLE", input);
    }

    /**
     * 대리점 한도 이관
     * @param input stringified JSON object
     * @return output
     */
    public String BYR_LIMIT_TRANSFER(String input) {
        
        logger.info(format("Buyer Limit - method: transfer, data: %s\n", input));
        return helper.invokeChaincode("byrlimit", "BYR_LIMIT_TRANSFER", input);
    }

    /**
     * 대리점 한도 조회
     * @param input stringified JSON object
     * @return output
     */
    public String BYR_LIMIT_VIEW(String input) {

        logger.info(format("Buyer Limit - method: view, data: %s\n", input));
        return helper.queryChaincode("byrlimit", "BYR_LIMIT_VIEW", input);
    }

    /**
     * 대리점 폐업
     * @param input stringified JSON object
     * @return output
     */
    public String BYR_CLOSE_SHUTDOWN(String input) {
        
        logger.info(format("Buyer Limit - method: close_shutdown, data: %s\n", input));
        return helper.invokeChaincode("byrlimit", "BYR_CLOSE_SHUTDOWN", input);
    }


    /**
     * 기타 수금 생성
     * @param input stringified JSON object
     * @return output
     */
    public String EXTRA_COLLECTION_CREATE(String input) {
        
        logger.info(format("Extra Collection - method: create, data: %s\n", input));
        return helper.invokeChaincode("extracollection", "EXTRA_COLLECTION_CREATE", input);
    }

    /**
     * 기타 수금 상태 업데이트
     * @param input stringified JSON object
     * @return output
     */
    public String EXTRA_COLLECTION_STATUS_UPDATE(String input) {
        
        logger.info(format("Extra Collection - method: status_update, data: %s\n", input));
        return helper.invokeChaincode("extracollection", "EXTRA_COLLECTION_STATUS_UPDATE", input);
    }

    /**
     * 기타 수금 조회
     * @param input stringified JSON object
     * @return output
     */
    public String EXTRA_COLLECTION_VIEW(String input) {

        logger.info(format("Extra Collection - method: view, data: %s\n", input));
        return helper.queryChaincode("extracollection", "EXTRA_COLLECTION_VIEW", input);
    }

    /**
     * 상계 수금 생성
     * @param input stringified JSON object
     * @return output
     */
    public String SETOFF_COLLECTION_CREATE(String input) {
        
        logger.info(format("Setoff Collection - method: create, data: %s\n", input));
        return helper.invokeChaincode("setoffcollection", "SETOFF_COLLECTION_CREATE", input);
    }

    /**
     * 상계 수금 상태 업데이트
     * @param input stringified JSON object
     * @return output
     */
    public String SETOFF_COLLECTION_STATUS_UPDATE(String input) {
        
        logger.info(format("Setoff Collection - method: status_update, data: %s\n", input));
        return helper.invokeChaincode("setoffcollection", "SETOFF_COLLECTION_STATUS_UPDATE", input);
    }

    /**
     * 상계 수금 조회
     * @param input stringified JSON object
     * @return output
     */
    public String SETOFF_COLLECTION_VIEW(String input) {

        logger.info(format("Setoff Collection - method: view, data: %s\n", input));
        return helper.queryChaincode("setoffcollection", "SETOFF_COLLECTION_VIEW", input);
    }
}