//��ͨ��ҳ�����봦��
function cmnWindowLoad()
{
    if ( sErrMsg.length > 0 )
    {
        alert(sErrMsg);
    }
}

//�˳���¼
function logout()
{
    formCommon.logout.value = "yes";
    formCommon.submit();
}

//��ת��ָ��ҳ��
function gotoPage( sNextPage )
{
    formCommon.gotoPage.value = sNextPage;
    formCommon.submit();
}

//�õ�ȫ�ǰ�ǵĳ��ȣ�ȫ��=2�����=1
function getLength( inStr )
{
    var iLen = 0;
    for( var i=0; i<inStr.length; i++ )
    {
        if( escape(inStr.charAt(i)).length >= 4 )
        {
            iLen = iLen + 2;
        }
        else
        {
            iLen = iLen + 1;
        }
    }
    return iLen;
}










//�ر�IE����ǰ��ʾ
function fnClose()
{
    if ( confirm("ȷ��Ҫ�رձ�������") )
    {
        window.opener = null;
        window.close();
    }
}

//����Ǩ�Ƶ�����֪ʶ��ҳ��
function gotoAddPage()
{
    window.location.href = "addNew.jsp";
}

//����Ǩ�Ƶ�����֪ʶ��ҳ��
function gotoSearchPage()
{
    window.location.href = "search.jsp";
}

//����Ǩ�Ƶ���ҳ
function gotoIndex()
{
    window.location.href = "index.jsp";
}


//�ж��Ƿ��зǷ��ַ�����
function hasSpecialString(strArg) 
{
    var i;
    var r1;
    var r2;
    var r3;
    var r4;
    var r5;
    
    r1 = new RegExp("\">","g")
    r2 = new RegExp("<!--","g")
    r3 = new RegExp("'","g")
    r4 = new RegExp("<","g")
    r5 = new RegExp(">","g")
    
    var tmpss = "\\aabb";
    
    if (strArg.search(r1) > -1 || strArg.search(r2) > -1 
     || strArg.search(r3) > -1 || strArg.search(r4) > -1 || strArg.search(r5) > -1  ) 
        return true;
    else
    {
        for(i=0;i<=strArg.length-1;i++)
        {
            if (strArg.charAt(i) == tmpss.charAt(0) )
            {
                return true;
            }
        } 
    }
    return false;
}

//�ж��Ƿ��зǷ��ַ�����
function hasSpecialChar(strArg,strSpecial) 
{
    var i;
    for(i=0;i<=strArg.length-1;i++)
    {
        if (strArg.charAt(i) == strSpecial.charAt(0) )
        {
            return true;
        }
    }
    return false;
}