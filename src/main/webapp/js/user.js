/**
 * 
 */

 		$('#btnChkId').click(function(){
	    	var id=$('#registerId').val();
	        open('login/checkId.jsp?userId='+id,'dup',
	        	'width=590,height=300,location=yes,resizable=yes,left=0,top=0');
	    });
	    
	    