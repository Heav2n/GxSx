/**
 * 
 */

//var comno =  '${ficomments.comno}';
//
//$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시
//	var insertData = $('[name=commentInsertForm]').serialize(); 
//	console.log("insertData:" +insertData);
//	commentIsert(insertData);
//});



//댓글 목록
function commentList(lono){
		$.ajax({
			url : '../LostComment/list.do',
			type : 'get',
			data : {'lono':lono},
			success : function(data){
				var a = '';
				let count=1;
				if(result.length < 1){ 
	               htmls.push("등록된 댓글이 없쫑");
				}else{
					$(result).each(function(){		
			       
						+"<tr>"
						+"<td align='center'>댓글</td>"
						+"<c:forEach var='locomment' items='${locomment}''>"
						+"<td>${locomment.contents}</td>"
						+"</c:forEach>"
					+"</tr>"
					});
				}
	            $(".commentList").html(a);
	        }
	    });
	}
//댓글 등록
function commentInsert(lono){
	let newInput_html = "";
	console.log("lono : "+lono);
	let content = document.getElementById('comments').value;
	console.log("content : "+content);
	$.ajax({
		url : "../LostComment/insert.json",
		type : 'post',
		dataType : 'HTML',
		data : {
			'content': content,
			'lono': lono
			},
		success : function(data){ //list로 받음, 뽑을땐 반복문 돌려야함(for)
			$('#comment-table').html(data);
			console.log("기모리1");
		}
	});
}
var prevInput;
var click=0;
////댓글수정
function update_form_id(val){
	
	if(click>0){
		$('#update_txt_'+prevInput).remove();
		$('#btn'+prevInput).text("수정");
		$('#btn'+prevInput).attr("onclick", "update_form_id("+prevInput+");");		
	}
	click++;
	
	$('#btn'+val).text("수정완료");
	$('#btn'+val).attr("onclick", "submit("+val+");");
	console.log($("#ficom_input_"+val));
	if($("#ficom_input_"+val)[0].childElementCount == 0){
			console.log("val : "+val);
		console.log($("#ficomment_"+val)[0].childNodes[3].innerText);
		var u_txt = $("#ficomment_"+val)[0].childNodes[3].innerText;
		
		var inputTag = "<input type='text' name='contents' id='update_txt_"+ val +"'>";

		$("#ficom_input_"+val).append(inputTag);
		$("#update_txt_" + val)[0].value = u_txt;
	}
	console.log("1prevInput : "+prevInput);
	prevInput=val;
	console.log("2prevInput : "+prevInput);
}

function submit(index){
	click = 0;
	document.getElementById('form'+index).submit();
}
//댓글삭제
function commentDelete(val){
	console.log("제발들어와주세요!");
	let newInput_html = "";
	$.ajax({
		url : "../LostComment/delete.json",
		type : 'post',
		dataType : 'html',
		data: { comno : val},
		error: function(){
			alert("에러");
		},
		success : function(response){
			console.log("response :" + val);
			console.log(response);

			location.reload(true);
		}
	});
}



//
//$(document).ready(function(){
//	FindcommentList(); //페이지 로딩시 댓글 목록 출력
//});