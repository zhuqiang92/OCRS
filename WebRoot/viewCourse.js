window.onload = windowLoad;
//---------------------------------

//页面载入时调用
function windowLoad()
{
    cmnWindowLoad();
}

//2016/2/20 删除所选课程
function myDelete( varDeletedId )
{
    form_main.deletedId.value = varDeletedId;
    form_main.submit();
}