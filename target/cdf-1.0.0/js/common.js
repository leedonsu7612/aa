$(function() {
    /* 달력클릭시 날짜 선택 스크립트 */
    // default
    $(".datepicker").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm.dd',
        showMonthAfterYear : true,
        yearSuffix : '년'

    });

    /* 페이지 달력 */
    // startDate
    $("#startDate").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        changeYear : true,
        changeMonth : true,
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm',
        defaultDate : currentDate($("#startDate").val()),
        showMonthAfterYear : true,
        maxDate : '+0d',
        yearSuffix : '년',
        beforeShow : function(el, dp) {
            $('#ui-datepicker-div').addClass('hide-calendar');
        },
        yearRange : 'c-20:c+20',
        onChangeMonthYear : function(year, month, inst) {
            month = (month < 10) ? "0" + month : month;
            $("#startDate").val(year + "." + month);
        },
        onClose : function(selectedDate, object)
        {
            var filtedDate = selectedDate;
            var re = /^[\d]{4}(0[1-9]|1[0-2])$/;

            //달력 입력시 . 입력됫는지 체크.
            filtedDate = filtedDate.indexOf( "." ) == -1 ? filtedDate : filtedDate.replace( ".", "" );

            var date = new Date();
            var nowMonth = date.getMonth();

            if ( re.test(filtedDate) )
            {
                var selectedMonth = Number( filtedDate.substring(4, filtedDate.length) );

                var selectedYear = Number( filtedDate.substring(0, 4) );

                //시작날짜가 현재날짜보다 미래일 수 없으므로.
                if ( selectedYear < date.getFullYear() ) {
                	date = new Date( selectedYear, ( selectedMonth - 1 ), 1 );
                } else if ( ( Number( nowMonth ) + 1 ) >= selectedMonth ) {
                    date = new Date( filtedDate.substring(0, 4), ( selectedMonth - 1 ), 1 );
                }

                //시작날짜가 현재날짜보다 미래일 수 없으므로.
                if ( ( Number( nowMonth ) + 1 ) >= selectedMonth )
                    date = new Date( filtedDate.substring(0, 4), ( selectedMonth - 1 ), 1 );
            }

            $(this).datepicker("setDate", date);
            $(this).datepicker("option", "defaultDate", date);

            var month = (date.getMonth() + 1);
            month = (month < 10) ? "0" + month : month;

            $("#startDate").val(date.getFullYear() + "." + month);

            /*var tempDate = $("#endDate").val();
            $("#endDate").datepicker("option", "minDate", date);
            $("#endDate").val(tempDate);*/

            $(this).blur();
        }
    });

    // endDate
    $("#endDate").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        changeYear : true,
        changeMonth : true,
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm',
        //maxDate : new Date(),
        defaultDate : currentDate($("#endDate").val()),
        showMonthAfterYear : true,
        yearSuffix : '년',
        beforeShow : function(el, dp) {
            $('#ui-datepicker-div').addClass('hide-calendar');
        },
        onChangeMonthYear : function(year, month, inst) {
            month = (month < 10) ? "0" + month : month;
            $("#endDate").val(year + "." + month);
        },
        yearRange : 'c-20:c+20',
        onClose : function(selectedDate, object) {
            var filtedDate = selectedDate;
            var re = /^[\d]{4}(0[1-9]|1[0-2])$/;

            //달력 입력시 . 입력됫는지 체크.
            filtedDate = filtedDate.indexOf( "." ) == -1 ? filtedDate : filtedDate.replace( ".", "" );

            var date = new Date();
            var startDate = currentDate( $("#startDate").val() );

            if ( re.test(filtedDate) )
            {
                var year = filtedDate.substring(0, 4);
                month = Number( filtedDate.substring(4, filtedDate.length) );

                //마지막 날짜가 시작날짜보다 과거일 수 없으므로
                if ( year > startDate.getFullYear() )
                {
                        date = new Date( year, ( month - 1 ), 1 );
                }
                else if ( year == startDate.getFullYear() )
                {
                    if ( ( Number( startDate.getMonth() ) ) < month )
                        date = new Date( year, ( month - 1 ), 1 );
                }

            }
            $(this).datepicker("setDate", date);
            $(this).datepicker("option", "defaultDate", date);

            var month = (date.getMonth() + 1);
            month = (month < 10) ? "0" + month : month;

            $("#endDate").val(date.getFullYear() + "." + month);

            /*var tempDate = $("#startDate").val();
            $("#startDate").datepicker("option", "maxDate", date);
            $("#startDate").val(tempDate);*/

            $(this).blur();
        }
    });

    // searchDate
    $("#searchDate").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        changeYear : true,
        changeMonth : true,
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm',
        defaultDate : currentDate($("#searchDate").val()),
        showMonthAfterYear : true,
        maxDate : '+0d',
        yearSuffix : '년',
        beforeShow : function(el, dp) {
            $('#ui-datepicker-div').addClass('hide-calendar');
        },
        yearRange : 'c-20:c+20',
        onChangeMonthYear : function(year, month, inst) {
            month = (month < 10) ? "0" + month : month;
            $("#searchDate").val(year + "." + month);
        },
        onClose : function(selectedDate, object)
        {
            var filtedDate = selectedDate;
            var re = /^[\d]{4}(0[1-9]|1[0-2])$/;

            //달력 입력시 . 입력됫는지 체크.
            filtedDate = filtedDate.indexOf( "." ) == -1 ? filtedDate : filtedDate.replace( ".", "" );

            var date = new Date();
            var nowMonth = date.getMonth();

            if ( re.test(filtedDate) )
            {
                var selectedMonth = Number( filtedDate.substring(4, filtedDate.length) );

                var selectedYear = Number( filtedDate.substring(0, 4) );

                //시작날짜가 현재날짜보다 미래일 수 없으므로.
                if ( selectedYear < date.getFullYear() ) {
                	date = new Date( selectedYear, ( selectedMonth - 1 ), 1 );
                } else if ( ( Number( nowMonth ) + 1 ) >= selectedMonth ) {
                    date = new Date( filtedDate.substring(0, 4), ( selectedMonth - 1 ), 1 );
                }

                //시작날짜가 현재날짜보다 미래일 수 없으므로.
                if ( ( Number( nowMonth ) + 1 ) >= selectedMonth )
                    date = new Date( filtedDate.substring(0, 4), ( selectedMonth - 1 ), 1 );
            }

            $(this).datepicker("setDate", date);
            $(this).datepicker("option", "defaultDate", date);

            var month = (date.getMonth() + 1);
            month = (month < 10) ? "0" + month : month;

            $("#searchDate").val(date.getFullYear() + "." + month);

            /*var tempDate = $("#endDate").val();
            $("#endDate").datepicker("option", "minDate", date);
            $("#endDate").val(tempDate);*/

            $(this).blur();
        }
    });
    /* 페이지 달력 */

    /* 팝업용 달력 */
    $("#popBeforeDate").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm.dd',
        showMonthAfterYear : true,
        yearSuffix : '년',
        onClose : function(selectedDate, object) {
            $("#popAfterDate").datepicker("option", "minDate", selectedDate);

            $(this).blur();
        }
    });

    // endDate
    $("#popAfterDate").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm.dd',
        minDate : 1,
        showMonthAfterYear : true,
        yearSuffix : '년',
        onClose : function(selectedDate, object) {
            $("#popBeforeDate").datepicker("option", "maxDate", selectedDate);
            $(this).blur();
        }
    });
    // startDate
    $("#popStartDate").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm.dd',
        maxDate : new Date(),
        showMonthAfterYear : true,
        yearSuffix : '년',
        onClose : function(selectedDate, object) {
            $("#popEndDate").datepicker("option", "minDate", selectedDate);
            $(this).blur();
        }
    });

    // endDate
    $("#popEndDate").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm.dd',
        maxDate : new Date(),
        showMonthAfterYear : true,
        yearSuffix : '년',
        onClose : function(selectedDate, object) {

            $("#popStartDate").datepicker("option", "maxDate", selectedDate);
            $(this).blur();
        }
    });

    $(".popStartDate").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm.dd',
        showMonthAfterYear : true,
        yearSuffix : '년',
        onClose : function(selectedDate, object) {
            $(".popEndDate").datepicker("option", "minDate", selectedDate);
            $(this).blur();
        }
    });

 // endDate  채권만기일 지정 달력
    $(".popEndDate").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm.dd',
        //altField: '#hdExpirationDate',
        //altFormat: 'yy.mm.dd',
        showMonthAfterYear : true,
        yearSuffix : '년',
        minDate : 1,
        beforeShow : function(el, dp) {
            if ($(this).attr("readonly") == "readonly")
                return false;

            /*if($(this).val() == null || $(this).val() == ""){
                var currDate = new Date();
                currDate.setDate(currDate.getDate() + 1);
                $(this).val($.datepicker.formatDate('yy.mm.dd', currDate));
            }*/
        },
        onChangeMonthYear : function(year, month, inst) {
        },
        onClose : function(selectedDate, object) {
            //만기일 input창일경우
            var name = "";
            if($(this).attr("id").length == 18){
                name = $(this).attr("id").substr(0, 17);
            }
            else if($(this).attr("id").length == 17){
                name = $(this).attr("id").substr(0, 16);
            }

            // 만기일 체크
            if(name == "kiaExpirationDate" || name == "hdExpirationDate"){
                //날짜 형식 체크
                var result = datepickerDateCheck(this);
                if(result != true){
                    position_cm($("#expirationErrorPopup"));
                    $("#expirationErrorPopup dt").text(result);
                    $("#expirationErrorPopup").fadeIn("slow");

                    $(this).val("");
                    this.blur();
                    return;
                }

                //익일보다 적을시 체크
                if(selectedDate == "" && object.lastVal == ""){ //input창이 빈값인 상태에서 focus 벗어났을때
                    //내일 날짜 입력

                    return false;
                }
                $(this).val($.datepicker.formatDate('yy.mm.dd', currentDate2(selectedDate)));

                var currDate = $(this).datepicker( "option", "minDate" );
                if($(this).val() == null || $(this).val() == ""){
                    result = "만기일이 지정되지 않았습니다.";
                    $("#expirationErrorPopup dt").text(result);
                    $("#expirationErrorPopup").fadeIn("slow");

                    $(this).val("");
                    this.blur();

                    return;
                }
                if(currDate.getTime() > currentDate(selectedDate).getTime()){//currentDate($(this).val()).getTime()){
                    result = "정상적인 출금의뢰를 진행하기 위해 D+2영업일부터 지정 가능합니다.";
                    $("#expirationErrorPopup dt").text(result);
                    $("#expirationErrorPopup").fadeIn("slow");

                    $(this).val("");
                    this.blur();

                    return;
                }

                // 만기일 체크
                checkSingleExpirationDate(this);
                checkExpirationDate();
                $(this).select();
            }
            else{
                $(".popStartDate").datepicker("option", "maxDate", selectedDate);
            }
        }
    });
    /* 팝업용 달력 */

    /* 세금계산서 달력 */
    $("#taxBillDate").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        changeYear : true,
        changeMonth : true,
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm',
        defaultDate : currentDate($("#startDate").val()),
        showMonthAfterYear : true,
        maxDate : '+0d',
        yearSuffix : '년',
        beforeShow : function(el, dp) {
            $('#ui-datepicker-div').addClass('hide-calendar');
        },
        yearRange : 'c-20:c+20',
        onChangeMonthYear : function(year, month, inst) {
            month = (month < 10) ? "0" + month : month;
            $("#taxBillDate").val(year + "." + month);
        },
        onClose : function(selectedDate, object)
        {
            var filtedDate = selectedDate;
            var re = /^[\d]{4}(0[1-9]|1[0-2])$/;

            //달력 입력시 . 입력됫는지 체크.
            filtedDate = filtedDate.indexOf( "." ) == -1 ? filtedDate : filtedDate.replace( ".", "" );

            var date = new Date();
            var nowMonth = date.getMonth();

            if ( re.test(filtedDate) )
            {
                var selectedMonth = Number( filtedDate.substring(4, filtedDate.length) );

                var selectedYear = Number( filtedDate.substring(0, 4) );

                //시작날짜가 현재날짜보다 미래일 수 없으므로.
                if ( selectedYear < date.getFullYear() ) {
                	date = new Date( selectedYear, ( selectedMonth - 1 ), 1 );
                } else if ( ( Number( nowMonth ) + 1 ) >= selectedMonth ) {
                    date = new Date( filtedDate.substring(0, 4), ( selectedMonth - 1 ), 1 );
                }

            }

            $(this).datepicker("setDate", date);
            $(this).datepicker("option", "defaultDate", date);

            var month = (date.getMonth() + 1);
            month = (month < 10) ? "0" + month : month;

            $("#taxBillDate").val(date.getFullYear() + "." + month);

            //닫으면 값을 배정한다.
            $("#taxBillDate").val(date.getFullYear() + "." + month);                //2015.07
            $("#startTaxBillDate").val(date.getFullYear() + "." + month + ".01");   //2015.07.01
            $("#endTaxBillDate").val(date.getFullYear() + "." + month + ".31");     //2015.07.20

            $(this).blur();
        }
    });
    /*$("#taxBillDate").datepicker({
        dateFormat : 'yy.mm',
        prevText : '이전 달',
        nextText : '다음 달',
        changeYear : true,
        changeMonth : true,
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        showMonthAfterYear : true,
        yearSuffix : '년',
        maxDate : new Date(),
        defaultDate : currentDate($("#startTaxBillDate").val()),
        beforeShow : function(el, dp) {
            $('#ui-datepicker-div').addClass('hide-calendar');
        },
        onChangeMonthYear : function(year, month, inst) {
        },
        onClose : function(selectedDate, object) {
             date settig
            var date = new Date(object.selectedYear, object.selectedMonth, 1);
            $(this).datepicker("setDate", date);
            $(this).datepicker("option", "defaultDate", date);

            // 1~9월 앞에 0 붙이기
            var month = (date.getMonth() + 1);
            if (month < 10) {
                month = "0" + month;
            }

            //닫으면 값을 배정한다.
            $("#taxBillDate").val(date.getFullYear() + "." + month);                //2015.07
            $("#startTaxBillDate").val(date.getFullYear() + "." + month + ".01");   //2015.07.01
            $("#endTaxBillDate").val(date.getFullYear() + "." + month + ".01");     //2015.07.20

            initDate(); //그리고 초기화를 한다

            $(this).blur();
        }
    });*/
    /* 세금계산서 달력 */

 // paymentStartDate
    $("#paymentStartDate").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        changeYear : true,
        changeMonth : true,
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm.dd',
        defaultDate : currentDate($("#paymentStartDate").val()),
        showMonthAfterYear : true,
        //maxDate : currentDate($("#paymentEndDate").val()),
        yearSuffix : '년',
        yearRange : 'c-20:c+20',
        onChangeMonthYear : function(year, month, inst) {
            month = (month < 10) ? "0" + month : month;
            $("#paymentStartDate").val(year + "." + month);
        },
        onClose : function(selectedDate, object) {
            var filtedDate = selectedDate;
            var re = /^[\d]{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[0-1])$/;

            //달력 입력시 . 입력됫는지 체크.
            filtedDate = filtedDate.replace(/\./g, "");

            var date = new Date();
            if ( re.test(filtedDate) )
            {
                var startDate = $.datepicker.parseDate( "yymmdd", filtedDate );
                date.setHours( 0, 0, 0, 0 );

                if ( startDate <= date )
                    date = startDate;

                var endDateStr = $("#paymentEndDate").val().replace(/\./g, "");

                if ( re.test(endDateStr) )
                {
                    var endDate = $.datepicker.parseDate( "yymmdd", endDateStr );

                    if ( startDate >= endDate )
                    {
                        date = endDate;//new Date();
                    }
                    else
                    {
                        var period = ( endDate.getTime() - startDate.getTime() ) / 1000 / 60 / 60 / 24;
                        if ( period > 365 )
                        {
                            date = endDate;//new Date();
                        } else {
                            date = startDate;
                        }
                    }
                }
            }

            $(this).datepicker("setDate", date);
            $(this).datepicker("option", "defaultDate", date);

            var month = (date.getMonth() + 1);
            var day = date.getDate();
            month = (month < 10) ? "0" + month : month;
            day = (day < 10) ? "0" + day : day;

            $("#paymentStartDate").val(date.getFullYear() + "." + month + "." + day);

            /*var tempDate = $("#paymentEndDate").val();
            $("#paymentEndDate").datepicker("option", "minDate", date);
            $("#paymentEndDate").val(tempDate);*/

            $(this).blur();
        }
    });

    // paymentEndDate
    $("#paymentEndDate").datepicker({
        prevText : '이전 달',
        nextText : '다음 달',
        changeYear : true,
        changeMonth : true,
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        dateFormat : 'yy.mm.dd',
        //maxDate : new Date(),     //만기일 기준이므로
        //minDate : currentDate($("#paymentStartDate").val()),
        defaultDate : currentDate($("#paymentEndDate").val()),
        showMonthAfterYear : true,
        yearSuffix : '년',
        onChangeMonthYear : function(year, month, inst) {
            month = (month < 10) ? "0" + month : month;
            $("#paymentEndDate").val(year + "." + month);
        },
        yearRange : 'c-20:c+20',
        onClose : function(selectedDate, object) {
            var filtedDate = selectedDate;
            var re = /^[\d]{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[0-1])$/;

            //달력 입력시 . 입력됫는지 체크.
            filtedDate = filtedDate.replace(/\./g, "");

            var startDateStr = $("#paymentStartDate").val().replace(/\./g, "");
            var startDate = $.datepicker.parseDate( "yymmdd", startDateStr );

            var date = new Date();
            if ( re.test(filtedDate) )
            {
                var endDate = $.datepicker.parseDate( "yymmdd", filtedDate );

                if ( startDate <= endDate )
                    date = endDate;

                if ( re.test(startDateStr) )
                {
                    if ( startDate > endDate )
                    {
                        date = startDate;
                    }
                    else
                    {
                        var period = ( endDate.getTime() - startDate.getTime() ) / 1000 / 60 / 60 / 24;
                        if ( ( period - 1 ) > 365 )
                        {
                            date = startDate;//new Date();
                        }
                    }
                }
            }

            $(this).datepicker("setDate", date);
            $(this).datepicker("option", "defaultDate", date);

            var month = (date.getMonth() + 1);
            var day = date.getDate();
            month = (month < 10) ? "0" + month : month;
            day = (day < 10) ? "0" + day : day;

            $("#paymentEndDate").val(date.getFullYear() + "." + month + "." + day);

            /*var tempDate = $("#paymentStartDate").val();
            $("#paymentStartDate").datepicker("option", "maxDate", date);
            $("#paymentStartDate").val(tempDate);*/

            $(this).blur();
        }
    });

    // 숫자만 입력가능 ex) input 속성에 numberOnley = "true" 설정
    $(document).on("keyup", "input:text[numberOnly]", function() {
        $(this).val($(this).val().replace(/[^0-9]/gi, ""));
    });

    // popup drag
    $(".pop_wrap > div > .pop_draggable").mousedown(function( event1, event2, event3 )
    {
        $(".pop_wrap").draggable();
    });

    $(".pop_wrap > div > .pop_draggable").mouseup(function( event1, event2, event3 )
    {
        //$(".pop_wrap").draggable( "disable" );
        $(".pop_wrap").draggable( "destroy" );
    });

    // 페이지 경고창 확인 버튼
    $(".popokbtn").click(function() {
        $(".abc").fadeOut("slow");
    });
});

