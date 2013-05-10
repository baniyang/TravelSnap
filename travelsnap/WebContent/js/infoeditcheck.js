function CheckData()
     {
    	  var eMail = document.editForm.Email.value;
    	  var Age  =  document.editForm.Age.value;
    	  regmail=/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/gi;

         //email not null
         if(eMail == "")
         {
             alert("Email can not be null.");
             document.editForm.email.focus();
             return false;
         }
         //email format
         if(!regmail.test(eMail))
         {
         alert("wrong email format");
         document.editForm.Email.focus();
         return false;
         }
         
         //age not null
         if(Age == "")
         {
             alert("Age can not be null.");
             document.editForm.Age.focus();
             return false;
         }
         
             return true;
        
      }