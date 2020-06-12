//** 환경 설정시 주의사항 ***************************************************************    //
//                                                                                      
// . 인증기관 LDAP 정보 모음 은 LDAP 에서 인증서를 가져올 때 반드시 사용된다.                                         
//                                                                                      
//**************************************************************************************//

//** 기본정보 설정            ************************************************************//

// == 인증기관 관련 정보 모음     ================================= //
var CA_LDAP_INFO = "KISA:dirsys.rootca.or.kr:389|KICA:ldap.signgate.com:389|SignKorea:dir.signkorea.com:389|Yessign:ds.yessign.or.kr:389|CrossCert:dir.crosscert.com:389|TradeSign:ldap.tradesign.net:389|NCASign:ds.nca.or.kr:389|";

// == 인증서 정책  관련        ===================================== //
// -- 법인 상호연동용 OID 모음
var FIRST_COMP_CERT_POLICIES = "1 2 410 200012 1 1 3:범용기업|1 2 410 200004 5 1 1 7:범용기업|1 2 410 200005 1 1 5:범용기업|1 2 410 200004 5 2 1 1:범용기업|1 2 410 200004 5 4 1 2:범용기업|1 2 410 200004 5 3 1 1:범용기관||1 2 410 200004 5 3 1 2:범용기업|";
// -- 개인 상호연동용 OID 모음
var FIRST_INDI_CERT_POLICIES = "1 2 410 200012 1 1 1:범용개인|1 2 410 200004 5 1 1 5:범용개인|1 2 410 200005 1 1 1:범용개인|1 2 410 200004 5 2 1 2:범용개인|1 2 410 200004 5 4 1 1:범용개인|1 2 410 200004 5 3 1 9:범용개인|";
//-- 은행연동용 OID 모음
var BANK_COMP_CERT_POLICIES = "1 2 410 200005 1 1 2:은행법인|";
//-- 은행연동용 OID 모음
var BANK_INDI_CERT_POLICIES = "1 2 410 200005 1 1 4:은행개인|1 2 410 200004 5 4 1 101:은행개인|1 2 410 200004 5 2 1 7 1:은행개인|1 2 410 200012 1 1 101:은행개인|1 2 410 200005 1 1 2:법인개인|";
// -- 모든 인증서 허용
var ALL_CERT_POLICIES = ""; 
// ============================================================== //

// == 인증서 저장매체 관련   ===================================== //
var HARD_DISK       = 0;    
var REMOVABLE_DISK  = 1;    
var IC_CARD         = 2;
var PKCS11          = 3;
// ============================================================== //

// == 인증서 Type 관련       ===================================== //
var CERT_TYPE_SIGN      = 1;    
var CERT_TYPE_KM        = 2;    
var DATA_TYPE_PEM       = 0;
var DATA_TYPE_BASE64    = 1;
var DATA_TYPE_FILE      = 1;
// ============================================================== //

// == HASH 알고리즘     ========================================= //
var HASH_ID_MD5             = 1;
var HASH_ID_RIPEMD160       = 2;        
var HASH_ID_SHA1            = 3;        // 기본적으로 사용함.
var HASH_ID_HAS160          = 4;
var HASH_ID_SHA256          = 5;
var HASH_ID_SHA384          = 6;
var HASH_ID_SHA512          = 7;
// ============================================================== //

// == 대칭키 알고리즘 & 모드 ===================================== //
var SYMMETRIC_ID_DES        = 1;
var SYMMETRIC_ID_3DES       = 2;        // 기본적으로 사용함.
var SYMMETRIC_ID_SEED       = 3;
var SYMMETRIC_MODE_ECB      = 1;        
var SYMMETRIC_MODE_CBC      = 2;        // 기본적으로 사용함.
var SYMMETRIC_MODE_CFB      = 3;        
var SYMMETRIC_MODE_OFB      = 4;        
// ============================================================== //

