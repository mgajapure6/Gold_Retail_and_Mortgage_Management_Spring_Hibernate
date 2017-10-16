
$('#productListTable').DataTable({});

$(".select2").select2({
	placeholder:"Select category from list",
	allowClear:!0,
	width:"auto",
	
});

var FormValidation=function(){

	var e=function(){
		var e=$("#addProductForm"),
		r=$(".alert-danger",e),
		i=$(".alert-success",e);
		e.validate({
			errorElement:"span",
			errorClass:"help-block help-block-error",
			focusInvalid:!1,
			ignore:"",
			rules:{
				i_category_id:{required:!0},
				i_product_name:{required:!0,minlength:3},
				i_product_price:{required:!0,number:!0},
				i_product_quantity:{required:!0,digits:!0},
				i_product_supplier_name:{required:!0,minlength:3,}
			},
			messages: {
				i_category_id: "Please, Select Category from list.",
				i_product_name:{required:"Please, Enter Product name.",minlength:"Please, Enter more than 3 character."},
				i_product_price:{required:"Please, Enter Product price",number:"Please, Enter only degits and fraction number."},
				i_product_quantity:{required:"Please, Enter Product quantity",digits:"Please, Enter only number."},
				i_product_supplier_name:{required:"Please, Enter Product Supplier name.", minlength:"Please, Enter more than 3 character."}
			},
			invalidHandler:function(e,t){
				i.hide(),
				r.show(),
				App.scrollTo(r,-200)
			},
			errorPlacement:function(e,r){
				var i=$(r).parent(".input-icon").children("i");
				i.removeClass("fa-check").addClass("fa-warning"),
				i.attr("data-original-title",e.text()).tooltip({container:"body"})
			},
			highlight:function(e){
				$(e).closest(".form-group").removeClass("has-success").addClass("has-error")
			},
			unhighlight:function(e){},
			success:function(e,r){
				var i=$(r).parent(".input-icon").children("i");
				$(r).closest(".form-group").removeClass("has-error").addClass("has-success"),
				i.removeClass("fa-warning").addClass("fa-check")
			},
			submitHandler:function(e){
				i.show(),
				r.hide(),
				sendForm();
			}
		})
	};
	
	return{
		init:function(){
			e()
		}
	}
}();
jQuery(document).ready(function(){
	FormValidation.init()
});

function sendForm(){
	 $.ajax({
			method : "post",
			dataType : "json",
			data : $('#addProductForm').serialize(),
			success : function(data) {
				if(data==="success"){
					swal({
						  title: "Success",
						  text: "Product Added Successfully.",
						  type: "success",
						  showCancelButton: false,
						  confirmButtonColor: "#DD6B55",
						  confirmButtonText: "Ok, Save",
						  closeOnConfirm: false
						},
						function(){
							window.location.href = window.location.href;
						});
				}else{
					swal("Oops! Failed",data, "error");
				}
			},
			error : function() {
				swal("Oops! Failed","Unable To Save Product.", "error");
			}
		});
};