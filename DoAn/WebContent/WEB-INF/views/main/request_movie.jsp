<%@page pageEncoding="utf-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html lang="en" dir="ltr" style="height: 100%">
  <head>
  <base href="${pageContext.servletContext.contextPath}/">
  <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
				<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
				<meta charset="utf-8">
    <title>Request Movie</title>
    <link href="
					<c:url value="/resources/style.css" />" rel="stylesheet"
	type="text/css">
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
  		<!-- Form request -->
    	<div class="container-request-movie">
    	${message}
    		<h3 style="text-align: center;font-size: 3vw;">Request movie or TV Show</h3>
    		
    		<p>Is your favorite Movie/TV Show doesn't show up at our website ?. Write a request now and our teams will consider to add it up !!!.</p>
    		<p>What to wait ? Request now !!!!</p>
    			
    			<form:form action="/DoAn/main/request_movie/${username}.htm" method="POST" modelAttribute="request" enctype="multipart/form-data">
    				<div class="form-group">
    					<label for="exampleInputEmail1">Movie's Name</label>
    						<form:input type="text" path="movie_name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Let's us know your movie name"/>
    							<form:errors path="movie_name"></form:errors>
  					</div>
					  <div class="form-group">
						<label>Category</label>
								<form:select path="category.category_id" items="${categories}" itemValue="category_id" itemLabel="category_name" class="form-control border border-primary"></form:select>
						</div>
					 <div class="form-group">
    					<label for="exampleFormControlTextarea1">Introduction</label>
    						<form:textarea path="introduction" class="form-control" id="exampleFormControlTextarea1" rows="3"/>
  					</div>
  					
  					<div class="form-group">
  					<label for="exampleFormControlTextarea1"> By including movie's avatar, it will help us transfer the movie to you quicker !</label>
  						<input type="file" name="avatar">
  						<form:errors path="movie_avatar"></form:errors>
  					</div>
  					<button type="submit" class="btn btn-primary btn-send-request-movie">Request!</button>
  								
    			</form:form>
    		
    	</div>
  </body>
</html>