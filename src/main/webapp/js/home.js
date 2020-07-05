/**
 * 
 */

    var editableGrid = null;
    
        $(document).ready(function() {
    	$.ajax({
    		  url: '/policy/all',
    		  dataType: 'json',
    		  async: true,
    		  success: function(response) {
    			  loadData(response);
    		  }
    		});
		
    	$.ajax({
  		  url: '/policy/details',
  		  dataType: 'json',
  		  async: true,
  		  success: function(response) {
  			$('#policydet').dataTable({
  	  		    processing: true,
  	  		    data: response
  	  		  });
  		  }
  		});
    	
    	var loadData=function(json) 
        {
			if(json.length>0 && hasEditRights())
			{
				$('#message').html(" [Click on the row to edit]");
			}
        	editableGrid = new EditableGrid("DemoGridSimple", {
        		
        		// called when the XML has been fully loaded 
        		tableLoaded: function() { 

        			// render the grid
        			this.renderGrid("tablecontent", "testgrid"); 
        		},
        		
        		// called when some value has been modified: we display a message
        		modelChanged: function(rowIdx, colIdx, oldValue, newValue, row) { updatePolicy(row,rowIdx+1); }
        	});
        	var metadata = [];
    		metadata.push({ name: "id", label: "Id", datatype: "integer", editable: false});
    		metadata.push({ name: "pname", label:"Policy Name", datatype: "string", editable: ((hasEditRights())?true:false)});
    		metadata.push({ name: "pdescription", label: "Policy Description", datatype: "string", editable: ((hasEditRights())?true:false)});
    		var data = [];
    		for(var i = 0; i < json.length; i++) {
    		    var jsonObj = json[i];
    		    var obj = new Object();
    		    obj.id = i;
    		    obj.values  = jsonObj;
    		    data.push(obj);
    		}
        	editableGrid.load({"metadata": metadata, "data": data});
    		editableGrid.renderGrid("tablecontent", "testgrid");
        }
        
        var updatePolicy=function(row,rowIdx){
        	var obj=new Object();
        	obj.id=row.cells[0].innerHTML;
        	obj.pname=row.cells[1].innerHTML;
        	obj.pdescription=row.cells[2].innerHTML;
        	var json=JSON.stringify(obj);
        	
        	var header = $("meta[name='_csrf_header']").attr("content");
        	var token = $("meta[name='_csrf']").attr("content");
        	
        	$.ajax({
        	  type:"PUT",
      		  url: '/policy/update',
      		  dataType: 'json',
      		  contentType: "application/json; charset=utf-8",
      		  data:json,
      		  async: true,
    	  		beforeSend: function(xhr){
    	  	        xhr.setRequestHeader(header, token);
    	  	    },
      		  success: function(response) {
      			  $('#message').html(" [Row "+rowIdx+" updated!]");
      		  },
    	  		error: function (xhr, ajaxOptions, thrownError) {
    	  			$('#message').html(" [Row "+rowIdx+" updation failed.Check your network or try again later.]");
    	  	        console.log(xhr.status + ": " + thrownError);
    	  	    }
      		});
        	
        }
		var hasEditRights=function(){
			return ($('#hasAuthority').length && $('#hasAuthority').val());
		}
    } );
