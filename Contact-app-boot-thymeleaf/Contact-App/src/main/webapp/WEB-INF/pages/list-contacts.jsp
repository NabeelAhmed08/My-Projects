
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" >
<head>
<meta charset="ISO-8859-1">
<title>list Paginated</title>
<link rel="stylesheet"  type= "text/css" href="webjars/bootstrap/css/bootstrap.css"/>

</head>
<body>
	<div th:replace="fragments ::header" ></div>
	<div class ="container" >
	<h1>All Contacts</h1><hr>
	<a type ="button" class ="btn btn-primary btn-sm mb-3" th:href = "@{addContact}">Add Contact </a>
<table class = "table table-bordered table-striped">
	<thead class="thead-dark">
		<tr>
			<th>Name  <a th:href="@{allContactsDec}" class="btn btn-info btn-sm" >Dec Sort <i class="bi bi-arrow-down-up"></i></a> </th> 
			<th>Phone Number <a th:href="@{sortByPno}" class="btn btn-info btn-sm" >Sort By No</a> </th>
			<th>Email</th>
			<th>Location </th>
			<th>&nbsp;Action</th>
		</tr>
		</thead>	
		<tbody>
			<tr th:each="temp : ${contactList}" >
			<td th:text ="${temp.name}"/>
			<td th:text ="${temp.pno}"/>
			<td th:text ="${temp.email}"/>
			<td th:text ="${temp.location}"/>
			<td>
				<a th:href="@{updateForm(id=${temp.id })}" class="btn btn-info btn-sm" >Update</a>
		|
				<a th:href="@{deleteContact(id=${temp.id })}" class="btn btn-danger btn-sm" 
				
			onclick="if (!(confirm('Are You Sure You Want To Delete'))) return false "	>							
				Delete</a>
			</td>	
			</tr>	
		</tbody>
		</table>
		<div th:if="${totalPages > 1 }" >
		 	<div class="row col-sm-10" >
		 		<div class ="row col-sm-2" >  
		 		Total Rows: [[${totalItems}]]
		 	   </div>
		 		<div class ="col-sm-1" >
		 			<span th:each="i: ${#numbers.sequence(1, totalPages)}" >
		 			<a th:if="${currentPage !=i}" th:href="@{/page(pageNo= ${i})}">[[${i}]] </a>
		 			<span th:unless="${currentPage != i}"> [[${i}]]</span> &nbsp; &nbsp;
		 			</span>
		 		    </div>
		 		<div class ="col-sm-1" > 
		 		<a th:if="${currentPage < totalPages }" th:href="@{/page(pageNo= ${currentPage + 1})}">Next</a>
		 		   <span th:unless ="${currentPage < totalPages}"  >Next</span>
		 		   </div>
		 		   
		 		   <div class ="col-sm-1" > 
		 		<a th:if="${currentPage < totalPages }" th:href="@{/page(pageNo= ${totalPages})}">Last</a>
		 		    <span th:unless ="${currentPage < totalPages}"  >Last</span>
		 		   </div>
		 	</div>
		
		</div>
		
		</div>
</body>
</html>