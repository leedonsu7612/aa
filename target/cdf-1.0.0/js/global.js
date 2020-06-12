// 공백제거
function trim(value) {
	return value.replace(/^\s+|\s+$/g, "");
}

function isStringNumber(obj) {
	var ref = "0123456789";
	var str = obj.value;
	var sLength = str.length;
	var chr, idx, idx2;
	var chrtrue = '';

	for (var i = 0; i < sLength; i++) {
		chr = str.charAt(i);
		idx = ref.indexOf(chr);

		if (idx == -1) {
			alert('숫자만 입력가능합니다');
			obj.value = chrtrue;
			return 0;
		} else {
			chrtrue += chr;
		}
	}
}

function isStringNumberHipen(obj) {
	var ref = "0123456789-";
	var str = obj.value;
	var sLength = str.length;
	var chr, idx, idx2;
	var chrtrue = '';

	for (var i = 0; i < sLength; i++) {
		chr = str.charAt(i);
		idx = ref.indexOf(chr);

		if (idx == -1) {
			alert('숫자, "-"만 입력가능합니다');
			obj.value = chrtrue;
			return 0;
		} else {
			chrtrue += chr;
		}
	}
}

// 정규표현식을 이용한 이메일 유효성검사
function email_chk(obj1, obj2) {
	var str = obj1.val() + '@' + obj2.val();

	if (str.length > 0) {
		var regExp = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;

		if (!regExp.test(str)) {
			alert('잘못된 e-mail 형식입니다.');
			obj2.focus();
			return false;
		} else {
			return true;
		}
	}
}

// 정규표현식을 이용한 이메일 유효성검사
function email_chk_one(obj) {
	var str = obj.val();

	if (str.length > 0) {
		var regExp = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;

		if (!regExp.test(str)) {
			alert('잘못된 e-mail 형식입니다.');
			obj.focus();
			return false;
		} else {
			return true;
		}
	}
}

// 스크립트 현재 시간 가져오기
function getNowTime() {
	var today = new Date();
	return today.getTime();
}

/*******************************************************************************
 * 법인번호 체크 return : boolean ex) 111111-1111111
 ******************************************************************************/

// 법인번호 검사
function check_corpnum(sRegNo) {
	var re = /-/g;
	sRegNo = sRegNo.replace('-', '');

	if (sRegNo.length != 13) {
		return false;
	}

	var arr_regno = sRegNo.split("");
	var arr_wt = new Array(1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2);
	var iSum_regno = 0;
	var iCheck_digit = 0;

	for (i = 0; i < 12; i++) {
		iSum_regno += eval(arr_regno[i]) * eval(arr_wt[i]);
	}

	iCheck_digit = 10 - (iSum_regno % 10);
	iCheck_digit = iCheck_digit % 10;

	if (iCheck_digit != arr_regno[12]) {
		return false;
	}

	return true;
}

// 주민번호 체계 검사
function ssnConfirm(numObj) {
	var num = numObj;

	if (isNaN(num)) {
		return false;
	}

	var ssn1 = num.substring(0, 6);
	var ssn2 = num.substring(6, 13);

	if ((ssn1.length == 6) && (ssn2.length == 7)) {
		var ssn = ssn1 + ssn2;
		a = new Array(13);

		for (var i = 0; i < 13; i++) {
			a[i] = parseInt(ssn.charAt(i));
		}

		var k = 11 - (((a[0] * 2) + (a[1] * 3) + (a[2] * 4) + (a[3] * 5) + (a[4] * 6) + (a[5] * 7) + (a[6] * 8) + (a[7] * 9) + (a[8] * 2) + (a[9] * 3) + (a[10] * 4) + (a[11] * 5)) % 11);

		if (k > 9) {
			k -= 10;
		}

		if (k == a[12]) {
			return true;
		} else {
			return false;
		}
	}
}

// 사업자등록번호 체크
function check_busino(vencod) {
	var sum = 0;
	var getlist = new Array(10);
	var chkvalue = new Array("1", "3", "7", "1", "3", "7", "1", "3", "5");

	for (var i = 0; i < 10; i++) {
		getlist[i] = vencod.substring(i, i + 1);
	}

	for (var i = 0; i < 9; i++) {
		sum += getlist[i] * chkvalue[i];
	}

	sum = sum + parseInt((getlist[8] * 5) / 10);
	sidliy = sum % 10;
	sidchk = 0;

	if (sidliy != 0) {
		sidchk = 10 - sidliy;
	} else {
		sidchk = 0;
	}

	if (sidchk != getlist[9]) {
		return false;
	}

	return true;
}

var useSign = false; // 사용여부