function getProgressStatus(statusFlag, groupType) {
    if (statusFlag == 0)
        return "결제완료";
    else if (statusFlag == 1 && groupType == "B")
        return "결제대기";
    else if (statusFlag == 1 && groupType == "S")
        return "결제대기";
    else if (statusFlag == 2 && groupType == "B")
        return "기타지급요청";
    else if (statusFlag == 2 && groupType == "S")
        return "기타수금요청";
    else if (statusFlag == 3)
        return "대출승인";
    else if (statusFlag == 4)
        return "변경요청";


    /*
    else if (statusFlag == 6 && groupType == "B")
        return "결제대기";
    else if (statusFlag == 6 && groupType == "S")
        return "대출요청";
     */

    else if (statusFlag == 5)
        return "결제대기";
    else if (statusFlag == 6)
        return "취소요청";
    else if (statusFlag == 7)
        return "결제대기";

    else if (statusFlag == 9)
        return "결제전송중";

    else if (statusFlag == 12 && groupType == "B")
        return "기타지급승인";// 승인완료
    else if (statusFlag == 12 && groupType == "S")
        return "기타수금승인";// 승인완료
    else if (statusFlag == 13 && groupType == "B")
        return "기타지급취소";
    else if (statusFlag == 13 && groupType == "S")
        return "기타수금취소";

    else if (statusFlag == 31 ) {
    	if( groupType == "B")
    		return "상계지급요청";// 승인완료
    	else if (groupType == "S")
    		return "상계수금요청";// 승인완료
    }else if (statusFlag == 30 ) {
    	if( groupType == "B")
    		return "상계지급승인";// 승인완료
    	else if (groupType == "S")
    		return "상계수금승인";// 승인완료
    } else if (statusFlag == 39 ) {
    	if( groupType == "B")
    		return "상계지급취소";// 승인완료
    	else if (groupType == "S")
    		return "상계수금취소";// 승인완료
    }

    return "";
}

