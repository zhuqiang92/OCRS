window.onload = windowLoad;
//---------------------------------

//ҳ������ʱ����
function windowLoad()
{
    cmnWindowLoad();
    form_main.courseId.focus();
}

//��reset��ʱ����Ҫ�������⴦��
function resetForm()
{
    form_main.courseId.focus();
}

//��¼ǰ�ļ��
function checkInput()
{
    //���γ̱��
    if ( form_main.courseId.value.length < 6 )
    {
        form_main.courseId.focus();
        form_main.courseId.select();
        alert("�γ̱�ű�������6λ�ַ���");
        return false;
    }
    
    //���γ�����
    if ( form_main.courseName.value.length < 1 )
    {
        form_main.courseName.focus();
        form_main.courseName.select();
        alert("�γ����Ʋ���Ϊ�գ�");
        return false;
    }
    
    //����ʦ����
    if ( form_main.teacher.value.length < 1 )
    {
        form_main.teacher.focus();
        form_main.teacher.select();
        alert("��ʦ��������Ϊ�գ�");
        return false;
    }
    
    //���ѧ��
    if ( form_main.point.value < "1" || form_main.point.value > "6" )
    {
        form_main.point.focus();
        form_main.point.select();
        alert("ѧ�ֱ�������1��6֮������֣�");
        return false;
    }
    
    //�����������
    if ( form_main.limited.value.length < 1 )
    {
        form_main.limited.focus();
        form_main.limited.select();
        alert("������������Ϊ�գ�");
        return false;
    }
    
    //���γ�ʱ��
    if ( form_main.time1D.value + form_main.time1T.value == form_main.time2D.value + form_main.time2T.value )
    {
        form_main.time1D.focus();
        alert("�����Ͽ�ʱ����ͬ����ȷ�ϣ�");
        return false;
    }
    return true;
}