// == 인증서 정보 관련 설정값     ================================= //
var CERT_ATTR_VERSION                       = 1;
var CERT_ATTR_SERIAL_NUBMER                 = 2;
var CERT_ATTR_SIGNATURE_ALGO_ID             = 3;
var CERT_ATTR_ISSUER_DN                     = 4;
var CERT_ATTR_SUBJECT_DN                    = 5;
var CERT_ATTR_SUBJECT_PUBLICKEY_ALGO_ID     = 6;
var CERT_ATTR_VALID_FROM                    = 7;
var CERT_ATTR_VALID_TO                      = 8;
var CERT_ATTR_PUBLIC_KEY                    = 9;
var CERT_ATTR_SIGNATURE                     = 10;
var CERT_ATTR_KEY_USAGE                     = 11;
var CERT_ATTR_AUTORITY_KEY_ID               = 12;
var CERT_ATTR_SUBJECT_KEY_ID                = 13;
var CERT_ATTR_EXT_KEY_USAGE                 = 14;
var CERT_ATTR_SUBJECT_ALT_NAME              = 15;
var CERT_ATTR_BASIC_CONSTRAINT              = 16;
var CERT_ATTR_POLICY                        = 17;
var CERT_ATTR_CRLDP                         = 18;
var CERT_ATTR_AIA                           = 19;
var CERT_ATTR_VALID                         = 20;
// ============================================================== //

// == 인증서 Type 관련       ===================================== //
var DATA_TYPE_CACERT        = 1;    
var DATA_TYPE_SIGN_CERT     = 2;    
var DATA_TYPE_KM_CERT       = 3;
var DATA_TYPE_CRL           = 4;
var DATA_TYPE_ARL           = 5;
// ============================================================== //

//**************************************************************************************//

//** 환경 설정              ************************************************************//

// 인증서 선택시 기본 매체.
var STORAGE_TYPE = HARD_DISK;

// 보고자하는 인증서 정책 모음. 
var POLICIES =ALL_CERT_POLICIES;

// 서명시 필요한 Config 조절.
// 서명 생성시 인증서 포함 여부, 0 : 서명자 인증서만 포함.(기본), 1 : 서명자 & CA 인증서 포함.
var INC_CERT_SIGN       = 0;
// 서명 생성시 CRL 인증서 포함 여부, 0 : 미포함 (기본), 1 : 포함, 
var INC_CRL_SIGN        = 0;
// 서명 생성시 서명시간 포함 여부, 0 : 미포함, 1 : 포함(기본)
var INC_SIGN_TIME_SIGN  = 1;
// 서명 생성시 원본데이타 포함 여부 , 0 : 미포함, 1 : 포함(기본)
var INC_CONTENT_SIGN    = 1;

// 인증서 검증에 필요한 Config 조절
// 사용자 인증서 검증 조건, 0 : CRL 체크 안함. 1 : 현재시간기준으로 유효한 CRL 사용(기본), 2 : 현재 시간기준으로 유효한 CRL 못 구할 시 이전 CRL 사용.
var USING_CRL_CHECK     = 1;
// CA 인증서 검증 조건, 0 : ARL 체크 안함. 1 : 현재시간기준으로 유효한 ARL 사용(기본), 2 : 현재 시간기준으로 유효한 CRL 못 구할 시 이전 ARL 사용.
var USING_ARL_CHECK     = 1;

var CTL_INFO = "";
                                        
