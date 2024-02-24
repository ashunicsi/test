<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="title" content="List of Registered Schemes">
    <meta name="format" content="text/html">
    <title>List of Registered Schemes</title>
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/page.css">
    
</head>

<body id="html2pdf">
    <article class="DIEP__header__sticky">
        <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="Pragyan__logo">
                            <img src="assets/images/pragyan.jpg" alt="Pragyan Header" class="w-100">
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="second__header list_pad py-2">
            <div class="container-fluid" id="contentToPrint">
                <div class="row align-items-center">
                    <div class="col-md-4">
                        <ul class="DIEP__search">
                            <li class="mr-3 w-50">
                                <input type="text" class="form-control" type="search" placeholder="Search...">
                            </li>
                            <li class="d-flex align-items-center"> Show
                                <select name="" id="" class="form-control mx-2">
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="75">75</option>
                                    <option value="100">100</option>
                                </select>
                            </li>
                        </ul>


                    </div>
                    <div class="col-md-4">
                        <h5 class="mb-0 DIEP__heading">List of Registered Schemes</h5>
                    </div>
                    <div class="col-md-4">
                        <div class="list__export__icons">
                            <li class="pointer" title="Export Excel"><button onclick="exportTableToExcel('activateTable')"><img src="assets/images/xl_icon.svg" alt="Excel icon"></button></li>
                            <li class="pointer mx-2" title="Export Pdf"><button id="pdfButton"><img src="assets/images/pdf_icon.svg" alt="Pdf icon"></button></li>
                            <li class="pointer" title="Print"><button id="create_pdf" onclick="generateHTML2PDF()" value="Generate PDF"><img src="assets/images/print_icon.svg" alt="Print icon"></button></li>
                        </div>
                        <script>
	function generateHTML2PDF() {       
	  var element = document.getElementById('html2pdf');
	  html2pdf(element);
	}
