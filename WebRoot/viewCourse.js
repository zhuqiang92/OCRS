window.onload = windowLoad;
//---------------------------------

//页面载入时调用
function windowLoad()
{
    cmnWindowLoad();
}

//2016/2/20 删除所选课程
function mydelete( varCourseId )
{
    form_main.courseId.value = varCourseId;
    form_main.submit();
}
