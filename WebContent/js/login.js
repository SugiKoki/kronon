$(function () {

$(document).ready(function(){

	if(popFlag==2){
		let popFlag = document.getElementById('flag').value;
	    console.log(popFlag);
		$('.error-popup').fadeIn();
		popFlag=3;
		return;
	}

});



$('.login-button').click(function () {
	let mail = document.getElementById('login_mail').value;
	let password = document.getElementById('login_pass').value;

if (mail=='' || password=='') {
		popFlag='1';
}else{
		popFlag='0';
}





if(popFlag=='0'){
	  $('.login-form').submit();
}

if(popFlag=='1'){
    $('.login_msg').html('入力されていない<br>項目があるよ');
	$('.error-popup').fadeIn();
	popFlag='0';
	return;
}


});

$('.close-popup').click(function () {
    $('.confirm-popup').fadeOut();
    $('.error-popup').fadeOut();
    $('.back-popup').fadeOut();
    let password = document.getElementById('login_pass');
	password.value='';
  });

});
