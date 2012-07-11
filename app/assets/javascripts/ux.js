$(function () {

    var baseTitle = document.title,
        // base (general) part of title
        pathName = window.location.pathname,
        fileName = pathName.substring(window.location.pathname.lastIndexOf("/") + 1);

		console.log(pathName);
		console.log(pathName.indexOf("open-data-apps"));
    if (pathName.indexOf("apps") >= 0) $('li#open-data-apps a').addClass("active");
    else if (pathName.indexOf("datasets") >= 0) $('li#open-data-datasets a').addClass("active");
 });
    
