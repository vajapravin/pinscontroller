function popitup(url) { 
    var width = 600;
    var height = 260;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 3;
    var params = 'width=' + width + ', height=' + height;
    params += ', top=' + top + ', left=' + left;
    params += ', directories=no';
    params += ', location=' + url;
    params += ', menubar=no';
    params += ', resizable=yes';
    params += ', scrollbars=yes';
    params += ', status=no';
    params += ', toolbar=no';
    newwin = window.open(url, 'clubdango_share', params);
    if(window.focus) {
        newwin.focus()
    }
    return false;

}