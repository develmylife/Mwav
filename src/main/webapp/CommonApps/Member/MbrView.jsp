<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- container 안에 포함시키면 된다. -->
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">

<c:forEach var="Member" items="${Member}">
<div class="row">
	<div class="col-md-5  toppad  pull-right col-md-offset-3 ">
		<A href="/CWS/CommonApps/Member/MbrShipForm.jsp">Edit Profile</A> <A href="/CWS/CommonApps/Member/muLogoutDisplay.jsp">Logout</A> <br>
		<p class=" text-info">May 05,2014,03:00 pm</p>
	</div>
	<div
		class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">


		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">김주성</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-3 col-lg-3 " align="center">
						<img alt="User Pic"
							src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
							class="img-circle">
					</div>

					<!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
					<div class=" col-md-9 col-lg-9 ">
						<table class="table table-user-information">
							<tbody>
								<tr>
									<td>아이디:</td>
									<td>${Member.mbrLoginId}</td>
								</tr>
								<tr>
									<td>이름:</td>
									<td>${Member.mbrFirstName}</td>
								</tr>
								<tr>
								    <td>이메일:</td>
									<td>${Member.mbrEmail}</td>
								</tr>

								<tr>
								    <td>핸드폰번호:</td>
									<td>${Member.mbrCellPhone}</td>
								</tr>
								<tr>
									<td>주소구분:</td>
									<td>${Member.mbrAddrFlag}</td>
								</tr>
								<tr>
									<td>주소:</td>
									<td>${Member.mbrZipcode} // ${Member.mbrAddress} </td>
								</tr>
								<tr>
									<td>Email</td>
									<td><a href="mailto:info@support.com">info@support.com</a></td>
								</tr>
								</tbody>
						</table>

						<a href="#" class="btn btn-primary">되돌아가기</a> <a
							href="#" class="btn btn-primary">삭제</a>
					</div>
				</div>
			</div>
			<div class="panel-footer">
				<a data-original-title="Broadcast Message" data-toggle="tooltip"
					type="button" class="btn btn-sm btn-primary"><i
					class="glyphicon glyphicon-envelope"></i></a> <span class="pull-right">
					<a href="edit.html" data-original-title="Edit this user"
					data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i
						class="glyphicon glyphicon-edit"></i></a> <a
					data-original-title="Remove this user" data-toggle="tooltip"
					type="button" class="btn btn-sm btn-danger"><i
						class="glyphicon glyphicon-remove"></i></a>
				</span>
			</div>

		</div>
	</div>
</div>
</c:forEach>