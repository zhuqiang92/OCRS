window.onload = windowLoad;
//---------------------------------

//ҳ������ʱ����
function windowLoad()
{
    cmnWindowLoad();
    form_main.username.focus();
}

//��reset��ʱ����Ҫ�������⴦��
function resetForm()
{
    form_main.username.focus();
}

//��¼ǰ�ļ��
function checkInput()
{
    //����û���
    if ( form_main.username.value.length < 1 )
    {
        form_main.username.focus();
        form_main.username.select();
        alert("�û�������Ϊ�գ�");
        return false;
    }
    if ( getLength(form_main.username.value)>20 )
    {
        form_main.username.focus();
        form_main.username.select();
        alert("�û������Ȳ��ܳ���20����ǳ��ȡ�");
        return false;
    }
    
    //�������
    if ( form_main.password.value.length < 1 )
    {
        form_main.password.focus();
        form_main.password.select();
        alert("���벻��Ϊ�գ�");
        return false;
    }
    if ( getLength(form_main.password.value)>20 )
    {
        form_main.password.focus();
        form_main.password.select();
        alert("���볤�Ȳ��ܳ���20����ǳ��ȡ�");
        return false;
    }
    
    return true;
}
