function CheckData() {
	
	var old = document.passform.oldPwd.value;
	var password = document.passform.newPwd.value;
	var passconfirm = document.passform.newPwdCon.value;

	if (old.value == "") {
		alert("Old password can not be null.");
		document.passform.oldPwd.focus();
		return false;
	}
	
	if (old.length < 8 || old.length > 20) {
		alert("Old password should be between 8--20 characters.");
		document.passform.oldPwd.focus();
		return false;

	}
	if (password.value == "") {
		alert("Password can not be null.");
		document.passform.newPwd.focus();
		return false;
	}
	if (password != passconfirm) {
		alert("Passwords are not the same.");
		document.passform.newPwdCon.focus();
		return false;
	}

	if (password.length < 8 || password.length > 20) {
		alert("Password should be between 8--20 characters.");
		document.passform.newPwd.focus();
		return false;

	}

	return true;

}