function getProgressStatus2(statusFlag, groupType) {
    if (statusFlag == 0)
        return "결제완료";
    else if (statusFlag == 1 && groupType == "B")
        return "결제대기";
    else if (statusFlag == 1 && groupType == "S")
        return "결제대기";
    else if (statusFlag == 2 && groupType == "B")
        return "기타지급요청";
    else if (statusFlag == 2 && groupType == "S")
        return "기타수금요청";
    else if (statusFlag == 3)
        return "대출승인";
    else if (statusFlag == 4)
        return "변경요청";


    /*
    else if (statusFlag == 6 && groupType == "B")
        return "결제대기";
    else if (statusFlag == 6 && groupType == "S")
        return "대출요청";
     */

    else if (statusFlag == 5)
        return "변경완료";
    else if (statusFlag == 6)
        return "취소요청";
    else if (statusFlag == 7)
        return "취소완료";

    else if (statusFlag == 9)
        return "결제전송중";

    else if (statusFlag == 12 && groupType == "B")
        return "기타지급승인";// 승인완료
    else if (statusFlag == 12 && groupType == "S")
        return "기타수금승인";// 승인완료
    else if (statusFlag == 13 && groupType == "B")
        return "기타지급취소";
    else if (statusFlag == 13 && groupType == "S")
        return "기타수금취소";

    else if (statusFlag == 31 ) {
    	if( groupType == "B")
    		return "상계지급요청";// 승인완료
    	else if (groupType == "S")
    		return "상계수금요청";// 승인완료
    } else if (statusFlag == 30 ) {
    	if( groupType == "B")
    		return "상계지급승인";// 승인완료
    	else if (groupType == "S")
    		return "상계수금승인";// 승인완료
    } else if (statusFlag == 39 ) {
    	if( groupType == "B")
    		return "상계지급취소";// 승인완료
    	else if (groupType == "S")
    		return "상계수금취소";// 승인완료
    }


    return "";
}

