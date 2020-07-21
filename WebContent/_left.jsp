<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<aside id="left-panel" class="left-panel">
	<nav class="navbar navbar-expand-sm navbar-default">
		<div class="navbar-header">
			<img class="mt-4" src="/static/images/user.png" alt="Image">
		</div>
		<div id="main-menu" class="main-menu collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="menu-title">MANAGEMENT SCREENS</li>
				<li class="menu-item-has-children dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="menu-icon fa fa-laptop"></i>
						Master Screens
					</a>
					<ul class="sub-menu children dropdown-menu">
						<li>
							<i class="fa fa-puzzle-piece"></i>
							<a href="employees.jsp">Employees Master</a>
						</li>
						<li>
							<i class="fa fa-id-badge"></i>
							<a href="vehicles.jsp">Vehicles Master</a>
						</li>
						<li>
							<i class="fa fa-bars"></i>
							<a href="stations.jsp">Stations Master</a>
						</li>
						<li>
							<i class="fa fa-share-square-o"></i>
							<a href="locations.jsp">Locations Master</a>
						</li>
					</ul>
				</li>
				<li class="menu-item-has-children dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="menu-icon fa fa-table"></i>
						Bussiness Screens
					</a>
					<ul class="sub-menu children dropdown-menu">
						<li>
							<i class="fa fa-table"></i>
							<a href="">Basic Table</a>
						</li>
						<li>
							<i class="fa fa-table"></i>
							<a href="">Data Table</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</aside>