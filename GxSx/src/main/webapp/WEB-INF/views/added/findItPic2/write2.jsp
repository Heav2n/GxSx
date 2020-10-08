<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title> GxSx </title>
	<meta charset="utf-8">
	<style>
		table, th, td {
		   border: 1px solid black;
		   border-collapse: collapse;
		}
		th, td {
		   padding: 5px;
		}
		a { text-decoration:none }
	</style>
	
	<style type="text/css">
	
	#tabFileName{
		width: 470px;
		text-align: left;
	}
	
	#tabFileSize{
		width: 70px;
	}
	
	#tabFileDel{
		width: 50px;
	}
	
	table , tr , td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	.dragAndDropDiv {
                border: 2px dashed #92AAB0;
                width: 650px;
                height: 100%;
                color: #92AAB0;
                text-align: center;
                vertical-align: middle;
                padding: 10px 0px 10px 10px;
                font-size:200%;
                display: table-cell;
            }
            .progressBar {
                width: 200px;
                height: 22px;
                border: 1px solid #ddd;
                border-radius: 5px; 
                overflow: hidden;
                display:inline-block;
                margin:0px 10px 5px 5px;
                vertical-align:top;
            }
             
            .progressBar div {
                height: 100%;
                color: #fff;
                text-align: right;
                line-height: 22px; /* same as #progressBar height if we want text middle aligned */
                width: 0;
                background-color: #0ba1b5; border-radius: 3px; 
            }
            .statusbar{
                border-top:1px solid #A9CCD1;
                min-height:25px;
                width:99%;
                padding:10px 10px 0px 10px;
                vertical-align:top;
            }
            .statusbar:nth-child(odd){
                background:#EBEFF0;
            }
            .filename{
                display:inline-block;
                vertical-align:top;
                width:250px;
            }
            .filesize{
                display:inline-block;
                vertical-align:top;
                color:#30693D;
                width:100px;
                margin-left:10px;
                margin-right:5px;
            }
            .abort{
                background-color:#A8352F;
                -moz-border-radius:4px;
                -webkit-border-radius:4px;
                border-radius:4px;display:inline-block;
                color:#fff;
                font-family:arial;font-size:13px;font-weight:normal;
                padding:4px 15px;
                cursor:pointer;
                vertical-align:top
            }
	
