<%@page pageEncoding="utf-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html lang="en" dir="ltr">
	<head>
		<link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
				<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
				<meta charset="utf-8">
					<title>Show List Request</title>
					<link href=" 
						<c:url value="/resources/style.css" />" rel="stylesheet" type="text/css">
					</head>
					<body>
						 <!-- Menu -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
		
		<p class="navbar-text">Whenever, wherever</p>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav ml-auto mx-auto ">
					<c:choose>
					
						<c:when test="${user.administrator==true }">
							<a class="nav-item nav-link" href="<c:url value="/main/index_admin.htm"/>">HOME
								<span class="sr-only">(current)</span>
								</a>
						</c:when>
						<c:otherwise>
							<c:choose>
							
							<c:when test="${user.user_type.type_id == 't01' }">
								<a class="nav-item nav-link" href="<c:url value="/main/index_standard.htm"/>">HOME
									<span class="sr-only">(current)</span>
									</a>
							</c:when>
							
								<c:otherwise>
									<a class="nav-item nav-link" href="<c:url value="/main/index_vip.htm"/>">HOME
									<span class="sr-only">(current)</span>
									</a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					
				 <a class="nav-item nav-link" href="<c:url value="/main/tv_show.htm"/>">TV SHOWS</a> <a
					class="nav-item nav-link" href="<c:url value="/main/phim_le.htm"/>">FEATURES</a>
					<!-- Dropdown theo tên người dùng để update -->
										<div class="dropdown">
											<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												      Hi ${username} 
												  </button>
											<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="
													<c:url value="/main/show_information_user/${username}.htm"/>">Update
												</a>
												
												<a class="dropdown-item" href="<c:url value="/main/index.htm"/>">Sign Out</a>
											</div>
										</div>
										<!-- Hết Dropdown  -->
			</div>
		</div>
	</nav>
							<div class="container-fluid container-show-list-user">
							<!-- Layout show each user -->
							${message}
							
								<c:forEach var="r" items="${requests}">
									<div class="media">
									  <a href="<c:url value="/main/insert_movie.htm"/>"><img src="${r.movie_avatar}" class="mr-3" alt="avatar"></a>
									  <div class="media-body">
									    <h5 class="mt-0">${r.movie_name}</h5>
									    ${r.category.category_name}
									    <br>
									    ${r.introduction}
									    <p>Account request: ${r.user.username}</p>
									    <a href="<c:url value="/main/insert_movie/${r.request_id}.htm"/>"><button type="button" class="btn btn-primary">Add this movie !</button></a>
									    	<a href="<c:url value="/main/delete_request/${r.request_id}.htm"/>"><button type="button" class="btn btn-primary">Delete this request !</button></a>
									    	
									  </div>
									</div>
								</c:forEach>
									
									
							</div>
							<!-- Footer -->
								<!-- Footer -->
															<div class="container-fluid container-footer">
																<h2>Contact us </h2>
						
																<p>Phone:123456789 </p>
																<p>Email:abc@gmail.com</p>
																<p>Address:195 Ham Tu Street, District 5, Ho Chi Minh City</p>
																<p>Copyright @2019:All Right Reserve</p>
															</div>
															