// 콤마찍기
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 콤마풀기
function uncomma(str) {
    str = String(str);
    //return str.replace(/[^\d]+/g, '');
    return str.replace(/,/g, '');
}

function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

// popup center
function position_cm(obj) {
    var windowWidth = $(window).width();
    var windowHeight = $(window).height();
    var parentWidth = $(obj).parents().width();
    var parentHeight = $(obj).parents().height();
    var $obj = $(obj);
    var objWidth = $obj.width();
    var objHeight = $obj.height();
    var adjustHeight = 0;
    //$obj.attr("class").indexOf('dyPop') >= 0 ? 70 : 0;
    if(($obj.attr("class") != undefined) && $obj.attr("class") == "alertLayer_popup" ){
            adjustHeight = 70;
    }

    $obj.css({
        'position' : 'absolute',
        'left' :  (parentWidth / 2) - (objWidth / 2),
        'top' :   (windowHeight/2) - 220 + adjustHeight     //윈도우높이의 반을 구한후 헤더길이만큼 빼서 높이를 올린다(헤더:110, 윈도우헤더:110)
        //(parentHeight / 2) - (objHeight / 2)// - (windowHeight - parentHeight)
    });
}
$(document).ready(function() {
    position_cm($('.pop_wrap'));
    position_cm($('.alert_popup'));
    position_cm($('.alertLayer_popup'));

});
$(window).resize(function() {
    position_cm($('.pop_wrap'));
    position_cm($('.alert_popup'));
    position_cm($('.alertLayer_popup'));
});

