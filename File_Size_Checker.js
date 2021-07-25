function FileSizeChecker(p_item,p_size)
{
var file_size = $(p_item)[0].files[0].size;
		var x = file_size/1024;
		if (x >= p_size) 
		{
	//	$(p_item).val(''); 
		$x(p_item).value = null;
	apex.message.alert('File size should be < '+p_size +' KB');

		}
return file_size;
}

