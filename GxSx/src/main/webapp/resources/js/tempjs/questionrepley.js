/**
 * 
 */
function qreply(qno, content){ 
	var newInput_html = "";
	newInput_html+="<label for='content'>comment</label>"
    
    +"<form action='reupdate.do' method='GET'>"
        +"<div class='input-group'>"
           +"<input type='hidden' id='qno' name='qno' value='"+qno+"'/>"
           +"<input type='text' class='form-control' id='content' value='"+content+"' name='content' placeholder='내용을 입력하세요.'>"
           +"<span class='input-group-btn'>"
                +"<button class= btn btn-default type=submit>등록</button>"
           +"</span>"
          +"</div>"
    +"</form>";
    
	document.getElementById("comment-input").innerHTML = newInput_html;
}