$(".product_category_list").select2({
	placeholder:"Select category",
	width:"auto"
});
$(".product_list").select2({
	placeholder:"Select product",
	width:"auto",
	tags: true
	
});
$(".product_supplier_list").select2({
	placeholder:"--------------Select supplier from the given list first-------------",
	width:"auto",
	tags: true,
	allowClear : true
	
});

$("#paymentPanel").hide();