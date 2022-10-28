<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vovam
  Date: 26.10.2022
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <title>Table - Brand</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Articles-Cards-images.css">
</head>

<body id="page-top">
<div id="wrapper">
  <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
    <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
      <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-suitcase" style="font-size: 36px;"></i></div>
      <div class="sidebar-brand-text mx-3"><span>Tax service<br>Inspector<br></span></div>
    </a>
      <header></header>
      <ul class="navbar-nav text-light" id="accordionSidebar">
        <li class="nav-item"></li>
        <li class="nav-item"><a class="nav-link active" href="table.html"><i class="fas fa-table" style="font-size: 30px;"></i><span style="margin-left: 20px;"><strong>Reports</strong></span></a></li>
        <li class="nav-item"><a class="nav-link" href="login.html"><i class="icon ion-stats-bars" style="font-size: 30px;"></i><span style="margin-left: 20px;"><strong>Stats</strong><br></span></a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/controller?command=Logout"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 20 20" fill="none" style="font-size: 30px;">
          <path fill-rule="evenodd" clip-rule="evenodd" d="M3 3C2.44772 3 2 3.44772 2 4V16C2 16.5523 2.44772 17 3 17C3.55228 17 4 16.5523 4 16V4C4 3.44772 3.55228 3 3 3ZM13.2929 12.2929C12.9024 12.6834 12.9024 13.3166 13.2929 13.7071C13.6834 14.0976 14.3166 14.0976 14.7071 13.7071L17.7071 10.7071C17.8946 10.5196 18 10.2652 18 10C18 9.73478 17.8946 9.48043 17.7071 9.29289L14.7071 6.29289C14.3166 5.90237 13.6834 5.90237 13.2929 6.29289C12.9024 6.68342 12.9024 7.31658 13.2929 7.70711L14.5858 9L7 9C6.44771 9 6 9.44772 6 10C6 10.5523 6.44772 11 7 11H14.5858L13.2929 12.2929Z" fill="currentColor"></path>
        </svg><span style="margin-left: 20px;"><strong>Logout</strong></span></a></li>
      </ul>
      <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
    </div>
  </nav>
  <div class="d-flex flex-column" id="content-wrapper">
    <div id="content">
      <div class="container-fluid">
        <h3 class="text-dark mb-4">Reports</h3>
        <div class="card shadow">
          <div class="card-header py-3">
            <p class="text-primary m-0 fw-bold">Report Info</p>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-md-6 text-nowrap">
                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"></div>
              </div>
              <div class="col-md-6">
                <div class="text-md-end dataTables_filter" id="dataTable_filter"><label class="form-label"><input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search"></label></div>
              </div>
            </div>
            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
              <table class="table my-0" id="dataTable">
                <thead>
                <tr>
                  <th>Report type</th>
                  <th>Status</th>
                  <th>Date</th>
                  <th>Company</th>
                  <th>First Name</th>
                  <th>Last name</th>
                  <th>Deteils</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <c:forEach items="${adminReportViews}" var="item">
                <tr>
                  <th><c:out value="${item.type}"/></th>
                  <th><c:out value="${item.status}"/></th>
                  <th><c:out value="${item.date}"/></th>
                  <th>-</th>
                  <th><c:out value="${item.firstName}"/></th>
                  <th><c:out value="${item.lastName}"/></th>
                  <c:choose>
                    <c:when test="${item.status == 'SUBMITTED' }">
                      <td><a class="btn btn-primary"  href="${pageContext.request.contextPath}/controller?command=UnverifiedReports&idUser=${item.idUser}">Check the report</a></td>
                    </c:when>
                    <c:otherwise>
                      <td><button class="btn btn-primary" type="button">View details</button></td>
                    </c:otherwise>
                  </c:choose>
                </tr>
                </c:forEach>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                  <td><strong><br><strong>Report type</strong><br><br></strong></td>
                  <td><strong><br><strong>Status</strong><br><br></strong></td>
                  <td><strong><br><strong>Date</strong><br><br></strong></td>
                  <td><strong style="margin-bottom: 50px;padding-right: 0px;padding-top: 0px;margin-top: 7px;"><br><strong>Comapany</strong><br><br></strong></td>
                  <td><strong>Start date</strong></td>
                </tr>
                </tfoot>
              </table>
            </div>
            <div class="row">
              <div class="col-md-6">
                <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                  <ul class="pagination">
                    <li class="page-item disabled"><a class="page-link" aria-label="Previous" href="#"><span aria-hidden="true">«</span></a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" aria-label="Next" href="#"><span aria-hidden="true">»</span></a></li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="bg-white sticky-footer">
      <div class="container my-auto">
        <div class="text-center my-auto copyright"></div>
      </div>
    </footer>
  </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
</body>

</html>