</style>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
        var objDragAndDrop = $(".dragAndDropDiv");
        
        $(document).on("dragenter",".dragAndDropDiv",function(e){
            e.stopPropagation();
            e.preventDefault();
            $(this).css('border', '2px solid #0B85A1');
        });
        $(document).on("dragover",".dragAndDropDiv",function(e){
            e.stopPropagation();
            e.preventDefault();
        });
        $(document).on("drop",".dragAndDropDiv",function(e){
            
            $(this).css('border', '2px dotted #0B85A1');
            e.preventDefault();
            var files = e.originalEvent.dataTransfer.files;
        
            handleFileUpload(files,objDragAndDrop);
        });
        
        $(document).on('dragenter', function (e){
            e.stopPropagation();
            e.preventDefault();
        });
        $(document).on('dragover', function (e){
          e.stopPropagation();
          e.preventDefault();
          objDragAndDrop.css('border', '2px dotted #0B85A1');
        });
        $(document).on('drop', function (e){
            e.stopPropagation();
            e.preventDefault();
        });
        //drag 영역 클릭시 파일 선택창
        objDragAndDrop.on('click',function (e){
            $('input[type=file]').trigger('click');
        });

        $('input[type=file]').on('change', function(e) {
            var files = e.originalEvent.target.files;
            handleFileUpload(files,objDragAndDrop); //아 여기서 그 프로세스바가 여기서타니까? 웅 잠시만 얘가 아닐수도 있어 
        });
        
        function handleFileUpload(files,obj)
        {
        	//요기 호출해서 파일 담구 --> 지금 얘가 이벤트로 되서 실행되잖아?웅 근데 이 이벤트를 submit할때로 바꾸면 될것 같긴 해
        	//음..근데 얘도 한개씩보내는데...파일리스트를 담아서 리스트를 보내는걸 만들어야하지않아? 그렇지
        			//전체데이터 아까 오빠가 카톡으로 보내준 거 불러오려면 뭐써야해 펑션 이썽? 그거 이소스가 아니야 ㅋㅋㅋ다른 예제 참조해서 해보다가
        					//아 오키 그럼 대충..
           for (var i = 0; i < files.length; i++) 
           {
                var fd = new FormData();
                fd.append('file', files[i]);
         
                var status = new createStatusbar(obj); //Using this we can set progress.
                status.setFileNameSize(files[i].name,files[i].size);
                sendFileToServer(fd,status);
//들어옴       		alert(555555555555);
         		uploadFileList.push(fd);
           }
        }
        
        var rowCount=0;
        function createStatusbar(obj){
                
            rowCount++;
            var row="odd";
            if(rowCount %2 ==0) row ="even";
            this.statusbar = $("<div class='statusbar "+row+"'></div>");
            this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
            this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
            this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
            this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
            
            obj.after(this.statusbar);
         
            this.setFileNameSize = function(name,size){
                var sizeStr="";
                var sizeKB = size/1024;
                if(parseInt(sizeKB) > 1024){
                    var sizeMB = sizeKB/1024;
                    sizeStr = sizeMB.toFixed(2)+" MB";
                }else{
                    sizeStr = sizeKB.toFixed(2)+" KB";
                }
         
                this.filename.html(name);
                this.size.html(sizeStr);
            }
            
            this.setProgress = function(progress){       
                var progressBarWidth =progress*this.progressBar.width()/ 100;  
                this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                if(parseInt(progress) >= 100)
                {
                    this.abort.hide();
                }
            }
            
            this.setAbort = function(jqxhr){
                var sb = this.statusbar;
                this.abort.click(function()
                {
                    jqxhr.abort();
                    sb.hide();
                });
            }
        }
        
        function sendFileToServer(formData,status) //formData를 리스트로받아서
        {
            var uploadURL = "/GxSx/src/main/webapp/resources/imgs"; //Upload URL ㅇㅒ어디랫지
            var extraData ={}; //Extra Data.
            var jqXHR=$.ajax({
                    xhr: function() {
                    var xhrobj = $.ajaxSettings.xhr();
                    if (xhrobj.upload) {
                            xhrobj.upload.addEventListener('progress', function(event) {
                                var percent = 0;
                                var position = event.loaded || event.position;
                                var total = event.total;
                                if (event.lengthComputable) {
                                    percent = Math.ceil(position / total * 100);
                                }
                                //Set progress
                                status.setProgress(percent);
                            }, false);
                        }
                    return xhrobj;
                },
                url: uploadURL,
                type: "POST",
                contentType:false,
                processData: false,
                cache: false,
                data: formData,
                success: function(data){
                    status.setProgress(100);
                    alert(111);
         
                    //$("#status1").append("File upload Done<br>");           
                },
                error : function(data) {
                	alert(222);
                }
            }); 
         
            status.setAbort(jqXHR);
        }
        
    });
	</script>
	
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="../js/map.js"></script>
<script type="text/javascript" src="../js/stringBuffer.js"></script>
	
	<script type="text/javascript">
	//폼에 데이터를 추가하기 위해 (파일을 전송하기 전 정보 유지)
	var fd = new FormData();
	//파일 중복 업로드 방지용 맵을 선언한다.
	var map = new Map();
	//submit 버튼을 눌렀을 때 
	var uploadFileList = [];
// 	function submitFile(){//요기서 파일리스트를 받아오면? 버튼 눌렀을때?웅  그럼 전체 데이터 다 입력하고 전송 시점에 프로그래스바랑 이게 작동되는거지
// 			//그럼 여기서 받아서 저장하는것만 하면되지않으?
// 		// 응 그럼 돼지 sumitfile누를때 파일리스트 어케 받아와?고것만하면될거같은디ㅑ
// 				//아그롬 글로벌로 리스트하나빼서 드래그드랍할때 그그 리스트에 담고 그걸 여기서 불러오면?
// 		//추가적으로 보낼 파라미터가 있으면 formData에 넣어준다. 
// 		//예를들어 , 게시판의 경우 게시글 제목 , 게시글 내용 등등
// // 		fd.append('temp',$('#temp').val());  
//      	var AllData = new Map();
//         AllData.put('fiuid',$('#fiuid').val()); 
//         console.log("uploadFileList");
//         console.log(uploadFileList);
//         AllData.put('filelist',uploadFileList);
//         //요기서 에런데 저 status 를 걍 success로 박아볼게잠만
// //         sendFileToServer2(AllData);//일단 이렇게 해보쟙 근데 저 fino여기 뭐하나 넣어줘바 실제 데이터 ㅋㅋㅋ 우웅
				