//알림팝업 마스킹 처리
function showAlartPopup( obj ) {
 // 화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();
    var maskWidth = $(window).width();

    // 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({
        'width' : maskWidth,
        'height' : maskHeight
    });
    // 애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
    $('#mask').fadeIn("fast");
    $('#mask').fadeTo("slow", 0.2);

    $(obj).css("visibility", "visible");
    $(obj).css("z-index", 20000);
    $('#mask').before($(obj));

    position_cm(obj);

    $(obj).fadeIn("slow");
}
//알림팝업 마스킹 처리
function closeAlartPopup( obj ) {
    $('#mask').hide();
    $(obj).css("visibility", "hidden");
    $(obj).css("z-index", 20000);
    $(obj).fadeOut("slow");
}

// 화면 불투명 처리 함수
function wrapWindowByMask( obj ) {
    // 화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();
    var maskWidth = $(window).width();

    // 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({
        'width' : maskWidth,
        'height' : maskHeight
    });

    // 애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
    $('#mask').fadeIn("fast");
    $('#mask').fadeTo("slow", 0.2);

    position_cm( obj );
}

/* 팝업창 연결시 창사이즈 고정을 위해 사용된 스크립트 */
function OpenWindow( url, intWidth, intHeight ) {
    window.open( url, "_blank", "width=" + intWidth + ",height=" + intHeight + ",resizable=no,scrollbars=1");
}