// HB2BLoan 서명인증
function HB2BLoanSign(txt, busiNo, type) {
	var certInfo = new Object();
	var flag = true;

	var plainText, signMsg, ssn;
	var nRet, certdn, storage;

	if (useSign) {
		// 서명할 문자열 데이타 설정.
		plainText = txt;
		ssn = busiNo.replace(/-/gi, "");

		// 사용자가 자신의 인증서를 선택.
		// 인증서 검증할 인증서 꺼내오기 위해서만 사용.
		var loginConf;
		var myCertDirPath, myCert, myPriKeyInfo;

		// 모든 Condition 설정.
		nRet = TSToolkit.SetConfig("test", CA_LDAP_INFO, CTL_INFO, POLICIES, INC_CERT_SIGN, INC_SIGN_TIME_SIGN, INC_CRL_SIGN, INC_CONTENT_SIGN, USING_CRL_CHECK, USING_ARL_CHECK);

		if (nRet > 0) {
			alert(nRet + " : " + TSToolkit.GetErrorMessage());
			returnSign();
			flag = false;
			return false;
		}

		// 하드디스크를 첫 번째 버튼으로 설정
		TSToolkit.SetEachConfig("FIRST_BUTTON", "HDD");

		// 사용자가 자신의 인증서를 선택.
		nRet = TSToolkit.SelectCertificate(STORAGE_TYPE, 0, "");

		if (nRet > 0) {
			alert(nRet + " : " + TSToolkit.GetErrorMessage());
			returnSign();
			flag = false;
			return false;
		}

		// OID 값 가져오기
		nRet = TSToolkit.GetCertificate(CERT_TYPE_SIGN, DATA_TYPE_PEM);

		if (nRet > 0) {
			alert("GetCertificate : " + TSToolkit.GetErrorMessage());
			returnSign();
			flag = false;
			return false;
		}

		// $('#oid').val(TSToolkit.OutData);
		certInfo.oid = TSToolkit.OutData;

		var cert;
		cert = TSToolkit.OutData;
		TSToolkit.GetCertificatePropertyFromID(cert, CERT_ATTR_POLICY);

		if (type == 1) {
			// 사업자 번호 체크 = 리얼시 적용

			// 사업자번호 ssn

			// 법인번호 - 개인사업자
			if (signValidationChk(TSToolkit.OutData, FIRST_INDI_CERT_POLICIES) > -1) {
				ssn = busiNo.replace(/-/gi, "");
			}

			if (signValidationChk(TSToolkit.OutData, BANK_INDI_CERT_POLICIES) > -1) {
				ssn = busiNo.replace(/-/gi, "");
			}

			nRet = TSToolkit.VerifyVID(ssn);

			if (nRet > 0) {
				alert(nRet + " : " + TSToolkit.GetErrorMessage());
				returnSign();
				flag = false;
				return false;
			}

			if (TSToolkit.OutData != "true") {
				alert("인증서의 사업자번호가 올바르지 않습니다.");
				returnSign();
				flag = false;
				return false;
			}
		}

		// 서명데이터
		nRet = TSToolkit.SignData(plainText);

		if (nRet > 0) {
			alert(nRet + " : " + TSToolkit.GetErrorMessage());
			returnSign();
			flag = false;
			return false;
		}

		// $('#signMessage').val(TSToolkit.OutData);
		certInfo.signMessage = TSToolkit.OutData;
		// $('#orgMessage').val(txt);
		certInfo.orgMessage = txt;
		certInfo.signRule = "PKCS#7";
	} else {
		certInfo.oid = "test";
		certInfo.signMessage = "test";
		certInfo.orgMessage = "test";
		certInfo.signRule = "PKCS#7";
	}

	var ajaxUrl = $("#certificateUrl").val();
	var jsonData = "jsonData=" + (JSON.stringify(certInfo));

	$.ajax({
		url : ajaxUrl,
		type : "post",
		data : jsonData,
		dataType : "json",
		async : false,
		success : function(data) {
			var get_data = eval(data);

			if (get_data["resultMessage"] == "Success") {
				return true;
			} else {
				// 실패
				$("#message_popup").find("dt").text("매출채권 인증서정보 생성에 실패하였습니다.\r\nCause : " + get_data["errorMessage"]);
				$("#message_popup").css("visibility", "visible");
				$("#message_popup").fadeIn("show");
				return false;
			}
		},
		error : function(request, status, error) {
			$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
			$("#ajaxErrorPopup").css("visibility", "visible");
			$("#ajaxErrorPopup").fadeIn("show");
			return false;
		}
	});

	return true;
}

// 인증서 데이터 원위치
function returnSign() {
	/*
	 * $('#orgMessage').val(''); $('#signMessage').val('');
	 * $('#signRule').val('PKCS#7'); $('#oid').val('');
	 */
}

// 인증서 유효성 확인
function signValidationChk(oid, signTxt) {
	return signTxt.indexOf(oid);
}

function drawB2bCal(guarcode, bankcode, goodscode) {
	calview("b2bcal.do", 252, 338);
}

function drawOneCal(issueDate) {
	calview("/onetotwocal.do?issueDate=" + issueDate, 270, 360);
}

function radioValue(oRadio) {
	var value = "null";

	for (var i = 0; i < oRadio.length; i++) {
		if (oRadio[i].checked == true) {
			value = oRadio[i].value;
		}
	}

	return value;
}

function toUSDWithoutComma(amt) {
	var idx = amt.indexOf(".");
	var tmp = amt.substring(0, idx + 3);
	tmp = tmp.replace(/,|\./g, "");
	return parseInt(tmp);
}

function getDays(d1, d2) {
	var date1 = new Date(d1.substr(0, 4), d1.substr(4, 2) - 1, d1.substr(6, 2));
	var date2 = new Date(d2.substr(0, 4), d2.substr(4, 2) - 1, d2.substr(6, 2));
	var days = Math.round((date2 - date1) / (1000 * 60 * 80 * 24));
	return days;
}

function only_number() // 영문방지 및 0-9 까지의 숫자만 입력
{
	if (event.keyCode <= 47 || (event.keyCode > 57 && event.keyCode != 126))
		event.returnValue = false;
}