// 		//ajax로 이루어진 파일 전송 함수를 수행시킨다.
// 		//sendFileToServer();
// 		//여기부터 수정해야곘당 알겠슴미닷  요기가 전송 버튼 누르면 자바단 으로 넘기는 부분이니까 요쪽 한번 해보고 있어보셈 알겠어유
// 	}

    //왜 얘를 못찾아..
    function sendFileToServer2(formData) //formData를 리스트로받아서
    {
    	console.log(formData);
        var uploadURL = "/GxSx/src/main/webapp/resources/imgs"; //Upload URL ㅇㅒ어디랫지
        $.ajax({
            url: uploadURL,
            type: "POST",
            contentType:false,
            processData: false,
            cache: false,
            data: formData,
            success: function(data){
                alert(111);
     
                //$("#status1").append("File upload Done<br>");           
            },
            error : function(data) {
            	alert(222);
            }
        }); 
    }
    
// 	파일 전송 함수이다. 
// 	20200831 주석
// 	var sendFileToServer = function() {
// 		$.ajax({
// 			type : "POST",
// 			url : "/GxSx/src/main/webapp/resources/imgs", //Upload URL
// 			data : fd,
// 			contentType : false,
// 			processData : false,
// 			cache : false,
// 			success : function(data) {
// 				if(data) {
// 					alert('성공');
// 					location.href='list';
// 				}else {
// 					alert('실패');
// 				}
// 			}
// 		});
// 	} 
	function handleFileUpload(files) { //갠얜데 
		//파일의 길이만큼 반복하며 formData에 셋팅해준다.
		var megaByte = 1024*1024;
		for (var i = 0; i < files.length; i++) {
			if(map.containsValue(files[i].name) == false && (files[i].size/megaByte) <= 20 ){
				fd.append(files[i].name, files[i]);
				//파일 중복 업로드를 방지하기 위한 설정
				map.put(files[i].name, files[i].name);
				// 파일 이름과 정보를 추가해준다.
				var tag = createFile(files[i].name, files[i].size);
				$('#fileTable').append(tag);
			}else{
				//중복되는 정보 확인 위해 콘솔에 찍음
				if((files[i].size/megaByte) > 20){
					alert(files[i].name+"은(는) \n 20메가 보다 커서 업로드가 할 수 없습니다.");
				}else{
					alert('파일 중복 : ' + files[i].name);
				}
			}
	    }
	}
	// 태그 생성
	function createFile(fileName, fileSize) {
		var file = {
				name : fileName,
				size : fileSize,
				format : function() {
					var sizeKB = this.size / 1024;
					if (parseInt(sizeKB) > 1024) {
						var sizeMB = sizeKB / 1024;
						this.size = sizeMB.toFixed(2) + " MB";
					} else {
						this.size = sizeKB.toFixed(2) + " KB";
					}
					//파일이름이 너무 길면 화면에 표시해주는 이름을 변경해준다.
					if(name.length > 70){
						this.name = this.name.substr(0,68)+"...";
					}
					return this;
				},
				tag : function() {
					var tag = new StringBuffer();
					tag.append('<tr>');
					tag.append('<td>'+this.name+'</td>');
					tag.append('<td>'+this.size+'</td>');
					tag.append("<td><button id='"+this.name+"' onclick='delFile(this)'>취소</button></td>");
					tag.append('</tr>');
					return tag.toString();					
				}
		}
		return file.format().tag();
	}
	//업로드 할 파일을 제거할 때 수행되는 함수
	function delFile(e) {
		//선택한 창의 아이디가 파일의 form name이므로 아이디를 받아온다.
		var formName = e.id;
		
		//form에서 데이터를 삭제한다.
		fd.delete(formName);
		
		//맵에서도 올린 파일의 정보를 삭제한다.
		map.remove(formName);
		// tr을 삭제하기 위해
		$(e).parents('tr').remove();
		alert('삭제 완료!');		
	}
	$(document).ready(function() {
		var objDragDrop = $(".dragDropDiv");
		// div 영역으로 드래그 이벤트호출
		$(".dragDropDiv").on("dragover",
			function(e) {
				e.stopPropagation();
				e.preventDefault();
				$(this).css('border', '2px solid red');
		});
		// 해당 파일 드랍시 호출 이벤트
		// 요기도 있지롱~ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ많네...음 잠시만그럼
		
		$(".dragDropDiv").on("drop", function(e) {
			$(this).css('border', '2px solid green');
			//브라우저로 이동되는 이벤트를 방지하고 드랍 이벤트를 우선시 한다.
			e.preventDefault();
			//DROP 되는 위치에 들어온 파일 정보를 배열 형태로 받아온다.
			var files = e.originalEvent.dataTransfer.files;
			//DIV에 DROP 이벤트가 발생 했을 때 다음을 호출한다.
			handleFileUpload(files);
			
			//sendFileToServer(); //테스팅 20200108
// 			submitFile(); //테스팅 20200108
		});
		// div 영역빼고 나머지 영역에 드래그 원래색변경
		$(document).on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			objDragDrop.css('border', '2px solid green');
		});
	});
