window.onload = windowLoad;
//---------------------------------

//ҳ������ʱ����
function windowLoad()
{
    cmnWindowLoad();
}

//�ύ��
function choose( varCourseId )
{
    form_main.courseId.value = varCourseId;
    form_main.submit();
}
