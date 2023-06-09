<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 2023. 1. 19. / Kosmo -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
	$(function() {
		$(".slider").bxSlider({
			auto : true,
			autoControls : true,
			stopAutoOnClick : true,
			pager : true,
			captions: true
		});
	})
</script>

<style>
#carouselspace {
	max-width: 1300px;
	min-height: 700px;
	margin: 40px auto;
}
</style>

<!-- carousel : slider_area_start -->
<div id="carouselspace">
	<ul class="slider">
		<c:choose>
			<c:when test="${sessionScope.sessionName != null }">
				<li>
					<div style="position: absolute;">
						<h3>${sessionScope.sessionName}님!오늘도 반가운 방문이네요!</h3>
					</div> <img src="${path}/img/banner/banner99.png" alt="사진1">
				</li>
			</c:when>
			<c:otherwise>
				<li><img src="${path}/img/banner/banner99.png" alt="사진1" title="나만의 웹 페이지 만들기"></li>
			</c:otherwise>
		</c:choose>


		<li><img src="${path}/img/banner/banner2.png" alt="사진2" title="나만의 웹 페이지 만들기"></li>
		<li><img src="${path}/img/banner/banner3.png" alt="사진3"></li>
	</ul>
</div>
<!-- carousel : slider_area_end -->

<!-- search : where_togo_area_start  -->
<div class="where_togo_area">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-3">
				<div class="form_area">
					<h3>Where you want to go?</h3>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="search_wrap">
					<form class="search_form" action="#">
						<div class="input_field">
							<input type="text" placeholder="Where to go?">
						</div>
						<div class="input_field">
							<input id="datepicker" placeholder="Date">
						</div>
						<div class="input_field">
							<select>
								<option data-display="Travel type">Travel type</option>
								<option value="1">국내여행</option>
								<option value="2">해외여행</option>
							</select>
						</div>
						<div class="search_btn">
							<button class="boxed-btn4 " type="submit">Search</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- search : where_togo_area_end  -->

<!-- hotplace : popular_destination_area_start  -->
<div class="popular_destination_area">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="section_title text-center mb_70">
					<h3>Popular Destination</h3>
					<p>Suffered alteration in some form, by injected humour or good
						day randomised booth anim 8-bit hella wolf moon beard words.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="single_destination">
					<div class="thumb">
						<img src="${path}/img/destination/1.png" alt="">
					</div>
					<div class="content">
						<p class="d-flex align-items-center">
							Italy <a href="travel_destination.html"> 07 Places</a>
						</p>

					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_destination">
					<div class="thumb">
						<img src="${path}/img/destination/2.png" alt="">
					</div>
					<div class="content">
						<p class="d-flex align-items-center">
							Brazil <a href="travel_destination.html"> 03 Places</a>
						</p>

					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_destination">
					<div class="thumb">
						<img src="${path}/img/destination/3.png" alt="">
					</div>
					<div class="content">
						<p class="d-flex align-items-center">
							America <a href="travel_destination.html"> 10 Places</a>
						</p>

					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_destination">
					<div class="thumb">
						<img src="${path}/img/destination/4.png" alt="">
					</div>
					<div class="content">
						<p class="d-flex align-items-center">
							Nepal <a href="travel_destination.html"> 02 Places</a>
						</p>

					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_destination">
					<div class="thumb">
						<img src="${path}/img/destination/5.png" alt="">
					</div>
					<div class="content">
						<p class="d-flex align-items-center">
							Maldives <a href="travel_destination.html"> 02 Places</a>
						</p>

					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_destination">
					<div class="thumb">
						<img src="${path}/img/destination/6.png" alt="">
					</div>
					<div class="content">
						<p class="d-flex align-items-center">
							Indonesia <a href="travel_destination.html"> 05 Places</a>
						</p>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- hotplace : popular_destination_area_end  -->