</script>
</head>
<body> 
<center>
<font color='gray' size='4' face='휴먼편지체'>
<hr width='600' size='2' color='gray' noshade>
<h3> Write </h3>
</font>
<font color='gray' size='4' face='휴먼편지체'>
<a href='list.do'>목록</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href='write2.do'>글쓰기</a><br/>
</font>
<hr width='600' size='2' color='gray' noshade>
</center>

<form name='input' method='post' action='/finditem/write2.do' enctype="multipart/form-data">
<table border='0' width='600' align='center' cellpadding='3' cellspacing='1' bordercolor='gray'>	
	<tr>
	   <td width='20%' align='center' >작성자</td>
	   <td>
	      <input name='fiuid' id='fiuid'/>
	   </td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td width='20%' align='center'>등록날짜</td> -->
<!-- 		<td><input name='fidate' /></td> -->
<!-- 	</tr> -->
	
	<tr>
		<td align='center'>종류</td>
		<td>
			<select name="ficname" id="cname">
			  <option value="가방">가방</option>
			  <option value="귀금속">귀금속</option>
			  <option value="도서용품">도서용품</option>
			  <option value="서류">서류</option>
			  <option value="산업용품">산업용품</option>
			  <option value="핸드폰">핸드폰</option>
			  <option value="현금">현금</option>
			  <option value="카드">카드</option>
			  <option value="노트북">노트북</option>
			  <option value="악기">악기</option>
			  <option value="지갑">지갑</option>
			  <option value="증명서">증명서</option>
			  <option value="스포츠용품">스포츠용품</option>
			  <option value="전자기기">전자기기</option>
			  <option value="자동차">자동차</option>
			  <option value="의류">의류</option>
			  <option value="기타">기타</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td align='center'>제목</td>
		<td><input name='fisub' /></td>
	</tr>
				
	<tr>
		<td align='center'>내용</td>
		<td><textarea id='ta' name='ficon' rows='10' cols='70'></textarea></td>
	</tr>
	
	<tr>
		<td align='center'>지역</td>
		<td>
			<select name="fiano" id="ano">
			  <option value="02">서울</option>
			  <option value="051">부산</option>
			  <option value="053">대구</option>
			  <option value="032">인천</option>
			  <option value="062">광주</option>
			  <option value="042">대전</option>
			  <option value="052">울산</option>
			  <option value="044">세종</option>
			  <option value="031">경기</option>
			  <option value="033">강원</option>
			  <option value="043">충북</option>
			  <option value="041">충남</option>
			  <option value="063">전북</option>
			  <option value="061">전남</option>
			  <option value="054">경북</option>
			  <option value="055">경남</option>
			  <option value="064">제주</option>
			  <option value="0">기타</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td align='center'>위치</td>
		<td><input name='fiplace' /></td>
	</tr>
	<tr>
		<td align='center'>보관위치</td>
		<td><input name='fistor' /></td>
	</tr>
	
<!-- 	<tr> -->
<!-- 		<td align='center'>완료여부</td> -->
<!-- 		<td> -->
<!-- 		<form action="fifin"> -->
<!-- 		  <input type="radio" name="fifin" value="ing" checked> 미완료 -->
<!-- 		  <input type="radio" name="fifin" value="finish"> 완료<br> -->
<!-- 		</form> -->
<!-- 		</td> -->
<!-- 	</tr> -->
	<center>
		<input type="submit"  onclick="" value="전송">
		<input type="hidden" value="추가데이터테스트!" name='temp' id='temp'>
	<div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here or Browse Files</div>
        <input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
	</center>
	
</table>
</form>
</body>
</html>