// Envelop 테스트시 사용하는 상대방 인증서
var pemSignCert, pemSignKey, pemKMCert, pemKMKey;
pemSignCert = "-----BEGIN CERTIFICATE-----MIIE8jCCA9qgAwIBAgIEWWxEGzANBgkqhkiG9w0BAQUFADBOMQswCQYDVQQGEwJLUjESMBAGA1UECgwJVHJhZGVTaWduMRUwEwYDVQQLDAxBY2NyZWRpdGVkQ0ExFDASBgNVBAMMC1RyYWRlU2lnbkNBMB4XDTA4MDcwMjA1MTgwNVoXDTA5MDcwNjA0MTE0N1owYTELMAkGA1UEBhMCS1IxEjAQBgNVBAoMCVRyYWRlU2lnbjETMBEGA1UECwwKTGljZW5zZWRDQTEOMAwGA1UECwwFS1RORVQxGTAXBgNVBAMMEO2FjOyKpO2KuChLVE5FVCkwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMEbr8wJTsZFJqJXLYKCcyx8Ya3kLQa2YqsY61z8fi9IXbzg6BTWPLydNTUHKGX75YOQKHc+1YZaQniH2+sj4kM2DEKSA4sVJVgyq61UFpOzfCyxu4w1qQ3o4M/KxqdieJxm8NW8rTJyoUJG2AEKUAIX7PsZqa4wssb1+oHKgPn/AgMBAAGjggJHMIICQzCBjwYDVR0jBIGHMIGEgBQrdgKuglx97oGRnvWJW7nimVupr6FopGYwZDELMAkGA1UEBhMCS1IxDTALBgNVBAoMBEtJU0ExLjAsBgNVBAsMJUtvcmVhIENlcnRpZmljYXRpb24gQXV0aG9yaXR5IENlbnRyYWwxFjAUBgNVBAMMDUtJU0EgUm9vdENBIDGCAidkMB0GA1UdDgQWBBRJ9wjEmrsxnaA3G/1BOFiqs7IO9zAOBgNVHQ8BAf8EBAMCBsAwegYDVR0gAQH/BHAwbjBsBgkqgxqMmkwBAQMwXzAuBggrBgEFBQcCAjAiHiDHdAAgx3jJncEcspQAIKz1x3jHeMmdwRwAIMeFssiy5DAtBggrBgEFBQcCARYhaHR0cDovL3d3dy50cmFkZXNpZ24ubmV0L2Nwcy5odG1sMFgGA1UdEQRRME+gTQYJKoMajJpECgEBoEAwPgwJ7YWM7Iqk7Yq4MDEwLwYKKoMajJpECgEBATAhMAcGBSsOAwIaoBYEFL+g21EvDMQYxeGkc6eveGxDapdAMGUGA1UdHwReMFwwWqBYoFaGVGxkYXA6Ly9sZGFwLnRyYWRlc2lnbi5uZXQ6Mzg5L2NuPWNybDFkcDEzNCxvdT1jcmxkcCxvdT1BY2NyZWRpdGVkQ0Esbz1UcmFkZVNpZ24sYz1LUjBDBggrBgEFBQcBAQQ3MDUwMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnRyYWRlc2lnbi5uZXQ6ODAvT0NTUFNlcnZlcjANBgkqhkiG9w0BAQUFAAOCAQEAmPgXNeWtNjFJlXiTncdIUo2dktvX+HOS6Pa0WTuGgosqd+qaTXO6tqvXBrfM/ox8khtY5KysATy0i/v+vVgqoI3XG+oIA1d4d0as0wmXvNPTNrrp/S4tbTTDCD9hai22a0HtmgBSgbZ+5zrPtcHy7VpH9Egd50pbtPgJq6epcGihfmBNcEvZFEZxmoZYzpT4BKJZ3c3bMl11wDv4Y844wNHbN3In6RNV8EXCotTI1ioGxd2U2MwQigG0jiAAkZOJSSPaGBf57XQO1gGWwcc7zL3bhQ+HdhL7r6mt5uBFrPEQFeeEp+HyX2sM+LgPYaSB8zn2bXEWGPNNMTvYNHxZpQ==-----END CERTIFICATE-----";
pemSignKey = "-----BEGIN ENCRYPTED PRIVATE KEY-----MIIC/jBIBgkqhkiG9w0BBQ0wOzAbBgkqhkiG9w0BBQwwDgQI2gA3VJVo/ZcCAgQAMBwGCCqDGoyaRAEEBBD1KJd0EAJONigzqURUZkDyBIICsOuKQvLQfwQjCGa3pYq4n8ehBmLVNicwdEwkO9uLXRxkeBCUsbbVKtPA1h0KK+LuBf7iFTIAwS866Grn3PHMi/KeHkhErRNoTqc9sRZ0/Mm6n5w2DNn79kyeMDZIJTSma6yQkkbELxsn8wwX65XvYW17HUGF+hRUBmWEKNECIsyQOp9QZyp5YtExujeWiyOaBK0LDJ2Q+pKWyQyC9SUiQYA0LDxgZva8x9OQUTaAhvda6l2PJJmP1s/zJL6Z2pepcqQev0Ees5Jvwo42IO+QM1zt75A/VqqRg4fuU5l33T7+YqZKW/mOIIciFbYiSN+HMHEuaJ4b8WxlonTiR4DXIN3X+1r2eAmvn2D3fb/CLjouAUkZlebOI65L8ET5eSaKZW87M5ZNjCZE+Fs4NcNhcROMYC+4gQsZkvrPT0cQ5PwCtLFQp9PPc+0b5BmBpOxXQCGj3M3D/jRoQcndyp9UhAyPHAOK/O8L9EOkeN1v0qyeUz9LiHYjMOhh7ETdqls7K94pZ9lIq4y5XEoBi5kkMw62WbPuhKm7cAyt1nkjZfayC2NRe91YHwU3tfmPysa8pBPkrUhvUgACPz9Ycm5ckGZshNbsGdHFVDU9LIG5N4kBOoHnXYdCf0bSd8iiQA8428lpBgTs4AEvGjPKnLo6/id8CVDAU9imQIf1l4CRPJh2wQDRuYGM4vwYp2DRGHFGkXDcl56gPktXH6z9wWy3d5VZh9JV+yU3aygMz8nKgcDskqAne/PFUZGiNd2lFsp1VQs5CCSlcAZKZ5QxpOkW+c2QIIQN25VQ4sNZUV36DpBbAl5pLGAponzCguue7XgezODcDCRcEXLziJ1ZeXdF+AGendCJ+N//KvQrejN4LlNwIcKdGsLfCvivyjn6l1wXILQuDpTZG+p2eHNz0aO5iNY=-----END ENCRYPTED PRIVATE KEY-----";
pemKMCert = "-----BEGIN CERTIFICATE-----MIIEmDCCA4CgAwIBAgIEWWxEHDANBgkqhkiG9w0BAQUFADBOMQswCQYDVQQGEwJLUjESMBAGA1UECgwJVHJhZGVTaWduMRUwEwYDVQQLDAxBY2NyZWRpdGVkQ0ExFDASBgNVBAMMC1RyYWRlU2lnbkNBMB4XDTA4MDcwMjA1MTgwNVoXDTA5MDcwNjA0MTE0N1owYTELMAkGA1UEBhMCS1IxEjAQBgNVBAoMCVRyYWRlU2lnbjETMBEGA1UECwwKTGljZW5zZWRDQTEOMAwGA1UECwwFS1RORVQxGTAXBgNVBAMMEO2FjOyKpO2KuChLVE5FVCkwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAKxyl0cOkkygWKKmhI01s6p6mFokB/zmU6YBb5r+EnpA/oLzJsc4BHieY5fEHgsgFiEUfbaxCPi5QIoDEg6DjwNoSPQydQE11mwM4S9/5ZyQPqP0D2kMcOes0B+4bVYYPos5eyFuDIUpy7rsObgCOAQqzVy3I8FZRffjEzGGc9pLAgMBAAGjggHtMIIB6TCBjwYDVR0jBIGHMIGEgBQrdgKuglx97oGRnvWJW7nimVupr6FopGYwZDELMAkGA1UEBhMCS1IxDTALBgNVBAoMBEtJU0ExLjAsBgNVBAsMJUtvcmVhIENlcnRpZmljYXRpb24gQXV0aG9yaXR5IENlbnRyYWwxFjAUBgNVBAMMDUtJU0EgUm9vdENBIDGCAidkMB0GA1UdDgQWBBTZNGWRFgXXoQfFA50aOs0ngeHErzAOBgNVHQ8BAf8EBAMCBSAwegYDVR0gAQH/BHAwbjBsBgkqgxqMmkwBAQQwXzAuBggrBgEFBQcCAjAiHiDHdAAgx3jJncEcspQAIKz1x3jHeMmdwRwAIMeFssiy5DAtBggrBgEFBQcCARYhaHR0cDovL3d3dy50cmFkZXNpZ24ubmV0L2Nwcy5odG1sMGUGA1UdHwReMFwwWqBYoFaGVGxkYXA6Ly9sZGFwLnRyYWRlc2lnbi5uZXQ6Mzg5L2NuPWNybDFkcDEzNCxvdT1jcmxkcCxvdT1BY2NyZWRpdGVkQ0Esbz1UcmFkZVNpZ24sYz1LUjBDBggrBgEFBQcBAQQ3MDUwMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnRyYWRlc2lnbi5uZXQ6ODAvT0NTUFNlcnZlcjANBgkqhkiG9w0BAQUFAAOCAQEADQ1VcDBUs2HiyzeSw6LVlVamCz46FYjI5Sq43V59NuNmsDxQrfF6N1H4EbI6fYsyjf2Fx6Y3fuZs+WcV6HosKpYl7nM2elss+JpP3xY3icygRjkez63VoQY5/0+zAOLYeaZHShjYHY/V6w420hOyoB6ZuVkG835yalEd2dMEnY8ZJ3yguMvx0anHodSoWVrtF8B1dfgohbxrZcSToG89yF8Prd2DHO+/LbKQoUd8FVXlsoVkmg1kxk2tYGWKf6OhZywbzrWqD/478S/cQGO9M9OROwtNkplem/GaDzkTKlBcWMelwxsYTrtzOmw9WtXyM6C6col5XM9u2VhpXtsh+Q==-----END CERTIFICATE-----";
pemKMKey = "-----BEGIN ENCRYPTED PRIVATE KEY-----MIICzjBIBgkqhkiG9w0BBQ0wOzAbBgkqhkiG9w0BBQwwDgQISD7kcuIFfJcCAgQAMBwGCCqDGoyaRAEEBBAfHbudBnQ1U2VnXpnSTjzxBIICgMn8+xIjdFbX1jBeQR6ADm91okccG7jSQpJm3ol/y+I2G6PmEmKOPBzgq7zJZlYh0o6MNLw3ihYp6tAusblWhe6KKXsUK6A+EtSWq0h7FiwSN4kd+JvQyI0CJH///zo6rlGHYBXyTtI9XHPkYrRod3tYnPNWWQ2NqqTgbaPpgM3lH0qGQ1YftqtLsXYux1cvmJmemOWYsrWS8elEm10ynJDvX+Ahy4ppTPRtdZ0RxpF3ZFkv21BP5EPHjCkGU7FHcIhqwQrG/WwpyDeubIrxizZMgHPJUo9X785jcpZ3JKj+0kLADCqNLTUykkwEmrY8de8hTZqh2iUfAqYdQQJYKNvFtgv0jkDR9k/DuamFeNjhqR9yui5rSQ48FvBrKlKxBq8xjECY/bntWttfWELYJgm18Lom21n+dGaydw4KZT69yQH+SdLPdMJkPwKtXrivskMM9ATr6MPkt5UQwXUrZhANF8KtbAdmLzaSslK1YtijbzJ5cQLffLYi1nNl8Jdlr4ZxfdjqzmbUSYghv4GqRywstgowtLwXTB+48K/Tk+EUz4FZAtLl5/LDVAvF7/KzHSQ30L+ooQ9EVqLA3knM3iPSWP0yRJ/o3lzFuCvGvIce1od3E/weOkC1xGPKf+SOO46oHdS2ZSHzuykb0uybchqzT+9/WQtIdnGkjxE1cAhf5KPnUiUnCtBz4QpFqBfQQBz5UMIylO96PvTRT08BEAjGJf50IVq4XeGkgvrcYD8vZdpwFpHaCcTxqNTMYrJvISfL4OrU4WuxcXCn/veskfjSNM9Wv+WpRbjtlvsbW7NMpZL+oN7A53lrPrPI42o9LPEnQ/VvQmVmVh0qxADKr4I=-----END ENCRYPTED PRIVATE KEY-----";


//**************************************************************************************//

function escape_url(url) {
    var i;
    var ch;
    var out = '';
    var url_string = '';

    url_string = String(url);

    for (i = 0; i < url_string.length; i++) {
        ch = url_string.charAt(i);
        if (ch == ' ')
            out += '%20';
        else if (ch == '%')
            out += '%25';
        else if (ch == '&')
            out += '%26';
        else if (ch == '+')
            out += '%2B';
        else if (ch == '=')
            out += '%3D';
        else if (ch == '?')
            out += '%3F';
        else
            out += ch;
    }
    return out;
}