<!-- newsletter: newletter_area_start  -->
<div class="newletter_area overlay">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-10">
				<div class="row align-items-center">
					<div class="col-lg-5">
						<div class="newsletter_text">
							<h4>Subscribe Our Newsletter</h4>
							<p>Subscribe newsletter to get offers and about new places to
								discover.</p>
						</div>
					</div>
					<div class="col-lg-7">
						<div class="mail_form">
							<div class="row no-gutters">
								<div class="col-lg-9 col-md-8">
									<div class="newsletter_field">
										<input type="email" placeholder="Your mail">
									</div>
								</div>
								<div class="col-lg-3 col-md-4">
									<div class="newsletter_btn">
										<button class="boxed-btn4 " type="submit">Subscribe</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- newsletter : newletter_area_end  -->

<!-- recommen -->
<div class="popular_places_area">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="section_title text-center mb_70">
					<h3>Popular Places</h3>
					<p>Suffered alteration in some form, by injected humour or good
						day randomised booth anim 8-bit hella wolf moon beard words.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="single_place">
					<div class="thumb">
						<img src="${path}/img/place/1.png" alt=""> <a href="#"
							class="prise">$500</a>
					</div>
					<div class="place_info">
						<a href="destination_details.html"><h3>California</h3></a>
						<p>United State of America</p>
						<div class="rating_days d-flex justify-content-between">
							<span class="d-flex justify-content-center align-items-center">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <a href="#">(20 Review)</a>
							</span>
							<div class="days">
								<i class="fa fa-clock-o"></i> <a href="#">5 Days</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_place">
					<div class="thumb">
						<img src="${path}/img/place/2.png" alt=""> <a href="#"
							class="prise">$500</a>
					</div>
					<div class="place_info">
						<a href="destination_details.html"><h3>Korola Megna</h3></a>
						<p>United State of America</p>
						<div class="rating_days d-flex justify-content-between">
							<span class="d-flex justify-content-center align-items-center">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <a href="#">(20 Review)</a>
							</span>
							<div class="days">
								<i class="fa fa-clock-o"></i> <a href="#">5 Days</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_place">
					<div class="thumb">
						<img src="${path}/img/place/3.png" alt=""> <a href="#"
							class="prise">$500</a>
					</div>
					<div class="place_info">
						<a href="destination_details.html"><h3>London</h3></a>
						<p>United State of America</p>
						<div class="rating_days d-flex justify-content-between">
							<span class="d-flex justify-content-center align-items-center">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <a href="#">(20 Review)</a>
							</span>
							<div class="days">
								<i class="fa fa-clock-o"></i> <a href="#">5 Days</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_place">
					<div class="thumb">
						<img src="${path}/img/place/4.png" alt=""> <a href="#"
							class="prise">$500</a>
					</div>
					<div class="place_info">
						<a href="destination_details.html"><h3>Miami Beach</h3></a>
						<p>United State of America</p>
						<div class="rating_days d-flex justify-content-between">
							<span class="d-flex justify-content-center align-items-center">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <a href="#">(20 Review)</a>
							</span>
							<div class="days">
								<i class="fa fa-clock-o"></i> <a href="#">5 Days</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_place">
					<div class="thumb">
						<img src="${path}/img/place/5.png" alt=""> <a href="#"
							class="prise">$500</a>
					</div>
					<div class="place_info">
						<a href="destination_details.html"><h3>California</h3></a>
						<p>United State of America</p>
						<div class="rating_days d-flex justify-content-between">
							<span class="d-flex justify-content-center align-items-center">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <a href="#">(20 Review)</a>
							</span>
							<div class="days">
								<i class="fa fa-clock-o"></i> <a href="#">5 Days</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_place">
					<div class="thumb">
						<img src="${path}/img/place/6.png" alt=""> <a href="#"
							class="prise">$500</a>
					</div>
					<div class="place_info">
						<a href="destination_details.html"><h3>Saintmartine
								Iceland</h3></a>
						<p>United State of America</p>
						<div class="rating_days d-flex justify-content-between">
							<span class="d-flex justify-content-center align-items-center">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <a href="#">(20 Review)</a>
							</span>
							<div class="days">
								<i class="fa fa-clock-o"></i> <a href="#">5 Days</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="more_place_btn text-center">
					<a class="boxed-btn4" href="#">More Places</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- recommen -->

