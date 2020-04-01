<%-- 
    Document   : imdex
    Created on : 11-Feb-2020, 02:56:22
    Author     : JOSWAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="container-fluid p-0">
    <div class="top-page">
        <nav class="navbar shadow-none navbar-expand-sm bg-transparent navbar-dark">
            <!-- Brand/logo -->
            <a class="navbar-brand float-left ml-5" href="#">
                <img src="./img/logo.png" alt="logo" style="width:170px;">
            </a>
            <!-- Links -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link text-white bold-text font-weight-bold" href="#">Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white font-weight-bold" href="#">FAQ's</a>
                </li>
                <li class="nav-item text-white">
                    <a class="nav-link text-white font-weight-bold" href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link  text-dark register px-4 font-weight-bold" href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Login">Register</a>
                </li>
            </ul>
        </nav>
        <div class="banner">
            <div class="jumbotron bg-transparent text-white text-center">
                <h1 class="display-4">Get someone to do your tasks for you</h1>
                <p class="lead">Get connected to someone who can run your errands for you while you
                    do your
                    thing.
                    You can run just any type of errand. <span class="start-now"> Start Now</span></p>
                <div class="images">
                    <img height="50" src="./img/appstore.png" alt="appstore"> <img height="73"
                                                                                   src="./img/playstore.png" alt="appstore">
                </div>
            </div>
        </div>
        <div class="container cardline">
            <div class="tabs">
                <div class="tab-2 a">
                    <label for="tab2-1">Post Errands</label>
                    <input id="tab2-1" name="tabs-two" type="radio" checked="checked">
                    <div>
                        <h4 class="bold-title mt-3">What Kind of Errand do you want done? </h4>
                        <p class="activity-story">The type of errand you can post is absolutely limitless, if
                            you
                            can think it you can post. you can get started and start
                            posting, select a category below to start posting</p>
                        <div class="card-items">
                            <p class="card-item"><i class="material-icons md-24">local_mall</i>&nbsp; Shopping
                            </p>
                            <p class="card-item"><i class="material-icons md-24">local_shipping</i>&nbsp; Pick
                                up &
                                Delivery</p>
                            <p class="card-item"><i class="material-icons md-24">fastfood</i>&nbsp; Catering
                                Service</p>
                            <p class="card-item"><i class="material-icons md-24">eco</i>&nbsp; Cleaning</p>
                            <p class="card-item"><i class="material-icons md-24">local_laundry_service</i>&nbsp;
                                Cleaning</p>
                            <p class="card-item"><i class="material-icons md-24">style</i>&nbsp; Ticketing</p>
                            <p class="card-item"><i class="material-icons md-24">home_work</i>&nbsp; Real Estate
                            </p>
                            <p class="card-item"><i class="material-icons md-24">school</i>&nbsp; Tutoring</p>
                            <p class="card-item"><i class="material-icons md-24">home_work</i>&nbsp; Chauffer
                            </p>
                            <p class="card-item"><i class="material-icons md-24">home_work</i>&nbsp; Gardening
                            </p>
                            <p class="card-item"><i class="material-icons md-24">room_service</i>&nbsp; Food
                                Purchase</p>
                            <p class="card-item"><i class="material-icons md-24">devices_other</i>&nbsp;
                                Electronics
                                Repair</p>
                            <p class="card-item"><i class="material-icons md-24">phone_iphone</i>&nbsp; Phones
                                Repair</p>
                            <p class="card-item"><i class="material-icons md-24">laptop</i>&nbsp; Computers
                                Repair</p>
                            <p class="card-item"><i class="material-icons md-24">local_shipping</i>&nbsp; Moving
                            </p>
                            <p class="card-item"><i class="material-icons md-24">child_friendly</i>&nbsp; Baby
                                Sitting</p>
                            <p class="card-item"><i class="material-icons md-24">home_work</i>&nbsp; Carpentry
                            </p>
                            <p class="card-item"><i class="material-icons md-24">school</i>&nbsp; Research &
                                Documentation</p>
                            <p class="card-item"><i class="material-icons md-24">directions_car</i>&nbsp; Auto
                                Repairs</p>
                            <p class="card-item"><i class="material-icons md-24">home_work</i>&nbsp; Fashion and
                                Tailoring</p>
                            <p class="card-item"><i class="material-icons md-24">motorcycle</i>&nbsp; Errands
                            </p>
                            <p class="card-item"><i class="material-icons md-24">home_work</i>&nbsp; Make Up
                                Artistry</p>
                            <a href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Errands">
                                <button type="submit" class="btn d-block w-25 mx-auto mt-5 btn-primary btn-lg px-3">Continue</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="tab-2 ab">
                    <label for="tab2-2">Run Errands</label>
                    <input id="tab2-2" name="tabs-two" type="radio">
                    <div>
                        <h4 class="bold-title">You can run Errands for people </h4>
                        <p class="activity-story">The type of errand you can post is absolutely limitless, if
                            you
                            can think it you can post. you can get started and start
                            posting, select a category below to start posting</p>
                        <div class="px-lg-5">
                            <form action="/action_page.php">
                                <div class="form-group">
                                    <label for="" class="bold text-dark text-left pb-0">Pick a Location where
                                        you
                                        would
                                        like to run
                                        errand:</label>
                                    <input type="text" class="form-control form-control-lg mb-5" placeholder=""
                                           name="text1">
                                </div>

                                <p class="font-weight-bold m-2 "><i class="material-icons">
                                        trip_origin
                                    </i> Choose a location on the map</p>
                                <a type="submit" href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Errands"
                                   class="btn d-block w-25 mx-auto mt-5 btn-primary btn-lg px-3"><span
                                        class="spinner-grow"></span> Search</a>
                            </form>
                        </div>
                    </div>

                </div>
                <div class="tab-2 ac">
                    <label for="tab2-3">Get Verified</label>
                    <input id="tab2-3" name="tabs-two" type="radio">
                    <div>
                        <h4 class="bold-title">Get Your Account Verified</h4>
                        <p class="activity-story">The type of errand you can post is absolutely limitless, if
                            you
                            can think it you can post. you can get started and start
                            posting, select a category below to start posting</p>
                        <div class="px-lg-5">
                            <form action="/action_page.php">
                                <div class="form-group">
                                    <label for="" class="bold text-dark text-left pt-0 pb-0">Your Name</label>
                                    <input type="text" class="form-control form-control-lg mb-1" placeholder=""
                                           name="text1">
                                </div>
                                <div class="form-group">
                                    <label for="" class="bold text-dark text-left pt-0 pb-0">Phone
                                        Number</label>
                                    <input type="text" class="form-control form-control-lg mb-1" placeholder=""
                                           name="text1">
                                </div>
                                <div class="form-group">
                                    <label for="" class="bold text-dark text-left pt-0 pb-0">Email
                                        Address</label>
                                    <input type="text" class="form-control form-control-lg mb-1" placeholder=""
                                           name="text1">
                                </div>

                                <button type="submit"
                                        class="btn d-block w-25 mx-auto mt-5 btn-primary btn-lg px-3"><span
                                        class="spinner-grow"></span> Continue</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="tab-2 ad">
                    <label for="tab2-4">Join Us</label>
                    <input id="tab2-4" name="tabs-two" type="radio">
                    <div>
                        <h4 class="bold-title">Apply to Become a Merchant</h4>
                        <p class="activity-story">The type of errand you can post is absolutely limitless, if
                            you
                            can think it you can post. you can get started and start
                            posting, select a category below to start posting</p>
                        <div class="px-lg-5">
                            <form action="/action_page.php">
                                <div class="form-group">
                                    <label for="" class="bold text-dark text-left pt-0 pb-0">Your Name</label>
                                    <input type="text" class="form-control form-control-lg mb-1" placeholder=""
                                           name="text1">
                                </div>
                                <div class="form-group">
                                    <label for="" class="bold text-dark text-left pt-0 pb-0">Phone
                                        Number</label>
                                    <input type="text" class="form-control form-control-lg mb-1" placeholder=""
                                           name="text1">
                                </div>
                                <div class="form-group">
                                    <label for="" class="bold text-dark text-left pt-0 pb-0">Email
                                        Address</label>
                                    <input type="text" class="form-control form-control-lg mb-1" placeholder=""
                                           name="text1">
                                </div>

                                <button type="submit"
                                        class="btn d-block w-25 mx-auto mt-5 btn-primary btn-lg px-3"><span
                                        class="spinner-grow"></span> Apply</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="first-post-section">
        <div class="container">
            <div class="row section-post-first">
                <div class="col-md-6 image-block">
                    <img src="img/image2.jpeg" class="img-fluid post-imagee" alt="Responsive image">
                </div>
                <div class="col-md-6">
                    <div class="intro">
                        <h1 class="post-errand-head post-errand-head-extend"><span class="inner-heading">Post Your Errand</span> and let<br> someone do it for you</h1>
                        <p class="post-errand-paragraph">You don't have to do all the work by yourself, let someone ease you off the stress <a href="${pageContext.request.contextPath}/ControllerServlet?action=Link&type=Wallet" class="app-link">Download the Gofer App</a> now and start sending errands.</p>
                        <!-- <a href="#" class="btn btn-primary">Show me how</a> -->
                    </div>
                    <div class="post-list">
                        <ul class="post-errand-list">
                            <li>Describe the errand and the reward for the errand</li>
                            <li>Wait for someone to bid or negotiate</li>
                            <li>Accept or reject bids</li>
                            <li>Track errand and end errand after errand is successful</li>

                        </ul>
                    </div>
                </div>
            </div>
        </div> 
    </div>

    <div class="second-post-section">
        <div class="second-block">
            <div class="container">
                <div class="row section-post-second ">

                    <div class="col-md-6">
                        <div class="intro">
                            <h1 class="post-errand-head"><span class="inner-heading">Run Errands </span>for people <br>and earn cash</h1>
                            <p class="post-errand-paragraph">Search and bid for errands that you would like to run. Run errands and earn money after successful completion of the errand</p>
                        </div>
                        <div class="post-list">
                            <ul class="post-errand-list">
                                <li class="list-item-post">Search and bid for errands</li>
                                <li class="list-item-post">Wait to be accepted by the sender</li>
                                <li class="list-item-post">Run errand and end errand after completion</li>
                                <li class="list-item-post">Earn Money</li>

                            </ul>
                        </div>
                    </div>

                    <div class="col-md-6 image-block" >
                        <img src="img/image2.jpeg" class="img-fluid post-image" alt="Responsive image">
                    </div>

                </div>
            </div> 
        </div>
    </div>

    <div class="Third-post-section">
        <div class="container">
            <div class="row section-post-third">

                <div class="col-md-6 image-block">
                    <img src="img/image2.jpeg" class="img-fluid post-imagee" alt="Responsive image">
                </div>
                <div class="col-md-6">
                    <div class="intro">
                        <h1 class="post-errand-head post-errand-head-extend-1"><span class="inner-heading">Join us</span>, be part of the<br> team that run errands<br> for us</h1>
                        <p class="post-errand-paragraph">Running errands for us comes with special privileges. To join our team of errand runners you have to apply to be a special errand runner and all errands directed to Gofer will be assigned to our different errand runners in different regions</p>
                        <a href="#" class="btn btn-primary btn-apply">Apply Now</a>
                    </div>

                </div>
            </div>
        </div>
    </div> 

    <div class="wallet-section">
        <div class="container section-wallet">
            <div class="row">

                <hr class="wallet-line"><h1 class="wallet-heading inner-heading">Wallet</h1>

            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="wallet-card">
                        <div class="illustration-box">
                            <img src="img/mask.png" class="illustration" alt="record illustration">
                        </div>
                        <div class="wallet-body">
                            <h3 class="pri-text">My Wallet</h3>
                            <p class="sec-text">Post an errand with all the details needed to run the errand and the amount you are willing to pay errand.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="wallet-card">
                        <div class="illustration-box">
                            <img src="img/mask.png" class="illustration" alt="share illustration">
                        </div>
                        <div class="wallet-body">
                            <h3 class="pri-text">Wallet Pin</h3>
                            <p class="sec-text">Post an errand with all the details needed to run the errand and the amount you are willing to pay errand.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="wallet-card">
                        <div class="illustration-box">
                            <img src="img/mask.png" class="illustration" alt="voila illustration">
                        </div>
                        <div class="wallet-body">
                            <h3 class="pri-text">Escrow Account</h3>
                            <p class="sec-text">Post an errand with all the details needed to run the errand and the amount you are willing to pay errand.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="review-section">
        <div class="container">
            <div class="row  p-5 ">
                <div class="col-md-6 text-center"><img src="img/image2.jpeg" class="post-image post-image-fourth" alt="mobile view"></div>
                <div class="col-md-6 account-reviews intro pt-4">
                    <h3 class="post-errand-head">Account Reviews and account verification</h3>
                    <p class="post-errand-paragraph">Post an errand with all the details needed to run the errand and the amount you are willing
                        to pay errand runner. wait for runners to bid and then accept a runner based on review</p>
                </div>
            </div>
        </div>
    </div>

    <div class="get-started-outer">
        <div class="container">
            <div class="row p-5 get-started">
                <div class="get-it ">
                    <div class="col-xs-6 get-started-inside">
                        <div class="get-started-text">Start Posting Errands and Running Errands</div>


                    </div>
                    <div class="col-xs-6 get-started-btn-block">

                        <button class="get-started-btn">Get Started</button>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>

        <div class="container">
            <div class="row footer-left-block">
                <div class="col-md-4 p-3 footer-left-block">
                    <div class="footer-logo">
                        <img src="img/logo.png" class="logo-footer" alt="Logo">
                        <!-- <h1 class="header-footer-right">Gofer</h1> -->
                    </div>

                    <p class="footer-text">Stay Connected</p>
                    <ul class="social-list text-white">
                        <li class="footer-list-item"><i class="fa fa-instagram"></i></li>
                        <li class="footer-list-item"><i class="fa fa-twitter"></i></li>
                        <li class="footer-list-item"><i class="fa fa-linkedin"></i></li>
                        <li class="footer-list-item"><i class="fa fa-facebook"></i></li>

                    </ul>
                    <div class="info">
                        <p class="text-white the-info">@gofercompany</p>
                        <p class="text-white text-left-middle">For More Enquires or information contact</p>
                        <p class="info-text">info@gofercompany.com</p>
                    </div>
                </div>

                <div class="col-md-4 footer-middle-block  p-4">
                    <h1 class="link-title">Useful Links</h1>
                    <hr class="text-white footer-line">

                    <ul class="social-link-item text-white">
                        <a href="#"><li class="link-list">Become verified</li></a>
                        <a href="#"><li class="link-list">What is Gofer?</li></a>
                        <a href="#"><li class="link-list">Send Errands</li></a>
                        <a href="#"><li class="link-list">Post Errands</li></a>
                        <a href="#"><li class="link-list">How to use</li></a>
                    </ul>
                </div>

                <div class="col-md-4 footer-middle-block p-4">
                    <h1 class="link-title">Resources</h1>
                    <hr class="text-white footer-line">

                    <ul class="social-link-item text-white">
                        <a href="#"><li class="link-list">Terms & Conditions </li></a>
                        <a href="#"><li class="link-list">Help</li></a>
                        <a href="#"><li class="link-list">FAQ's</li></a>
                        <a href="#"><li class="link-list">Wallet Pin</li></a>
                        <a href="#"><li class="link-list">Escrow Account</li></a>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 text-center p-2 text-white bg-dark">
                <p>Copyright &copy; 2020</p>
            </div>
        </div>
    </footer>
    <!-- <div class="container-fluid">

    </div> -->
</div>
