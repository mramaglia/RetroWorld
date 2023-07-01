<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="css/style_header.css">
<link href='https://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet'>
<link href="https://fonts.cdnfonts.com/css/futura-pt" rel="stylesheet">
<link href='https://fonts.google.com/specimen/Roboto?query=roboto'
	rel='stylesheet'>
</head>
<body>
	<header>
		<div class="utility-bar">
			<div class="container">
				<p class="utility-bar__text">FREE SHIPPING SU ORDINI SUPERIORI A
					59$</p>
				<div class="utility-bar__login">
					<a href="#" class="login">ACCEDI</a> <span class="separator">|</span>
					<a href="#" class="login">REGISTRATI</a>
				</div>
			</div>
		</div>

		<div class="header-box">

			<div class="left">
				<a href="home.jsp"><img class="logo" src="image/logo.svg"></a>
			</div>

			<div class="center">
				<nav>
					<ul>
						<li class="dropdown"><a href="/shop" class="shop">Shop</a>
							<ul class="dropdown-menu">
								<li><a href="/shop?tipo=console">Consoles</a></li>
								<li><a href="/shop?tipo=game">Games</a></li>
								<li><a href="/shop?tipo=game">Accessori</a></li>
							</ul></li>
						<li class="dropdown"><a href="/shop?brandId=1">Nintendo</a>
							<ul class="dropdown-menu">
								<li><a href="/shop?brandId=1&console=1">NES</a></li>
								<li><a href="/shop?brandId=1&console=2">SNES Lite</a></li>
								<li><a href="/shop?brandId=1&console=3">N64</a></li>
								<li><a href="/shop?brandId=1&console=4">GAMECUBE</a></li>
								<li><a href="/shop?brandId=1&console=5">GAMEBOY</a></li>
							</ul></li>
						<li class="dropdown"><a href="/shop?brandId=4">Sony</a>
							<ul class="dropdown-menu">
								<li><a href="/shop?brandId=4sony&console=6">PlayStation 1</a></li>
								<li><a href="/shop?brandId=4sony&console=7"">PlayStation 2</a></li>
								<li><a href="/shop?brandId=4sony&console=8"">PSP</a></li>
							</ul></li>
						<li class="dropdown"><a href="/shop?brandI=3">Microsoft</a>
							<ul class="dropdown-menu">
								<li><a href="/shop?brandI=3&console=11">Xbox</a></li>	
								</ul></li>
						<li class="dropdown"><a href="/shop?brand=2">Sega</a>
							<ul class="dropdown-menu">
								<li><a href="/shop?brand=2&console=9">Dreamcast</a></li>
								<li><a href="/shop?brand=2&console=10">Megadrive</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>

			<div class="right">
				<input type="text" placeholder="Cerca..."> <img src="image\cart.png" alt="cart">
			</div>

		</div>
	</header>
</body>
</html>