<!-- video -->
<div class="video_area video_bg overlay">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="video_wrap text-center">
					<h3>Enjoy Video</h3>
					<div class="video_icon">
						<a class="popup-video video_play_button"
							href="https://www.youtube.com/watch?v=f59dDEk57i0"> <i
							class="fa fa-play"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- video -->

<!-- variation -->
<div class="travel_variation_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="single_travel text-center">
					<div class="icon">
						<img src="${path}/img/svg_icon/1.svg" alt="">
					</div>
					<h3>Comfortable Journey</h3>
					<p>A wonderful serenity has taken to the possession of my
						entire soul.</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_travel text-center">
					<div class="icon">
						<img src="${path}/img/svg_icon/2.svg" alt="">
					</div>
					<h3>Luxuries Hotel</h3>
					<p>A wonderful serenity has taken to the possession of my
						entire soul.</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_travel text-center">
					<div class="icon">
						<img src="${path}/img/svg_icon/3.svg" alt="">
					</div>
					<h3>Travel Guide</h3>
					<p>A wonderful serenity has taken to the possession of my
						entire soul.</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- variation -->

<!-- review : testimonial_area  -->
<div class="testimonial_area">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="testmonial_active owl-carousel">
					<div class="single_carousel">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<div class="single_testmonial text-center">
									<div class="author_thumb">
										<img src="${path}/img/testmonial/author.png" alt="">
									</div>
									<p>"Working in conjunction with humanitarian aid agencies,
										we have supported programmes to help alleviate human
										suffering.</p>
									<div class="testmonial_author">
										<h3>- Micky Mouse</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="single_carousel">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<div class="single_testmonial text-center">
									<div class="author_thumb">
										<img src="${path}/img/testmonial/author.png" alt="">
									</div>
									<p>"Working in conjunction with humanitarian aid agencies,
										we have supported programmes to help alleviate human
										suffering.</p>
									<div class="testmonial_author">
										<h3>- Tom Mouse</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="single_carousel">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<div class="single_testmonial text-center">
									<div class="author_thumb">
										<img src="${path}/img/testmonial/author.png" alt="">
									</div>
									<p>"Working in conjunction with humanitarian aid agencies,
										we have supported programmes to help alleviate human
										suffering.</p>
									<div class="testmonial_author">
										<h3>- Jerry Mouse</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- review : testimonial_area  -->

<!-- reviewDetail : recent_trip_area  -->
<div class="recent_trip_area">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="section_title text-center mb_70">
					<h3>Recent Trips</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="single_trip">
					<div class="thumb">
						<img src="${path}/img/trip/1.png" alt="">
					</div>
					<div class="info">
						<div class="date">
							<span>Oct 12, 2019</span>
						</div>
						<a href="#">
							<h3>Journeys Are Best Measured In New Friends</h3>
						</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_trip">
					<div class="thumb">
						<img src="${path}/img/trip/2.png" alt="">
					</div>
					<div class="info">
						<div class="date">
							<span>Oct 12, 2019</span>
						</div>
						<a href="#">
							<h3>Journeys Are Best Measured In New Friends</h3>
						</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_trip">
					<div class="thumb">
						<img src="${path}/img/trip/3.png" alt="">
					</div>
					<div class="info">
						<div class="date">
							<span>Oct 12, 2019</span>
						</div>
						<a href="#">
							<h3>Journeys Are Best Measured In New Friends</h3>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- reviewDetail : recent_trip_area  -->