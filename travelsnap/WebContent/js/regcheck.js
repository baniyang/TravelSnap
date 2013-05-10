function CheckData() {
	
	var userName = document.regForm.name.value;
	var password = document.regForm.password.value;
	var passconfirm = document.regForm.pwdConfirm.value;
	var eMail = document.regForm.email.value;
	var age = document.regForm.age.value;

	// regage=\.[0-9]{2,3};
	regmail = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/gi;
	
	// username not null
	if (userName == "") {
		alert("Username can not be null.");
		document.regForm.name.focus();
		return false;
	}
	// password not null
	if (password == "") {
		alert("Password can not be null.");
		document.regForm.password.focus();
		return false;
	}
	// password confirm
	if (password != passconfirm) {
		alert("Passwords are not the same.");
		document.regForm.pwdConfirm.focus();
		return false;
	}
	// email not null
	if (eMail == "") {
		alert("Email can not be null.");
		document.regForm.email.focus();
		return false;
	}
	// email format
	if (!regmail.test(eMail)) {
		alert("wrong email format");
		document.regForm.email.focus();
		return false;
	}
	
	// password format
	if (password.length < 8 || password.length > 20) {
		alert("Password should be between 8--20 characters.");
		document.regForm.password.focus();
		return false;

	}

	// age not null
	if (age == "") {
		alert("Age can not be null.");
		document.regForm.age.focus();
		return false;
	}

	return true;

}