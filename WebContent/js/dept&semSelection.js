
var elementDept = document.getElementById("department");
var elementSem = document.getElementById("semester");
var elementCat = document.getElementById("category");


function setDept(department){
				
			    	
			    	for ( var i = 0; i < elementDept.options.length; i++ ) {

			            if ( elementDept.options[i].text == department ) {

			                elementDept.options[i].selected = true;

			                return;

			            }

			        }
			    	
}
function setSemester(semester){
			    	
			    	for ( var i = 0; i < elementSem.options.length; i++ ) {

			            if ( elementSem.options[i].text == semester ) {

			                elementSem.options[i].selected = true;

			                return;

			            }

			        }
			    	
}
function setCategory(category){
	
	
	for ( var i = 0; i < elementCat.options.length; i++ ) {

        if ( elementCat.options[i].text == category ) {

            elementCat.options[i].selected = true;

            return;

        }

    }
	
}