$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (this.name.substr(-2) == "[]") {
            this.name = this.name.substr(0, this.name.length - 2);
            o[this.name] = [];
        }

        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [ o[this.name] ];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

/*function getCurrentYear() {
    var mydate = new Date();
    var year = mydate.getYear();
    if (year < 1000)
        year += 1900;

    return year;
}

function getCurrentMonth() {
    var mydate = new Date();
    var month = mydate.getMonth() + 1;
    if (month < 10)
        month = "0" + month;

    return month;
}

function getCurrentDay() {
    var mydate = new Date();
    var daym = mydate.getDate();
    if (daym < 10)
        daym = "0" + daym;

    return daym;
}

function getCurrentDate() {
    var mydate = new Date();
    var year = mydate.getYear();
    if (year < 1000)
        year += 1900;

    var day = mydate.getDay();
    var month = mydate.getMonth() + 1;
    if (month < 10)
        month = "0" + month;

    var daym = mydate.getDate();
    if (daym < 10)
        daym = "0" + daym;
    return (year + "." + month + "." + daym);
}*/

// 날짜 차이 계산 함수
// date1 : 기준 날짜(YYYY.MM.DD), date2 : 대상 날짜(YYYY.MM.DD)
function getDateDiff(date1, date2) {
    var getDiffTime = date1.getTime() - date2.getTime();

    return Math.floor(getDiffTime / (1000 * 60 * 60 * 24));
}