</script>
                    </div>
                </div>
            </div>
        </section>
    </article>

    <section class="list_pad mt-5 DIEP__table">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <ul class="nav nav-tabs DIEP__table__tabs">
                        <li><a data-toggle="tab" class="activated active" href="#activated">Activated Schemes <span>${fn:length(activeSchemeData)}</span></a></li>
                        <li><a data-toggle="tab" class="deactivated" href="#deactivated">Deactivated Schemes <span>${fn:length(deactiveSchemeData)}</span></a></li>
                    </ul>
                    <div class="tab-content" id="generatePdf">
                        <div id="activated" class="tab-pane active">
                            <div class="table-responsive">
                            <jsp:useBean id="pagedListHolderActiveSchemeDetails" scope="request"
											type="org.springframework.beans.support.PagedListHolder" />
										<c:url value="${page }" var="pagedLink">
											<c:param name="p" value="~" />
										</c:url>
							<form class="form">        
                                <table  id="activateTable" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Sr. No.</th>
                                            <th>Ministry Name (Code)</th>
                                            <th>Department Name (Code)</th>
                                            <th>Scheme Name (Code)</th>
                                            <th>Coordinator, Head and Project Admin e-Mail</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%	int i =Integer.parseInt(session.getAttribute("j").toString());
                                				i++;
                                			%>
                                	<c:forEach items="${activeSchemeData}" var="obj">
                                        <tr>
                                            <td><%out.print(i++); %></td>
                                            <td>${obj.ministryName } <h6>(${obj.ministryCode })</h6>
                                            </td>
                                            <td>${obj.departmentName }<h6>(${obj.departmentCode })</h6>
                                            </td>
                                            <td>${obj.schemeName } <h6>(${obj.schemeName })</h6>
                                            </td>
                                            <td>
                                                <div class="mail__text">${obj.cordEmail }</div>
                                                <div class="mail__text">${obj.headEmail }</div>
                                                <div class="mail__text">${obj.adminEmail }</div>
                                            </td>
                                            <td><button class="view__btn pointer">
                                            	<a href="viewMoreSchemeDetails?id=${obj.id}"><img src="assets/images/eye_icon.svg"alt="icon"> 
                                            	<!-- <span>View</span> --></a></button></td>
                                        </tr>
                                     </c:forEach>
                                        
                                    </tbody>

                                </table>
                                </form>
                            </div>
                            <!-- 
                            <ul class="pagination">
                            
										 <center>
									<tg:paging pagedListHolder="${pagedListHolderActiveSchemeDetails}" pagedLink="${pagedLink}" />
								</center>
                               
                            </ul>
                             -->
                        </div>
                        <div id="deactivated" class="tab-pane fade">
                            <div class="table-responsive">
                                <jsp:useBean id="pagedListHolderDeativeSchemeDetails" scope="request"
											type="org.springframework.beans.support.PagedListHolder" />
										<c:url value="${deactivePage }" var="pagedLink">
											<c:param name="p" value="~" />
										</c:url>
                                <table id="deactivateTable" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Sr. No.</th>
                                            <th>Ministry Name (Code)</th>
                                            <th>Department Name (Code)</th>
                                            <th>Scheme Name (Code)</th>
                                            <th>Coordinator, Head and Project Admin e-Mail</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%	i =Integer.parseInt(session.getAttribute("j").toString());
                                				i++;
                                			%>
                                	<c:forEach items="${deactiveSchemeData}" var="obj">
                                        <tr>
                                            <td><%out.print(i++); %></td>
                                            <td>${obj.ministryName } <h6>(${obj.ministryCode })</h6>
                                            </td>
                                            <td>${obj.departmentName }<h6>(${obj.departmentCode })</h6>
                                            </td>
                                            <td>${obj.schemeName } <h6>(${obj.schemeName })</h6>
                                            </td>
                                            <td>
                                                <div class="mail__text">${obj.cordEmail }</div>
                                                <div class="mail__text">${obj.headEmail }</div>
                                                <div class="mail__text">${obj.adminEmail }</div>
                                            </td>
                                            <td><button class="view__btn pointer">
                                            	<a href="viewMoreSchemeDetails?id=${obj.id}"><img src="assets/images/eye_icon.svg"alt="icon"> 
                                            	<!-- <span>View</span> --></a></button></td>
                                        </tr>
                                     </c:forEach>
                                        
                                    </tbody>

                                </table>
                            </div>
                            <%-- <ul class="pagination">
                                <center>
									<tg:paging pagedListHolder="${pagedListHolderDeativeSchemeDetails}" pagedLink="${pagedLink}" />
								</center>
                            </ul> --%>
                        </div>

                        

                    </div>
                </div>
            </div>
    </section>

    <script src="assets/js/jquery-3.6.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

	
	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" class="init">
	

$(document).ready(function () {
	$('#activateTable').DataTable();
	$('#deactivateTable').DataTable();
});
function exportTableToExcel(tableID, filename = '')
{
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    // Specify file name
    filename = filename?filename+'.xls':'schemeDetails.xls';
    
    // Create download link element
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // Setting the file name
        downloadLink.download = filename;
        
        //triggering the function
        downloadLink.click();
    }
}

function printPage()
{  window.print();
}

</script>
	

      <script>
$(document).ready(function () {  
    var form = $('.form'),  
    cache_width = form.width(),  
    a4 = [595.28, 841.89]; // for a4 size paper width and height  

    $('#create_pdf').on('click', function () {  
        $('body').scrollTop(0);  
        createPDF();  
    });  
    
    function createPDF() {  
        getCanvas().then(function (canvas) {  
            var  
             img = canvas.toDataURL("image/png"),  
             doc = new jsPDF({  
                 unit: 'px',  
                 format: 'a4'  
             });  
            doc.addImage(img, 'JPEG', 20, 20);  
            doc.save('techsolutionstuff-html-to-pdf.pdf');  
            form.width(cache_width);  
        });  
    }  
      
    function getCanvas() {  
        form.width((a4[0] * 1.33333) - 80).css('max-width', 'none');  
        return html2canvas(form, {  
            imageTimeout: 2000,  
            removeContainer: true  
        });  
    }
});
</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>

</html>