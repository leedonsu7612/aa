$(function() {
	$("a[href='#']").click(function(event) {
		event.preventDefault();      
	}); 
	
	
	$(".select-bx select").each(function(){
		var selectTarget = $(this);
		selectTarget.change(function(){
			var select_name = $(this).children('option:selected').text();
			selectTarget.siblings('label').text(select_name);
		});
	});
	
	$('.input_file').each(function(){
		$(this).change(function(){
			var i = $(this).val();
			$(this).siblings('.upload_text').val(i);
		});
	});
	$('.input_file2').change(function(){
		var i = $(this).val();
		$(this).siblings('.upload_text').val(i);
	});

    // 숫자만 입력가능 ex) input 속성에 numberOnley = "true" 설정
    $(document).on("keyup", "input:text[numberOnly]", function() {
        $(this).val($(this).val().replace(/[^0-9]/gi, ""));
    });

	
    // popup drag
    $(".pop_draggable").mousedown(function( event1, event2, event3 )
    {
    	$(this).parent().draggable();
    });

    $(".pop_draggable").mouseup(function( event1, event2, event3 )
    {
    	$(this).parent().draggable( "destroy" );
    });

    // 페이지 경고창 확인 버튼
    $(".popokbtn").click(function() {
        $(".abc").fadeOut("slow");
    });
});

//화면 불투명 처리 함수
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

}

//알림팝업 마스킹 처리
function closeMaskedPopup( obj ) {
    $('#mask').hide();
    $(obj).fadeOut("slow");
}

function closePopup( obj ) {
    $(obj).hide();
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function pad(n, width) {
	n = n + '';
	return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}