/**
 * Number.prototype.format(n, x)
 *
 * @param integer
 *            n: length of decimal
 * @param integer
 *            x: length of sections
 */
Number.prototype.format = function(n, x) {
    var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
    return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&,');
};

function currentDate(startDate) {
    if (startDate == null || startDate == "") {
        return new Date();
    }
    var tempStr = startDate.split(".");
    //var tempStr = split(startDate, ".");
    if (tempStr.length == 2) {
        return new Date(Number(tempStr[0]), Number(tempStr[1]) - 1, 1);
    } else if (tempStr.length == 3) {
        return new Date(Number(tempStr[0]), Number(tempStr[1]) - 1,
                Number(tempStr[2]));
    }

    return new Date();
}

function currentDate2(startDate) {
    if (startDate == null || startDate == "") {
        return null;
    }
    var tempStr = startDate.split(".");
    //var tempStr = split(startDate, ".");
    if (tempStr.length == 2) {
        return new Date(Number(tempStr[0]), Number(tempStr[1]) - 1, 1);
    } else if (tempStr.length == 3) {
        return new Date(Number(tempStr[0]), Number(tempStr[1]) - 1,
                Number(tempStr[2]));
    }

    return new Date();
}

function changeGroupColor(companyName){
    if ( companyName == "" || companyName == null )
        return "";
    var length = companyName.length;
    var groupType = companyName.substring(length-4, length);
    var name = companyName.substring(0,length-4);
    if(groupType == "(현대)"){
        document.write( '<font color="blue">' + groupType + '</font></br>' + name );
    } else if(groupType == "(기아)"){
        document.write( '<font color="red">' + groupType + '</font></br>' + name );
    } else {
        document.write( companyName );
    }
};

