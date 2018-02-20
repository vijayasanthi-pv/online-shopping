$(function(){
	//solving the active menu problem
	switch(menu){
	case 'About Us':
		$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;
	case 'All Products':
		$('#listProducts').addClass('active');
		break;
	case 'Manage Products':
		$('#manageProducts').addClass('active');
		break;
	default:
		if (menu == "Home") break;
		$('#listProducts').addClass('active');
		$('#a_'+menu).addClass('active');
	break;
	}
	
	//code for jquery dataTable
		
	
	var $table = $('#productListTable');
	
	//execute the below code only where we have this table
	if ($table.length){
		
		//console.log('Inside the table!');
		
		var jsonUrl = '';
		if(window.categoryId==''){
			jsonUrl = window.contextRoot+"/json/data/all/products";
		}else{
			jsonUrl = window.contextRoot+"/json/data/category/"+window.categoryId+"/products";
		}
		
		$table.DataTable({
			lengthMenu : [[3,5,7,-1],['3 Records','5 Records','7 Records','ALL Records']],
			pageLength : 5,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			autoWidth : false,
			columns : [
				{
					data : 'code',
					mRender : function(data,type,row){
						return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class="dataTableImg"/>';
					}
				},
				{
					data : 'name',
					
				},
				{
					data : 'brand',
					
				},
				{
					data : 'unitPrice',
					mRender : function(data,type,row){
						return '&#8377;'+data;
					}
					
				},
				{
					data : 'quantity',
					mRender : function(data,type,row){
						if (data < 1){
							return '<span style="color:red">Out Of Stock!</span>';
						}
						return data;
					}
					
				},
				{
					data : 'id',
					bSortable :false,
					mRender : function(data,type,row){
						var str = '';
						str += '<a href="'+window.contextRoot+'/show/'+data+'/product" class="btn btn-primary"><i class="fa fa-eye"></i></a>&#160;';
						if (row.quantity<1){
							str += '<a href="javascript:void(0)" class="btn btn-success disabled"><i class="fa fa-cart-plus"></i></a>';							
						}else{
							str += '<a href="'+window.contextRoot+'/cart/add/'+data+'/product" class="btn btn-success"><i class="fa fa-cart-plus"></i></a>';
						}
						
						
						return str;
					}
					
				}
			]
		});
		
	}
	
	//dismissing the alert after 3 seconds
	var $alert = $('.alert');
	
	if ($alert.length){
		setTimeout(function(){$alert.fadeOut('slow');},3000);
	}
	
	//--------------------------------
	
	
	//------------data table for admin-------------
var $adminProductsTable= $('#adminProductsTable');
	
	//execute the below code only where we have this table
	if ($adminProductsTable.length){
		
		var jsonUrl = window.contextRoot+'/json/data/admin/all/products';
		
		$adminProductsTable.DataTable({
			lengthMenu : [[10,30,50,-1],['10 Records','30 Records','50 Records','ALL Records']],
			pageLength : 30,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			autoWidth : false,
			columns : [
				{
					data : 'id'
				},
				{
					data : 'code',
					mRender : function(data,type,row){
						return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class="adminDataTableImg"/>';
					}
				},
				{
					data : 'name',
					
				},
				{
					data : 'brand',
					
				},
				{
					data : 'quantity',
					mRender : function(data,type,row){
						if (data < 1){
							return '<span style="color:red">Out Of Stock!</span>';
						}
						return data;
					}
					
				},
				{
					data : 'unitPrice',
					mRender : function(data,type,row){
						return '&#8377;'+data;
					}
					
				},
				{
					data : 'active',
					bSortable : false,
					mRender : function(data,type,row){
						var str = '';
						str += '<label class="switch">';
						if (data){
							str += '<input type="checkbox" checked="checked" value="'+row.id+'"/>';
						}else{
							str += '<input type="checkbox" value="'+row.id+'"/>';
						}
						str += '<div class="slider round"></div></label>';
						return str;
					}
				},
				{
					data : 'id',
					bSortable : false,
					mRender : function(data,type,row){
						var str = '';
						str += '<a href="'+window.contextRoot+'/manage/'+data+'/product" class="btn btn-warning">';
						str += '<i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>';
						return str;
					}
				}
			],
			initComplete : function(){
				var api = this.api();
				api.$('.switch input[type="checkbox"]').on('change',function(){
					var checkbox = $(this);
					var checked = checkbox.prop('checked');
					var dMsg = (checked)?'You want to activate the product?':
										 'You want to deactivate the product?';
					var value = checkbox.prop('value');
					
					bootbox.confirm({
						title : 'Product Activation & Deactivation',
						size : 'medium',
						closeIconClass: 'fa fa-close',
						message : dMsg,
						callback : function(confirmed){
							if (confirmed){
								console.log(value);
								
								var activationUrl = window.contextRoot + '/manage/product/' + value + '/activation';
								$.post(activationUrl, function(data){
									bootbox.alert({
										size : 'medium',
										title : 'Information',
										message : data
									}).find('.modal-header').css({
										'display':'flex',
										'flex-direction':'row-reverse'
									});
								});
							}else{
								checkbox.prop('checked',!checked);
							}
						}
						
					}).find('.modal-header').css({
						'display':'flex',
						'flex-direction':'row-reverse'
					});
				});
			}
		});
		
	}
	
	
	//------------------------------------------------
	//validation code for category
	var $categoryForm = $('#categoryForm');
	
	if( $categoryForm.length){
		$categoryForm.validate({
			rules : {
				name : {
					required: true,
					minlength:2
				},
				description :{
					required: true
				}
			},
			messages :{
				name : {
					required : 'Please add the category name!',
					minlength : 'The category name should not be less than 2 characters'
				},
				description : {
					required : 'Please add a description for this category!'
				}
			},
			errorElement : 'em',
			errorPlacement : function (error,element){
				//add the class of help-block
				error.addClass('help-block');
				//add the error element after the input element
				error.insertAfter(element);
			}
		});
	}
	
	//---------------------------------
	
	
});