function changeGroupAjaxColor(companyName)
{
    if ( companyName == "" || companyName == null )
        return "";
    var length = companyName.length;
    var groupType = companyName.substring(length-4, length);
    var name = companyName.substring(0,length-4);

    return groupType == "(현대)" ? '<font color="blue">' + groupType + '</font></br>' + name : '<font color="red">' + groupType + '</font></br>' + name;
}

function datepickerDateCheck(Obj)
{
    var strValue = Obj.value;
    var chk1 = /^(19|20)\d{2}.([1-9]|1[012]).([1-9]|[12][0-9]|3[01])$/;
    var chk2 = /^(19|20)\d{2}.([0][1-9]|1[012]).(0[1-9]|[12][0-9]|3[01])$/;
    //var chk2 = /^(19|20)\d{2}-([0][1-9]|1[012])-([012][1-9]|3[01])$/;
    if (strValue == "")
    { // 공백이면 무시
         return true;
    }

    //-------------------------------------------------------------------------------
    // 유효성 검사- 입력형식에 맞게 들왔는지 // 예) 2000-1-1, 2000-01-01 2가지 형태 지원
    //-------------------------------------------------------------------------------
    if (chk1.test(strValue) == false && chk2.test(strValue) == false)
    { // 유효성 검사에 둘다 성공하지 못했다면
       Obj.value = "";
       Obj.focus = true;
       return "1999.1.1 형식 또는 \r\n1999.01.01 형식으로 날자를 입력해주세요.";
    }

    //-------------------------------------------------------------------------------
    // 존재하는 날자(유효한 날자) 인지 체크
    //-------------------------------------------------------------------------------
    var bDateCheck = true;
    var arrDate = Obj.value.split(".");
    var nYear = Number(arrDate[0]);
    var nMonth = Number(arrDate[1]);
    var nDay = Number(arrDate[2]);

    if (nYear < 1900 || nYear > 3000)
    { // 사용가능 하지 않은 년도 체크
        bDateCheck = false;
    }

    if (nMonth < 1 || nMonth > 12)
    { // 사용가능 하지 않은 달 체크
        bDateCheck = false;
    }

    // 해당달의 마지막 일자 구하기
    var nMaxDay = new Date(new Date(nYear, nMonth, 1) - 86400000).getDate();
    if (nDay < 1 || nDay > nMaxDay)
    { // 사용가능 하지 않은 날자 체크
        bDateCheck = false;
    }

    if(bDateCheck == false)
    {
       return "존재하지 않은 년월일을 입력하셨습니다. 다시한번 확인해주세요";
    }

    return true;
}

/**
 * 한글포함 문자열 길이를 구한다
 */
function getTextLength(str) {
    var len = 0;
    for (var i = 0; i < str.length; i++) {
        if (escape(str.charAt(i)).length == 6) {
            len++;
        }
        len++;
    }
    return len;
}
//상점명 클릭하면 상세페이지로 이동하는 함수( parameter : 사업자번호 )
function linkToSalesBilling( businessNumber ) {
    $("#searchForm").toArray()[0].action = $("#detailUrl").val();
    /*$("#searchForm").toArray()[0]['startDate'].value = "";
    $("#searchForm").toArray()[0]['endDate'].value = "";*/
    $("#searchForm input[name$='Date']").val("");
    $("#itemShopCode").val( businessNumber );
    $("#sellerBizNo").val( businessNumber );
    $("#searchForm").submit();
}
//mask중 windowSize 변경시 mask 크기 변경 해주는 함수
$(window).resize(function(){
    $('#mask').css({'width':$(window).width(),'height':$(window).height()});
});

function notice_getcookie( name ){
    var nameOfcookie = name + "=";
    var x = 0;
    while ( x <= document.cookie.length )
    {
            var y = (x+nameOfcookie.length);
            if ( document.cookie.substring( x, y ) == nameOfcookie )
            {
                    if ( (endOfcookie=document.cookie.indexOf( ";", y )) == -1 ){
                            endOfcookie = document.cookie.length;
                    }
                    return unescape( document.cookie.substring( y, endOfcookie ) );
            }
            x = document.cookie.indexOf( " ", x ) + 1;
            if ( x == 0 )
            {
                    break;
            }
    }
    return "";
}
























